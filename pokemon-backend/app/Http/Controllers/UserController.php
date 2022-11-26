<?php

namespace App\Http\Controllers;

use App\Models\PokemonLike;
use App\Models\User;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'birthday' => 'required|string|date_format:Y-m-d|before:now',
            'email' => 'required|string|email|unique:users,email',
            'password' => 'required|string',
            'confirm_password' => 'required|string|same:password',
        ]);

        $user = new User();
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->birthday = $request->birthday;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->save();

        $token = $user->createToken('accessToken')->accessToken;

        return response([
            'message' => "success",
            'user_profile' => $user,
            'token' => $token
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::with('pokemons')->find($id);

        $endpoint = "https://pokeapi.co/api/v2/pokemon/";
        $client = new Client();

        $user->pokemon_list = $user->pokemons->map(function ($pokemon) use ($client, $endpoint) {
            $response = $client->request('GET', $endpoint . strtolower($pokemon->pokemon));
            $data = json_decode($response->getBody());

            $liked = PokemonLike::where('pokemon', $pokemon->pokemon)
                ->where('user_id', auth()->guard('api')->user()->id)
                ->first();

            return [
//                'url' => $data->url,
                'name' => $data->name,
                'species' => $data->species->name,
                'liked' => $liked ? $liked->liked : 2,
                'liked_by_user' => $pokemon->liked,
                'image' => $data->sprites->front_default,
                'like' => PokemonLike::where('pokemon', $pokemon->pokemon)->where('liked', true)->count(),
                'dislike' => PokemonLike::where('pokemon', $pokemon->pokemon)->where('liked', false)->count()
            ];
        });

        return response([
            'user' => $user
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'birthday' => 'required|string|date_format:Y-m-d|before:now',
        ]);

        $user = User::find($id);
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->birthday = $request->birthday;
        $user->save();

        $token = $user->createToken('accessToken')->accessToken;

        return response([
            'message' => "success",
            'token' => $token,
            'user_profile' => $user
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        if (!Auth::guard('web')->attempt(['email' => $request->email, 'password' => $request->password])) {
            return response([
                'errors' => ['password' => ['Wrong email/password.']]
            ], 422);
        }

        $token = auth()->user()->createToken("accessToken")->accessToken;
        return response([
            'message' => 'success',
            'user_profile' => auth()->user(),
            'token' => $token
        ]);
    }
}
