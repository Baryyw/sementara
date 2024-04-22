<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('v1')->group(function () {
    Route::post('/auth/register', [AuthController::class, 'register']);
    Route::post('/auth/login', [AuthController::class, 'login']);
    Route::middleware('auth:sanctum')->post('/auth/logout', [AuthController::class, 'logout']);
    Route::middleware('auth:sanctum')->post('/posts', [PostController::class, 'create']);
    Route::middleware('auth:sanctum')->delete('/posts/{id}', [PostController::class, 'delete']);
    Route::middleware('auth:sanctum')->get('/posts', [PostController::class, 'index']);
    Route::middleware('auth:sanctum')->post('/users/{username}/follow', [UserController::class, 'follow']);
    Route::middleware('auth:sanctum')->delete('/users/{username}/unfollow', [UserController::class, 'unfollow']);
    Route::middleware('auth:sanctum')->get('/following', [UserController::class, 'following']);
    Route::middleware('auth:sanctum')->put('/users/{username}/accept', [UserController::class, 'accept']);
    Route::middleware('auth:sanctum')->get('/users/{username}/followers', [UserController::class, 'getFollowers']);
    Route::middleware('auth:sanctum')->get('/users', [UserController::class, 'getUsers']);
    Route::middleware('auth:sanctum')->get('/users/{username}', [UserController::class, 'getUserDetail']);
});