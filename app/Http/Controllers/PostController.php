<?php

namespace App\Http\Controllers;

use App\Models\Attachments;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $page = $request->has('page') ? max(0, intval($request->page)) : 0;
        $size = $request->has('size') ? max(1, intval($request->size)) : 10;
    
        $validaition = Validator::make($request->all(), [
            'size' => 'numeric|min:1',
            'page' => 'numeric|min:0'
        ]);

        if($validaition->fails()){
            return response()->json([
                'message' => 'Invalid Field',
                'errors' => $validaition->errors()
            ], 422);
        }

        $post = Post::with(['user', 'attachments'])
            ->when($page >= 0, function($query) use ($page, $size){
                return $query->skip($page * $size)->take($size);
            })
            ->get();
        return response()->json([
            'page' => $page,
            'size' => $size,
            'posts' => $post
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $validaition = Validator::make($request->all(), [
            'caption' => 'required',
            'attachments.*' => 'image|mimes:jpg,jpeg,webp,png,gif|max:2048', // Max size 2048 KB (2MB)
        ], [
            'attachments.required' => 'Attachments are required.',
            'attachments.array' => 'Attachments must be an array.',
            'attachments.*.image' => 'Attachments must be an image file.',
            'attachments.*.mimes' => 'Attachments must be of type: jpg, jpeg, webp, png, gif.',
            'attachments.*.max' => 'Attachments may not be greater than 2048 KB (2MB) in size.',
        ]);

        if ($validaition->fails()) {
            return response()->json([
                'message' => $validaition->errors()
            ]);
        }
        $createPost = Post::create([
            'caption' => $request->caption,
            'user_id' => $request->user()->id
        ]);
        $paths = [];
        $i = 0;
        foreach ($request->file('attachments') as $file) {
            $paths[] = $file->store('uploads');
            $createAttachments = Attachments::create([
                'storage_path' => $paths[$i],
                'posts_id' => $createPost->id
            ]);
            $i = $i + 1;
        }

        return response()->json(['message' => 'Create post success']);
    }

    public function delete(Request $request, string $id){
        $data = Post::find($id);
        $user = $request->user();
        if(!$data){
            return response()->json([
                'message' => "Post Not Found"
            ],404);
        }

        if($data->user_id != $user->id){
            return response([
                'message' => 'Forbiden Access'
            ], 403);
        }
        $data->delete();
        return response()->json([], 204);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
    }
}
