<?php

namespace App\Http\Controllers;

use App\Models\User;
use Dotenv\Util\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use \App\Models\Follow;

class UserController extends Controller
{
    public function follow(Request $request)
    {
        $followingUser = User::where('username', $request->username)->first();
        if (!$followingUser) {
            return response()->json([
                'message' => 'User Not Found'
            ], 404);
        }

        if ($followingUser->id == $request->user()->id) {
            return response()->json([
                'message' => 'You are not allowed to follow yourself'
            ]);
        }

        $hasFollow = Follow::where('follower_id', $request->user()->id)->where('following_id', $followingUser->id)->first();

        if ($hasFollow) {
            return response()->json([
                'message' => 'You Already Followed',
                'status' => ($hasFollow->is_accepted == 1) ? 'following' : 'requested'
            ]);
        }
        $follow = Follow::create([
            'follower_id' => $request->user()->id,
            'following_id' => $followingUser->id,
            'is_accepted' => ($followingUser->is_private == 0) ? 1 : 0
        ]);

        return response()->json([
            'message' => 'Follow Success',
            'status' => ($followingUser->is_private == 0) ? 'following' : 'requested'
        ], 200);
    }
    public function unfollow(Request $request)
    {
        $followingUser = User::where('username', $request->username)->first();
        if (!$followingUser) {
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }
        $follow = Follow::where('follower_id', $request->user()->id)->where('following_id', $followingUser->id)->first();

        if (!$follow) {
            return response()->json([
                'message' => 'You are not following the user'
            ], 422);
        }

        $follow->delete();
        return response()->json([], 204);
    }
    public function following(Request $request)
    {
        $following = Follow::where('follower_id', $request->user()->id)->get();
        if (!$following) {
            return response()->json(['following' => []], 200);
        }

        $followingUser = [];

        foreach ($following as $user) {
            $userInfo = User::find($user->following_id);
            $followingUser[] = [
                'id' => $user->id,
                'full_name' => $userInfo->full_name,
                'username' => $userInfo->username,
                'bio' => $userInfo->bio,
                'is_private' => $userInfo->is_private,
                'created_at' => $userInfo->created_at,
                'is_accepted' => ($user->is_accepted == 1) ? true : false,
            ];
        }

        return response()->json(['following' => $followingUser], 200);
    }

    public function accept(Request $request)
    {
        $user = User::where('username', $request->username)->first();
        if (!$user) {
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }

        $follower = Follow::where('following_id', $request->user()->id)->where('follower_id', $user->id)->first();

        if (!$follower) {
            return response()->json([
                'message' => 'The user is not following you'
            ], 422);
        }

        if ($follower->is_accepted == 1) {
            return response()->json([
                'message' => 'follow request is already accepted'
            ], 422);
        }
        $follower->update([
            'is_accepted' => 1
        ]);

        return response()->json([
            'message' => 'Follow request accepted'
        ], 200);
    }
    public function getFollowers(Request $request)
    {
        $user = User::where('username', $request->username)->first();
        if (!$user) {
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }
        $followers = Follow::where('following_id', $user->id)->get();
        if (!$followers) {
            return response()->json(['followers' => []], 200);
        }

        // return $followers;
        $followersUser = [];

        foreach ($followers as $user) {
            $userInfo = User::find($user->follower_id);
            $followersUser[] = [
                'id' => $user->id,
                'full_name' => $userInfo->full_name,
                'username' => $userInfo->username,
                'bio' => $userInfo->bio,
                'is_private' => $userInfo->is_private,
                'created_at' => $userInfo->created_at,
                'is_accepted' => ($user->is_accepted == 1) ? true : false,
            ];
        }

        return response()->json(['followers' => $followersUser], 200);
    }

    public function getUsers(Request $request)
    {
        $userId = $request->user()->id;
        $usersNotFollowed = User::whereNotIn('id', function($query) use ($userId) {
            $query->select('following_id')->from('follows')->where('follower_id', $userId);
        })->where('id', '!=', $userId)
        ->get();

        return response()->json([
            'users' => $usersNotFollowed
        ], 200);
    }

    public function getUserDetail(Request $request)
    {
        $user = User::with('post.attachments')
            ->where('username', $request->username)
            ->first();
        if(!$user){
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }
        $following = Follow::where('follower_id', $request->user()->id)->where('following_id', $user->id)->first();
        if(!$following){
            $status = 'not-following';
        }else if($following->is_accepted == 1){
            $status = 'following';
        }else{
            $status = 'requested';
        }

        $follower = Follow::where('following_id', $user->id);
        $following = Follow::where('follower_id', $user->id);

        $response = [
            'id' => $user->id,
            'full_name' => $user->full_name,
            'username' => $user->username,
            'bio' => $user->bio,
            'is_private' => $user->is_private,
            'is_your_account' => ($user->id == $request->user()->id) ? true : false,
            'following_status' => $status,
            'posts_count' => $user->post->count(),
            'followers_count' => $follower->count(),
            'following_count' => $following->count(),
            'posts' => $user->post
        ];
        return response()->json($response, 200);
    }
}
