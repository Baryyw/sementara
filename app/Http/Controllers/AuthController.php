<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; // Add this line
use Illuminate\Support\Facades\Redis;
use Symfony\Component\HttpFoundation\Cookie;

class AuthController extends Controller
{
    public function register(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'full_name' => 'required',
            'bio' => 'required|max:100',
            'username' => 'required|min:3|unique:users,username|regex:/^[a-zA-Z0-9_\.]+$/',
            'password' => 'required|min:6',
            'is_private' => 'boolean'
        ]);

        // Check if validation fails
        if ($validation->fails()) {
            return response()->json([
                'message' => 'Invalid field',
                'errors' => $validation->errors()
            ], 422);
        }

        // Create the user
        $user = User::create([
            'full_name' => $request->full_name,
            'username' => $request->username,
            'password' => bcrypt($request->password), // Hash the password
            'bio' => $request->bio,
            'is_private' => $request->is_private
        ]);

        // Generate token for the user
        $token = $user->createToken('Token')->plainTextToken;

        return response()->json([
            'message' => 'Register Success',
            'token' => $token,
            'user' => $user
        ], 201);
    }
    public function login(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'username' => 'required',
            'password' => 'required'
        ]);

        if ($validation->fails()) {
            return response()->json([
                'message' => 'Invalid field',
                'errors' => $validation->errors()
            ], 422);
        }

        if(!Auth::attempt(['username' => $request->username, 'password' => $request->password])){
            return response()->json([
                'message' => 'Wrong username or password',
            ], 401);
        }

        $token = $request->user()->createToken('Token')->plainTextToken;
        $cookie = cookie('Access Token', $token, 60 * 24);

        return response()->json([
            'message' => 'Login Success',
            'token' => $token,
            'user' => auth()->user()
        ], 200)->withCookie($cookie);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        $cookie = Cookie::forget('Access Token');
        return response()->json([
            'message' => 'Logout Success'
        ], 200);
    }
    public function authToken(Request $request)
    {
        return;
    }
}
