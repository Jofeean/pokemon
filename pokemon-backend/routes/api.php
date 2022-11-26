<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::post('/user', [\App\Http\Controllers\UserController::class, 'store']);
Route::post('/login', [\App\Http\Controllers\UserController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::post('/pokemon/list', [\App\Http\Controllers\Pokemon::class, 'list']);
    Route::post('/pokemon/liked', [\App\Http\Controllers\Pokemon::class, 'liked']);
    Route::post('/pokemon/{name}', [\App\Http\Controllers\Pokemon::class, 'pokemon']);
    Route::post('/pokemon/like/{name}', [\App\Http\Controllers\Pokemon::class, 'like']);
    Route::post('/user/{id}', [\App\Http\Controllers\UserController::class, 'show']);
    Route::post('/user/update/{id}', [\App\Http\Controllers\UserController::class, 'update']);
});

