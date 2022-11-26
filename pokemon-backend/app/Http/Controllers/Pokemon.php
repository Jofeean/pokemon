<?php

namespace App\Http\Controllers;

use App\Models\PokemonLike;
use GuzzleHttp\Client;
use Illuminate\Http\Request;

class Pokemon extends Controller
{
    public function list(Request $request)
    {
        $endpoint = "https://pokeapi.co/api/v2/pokemon";
        $query = ['query' => []];
        if ($request->has('offset')) {
            $query = ['query' => [
                'offset' => $request->offset,
            ]];
        }
        $client = new Client();
        $response = $client->request('GET', $endpoint, $query);
        $data = json_decode($response->getBody());

        $data->results = array_map(function ($result) use ($client) {
            $response = $client->request('GET', $result->url);
            $response2 = $client->request('GET', "https://pokeapi.co/api/v2/pokemon/" . $result->name);

            $data = json_decode($response->getBody());
            $data2 = json_decode($response2->getBody());

            $liked = PokemonLike::where('pokemon', $result->name)
                ->where('user_id', auth()->guard('api')->user()->id)
                ->first();

            return [
                'url' => $result->url,
                'name' => $result->name,
                'species' => $data->species->name,
                'liked' => $liked ? $liked->liked : 2,
                'image' => $data2->sprites->front_default,
                'like' => PokemonLike::where('pokemon', $result->name)->where('liked', true)->count(),
                'dislike' => PokemonLike::where('pokemon', $result->name)->where('liked', false)->count()
            ];
        }, $data->results);

        return json_encode($data);
    }

    public function liked(Request $request)
    {
        $request->validate([
            'pokemon_name' => 'required|string',
            'liked' => 'required|boolean'
        ]);

        $liked = PokemonLike::where('pokemon', $request->pokemon_name)
            ->where('user_id', auth()->guard('api')->user()->id)->first();

        if ($liked) {
            $liked->liked = $request->liked;
            $liked->save();
        } else {
            $liked = new PokemonLike();
            $liked->pokemon = $request->pokemon_name;
            $liked->user_id = auth()->guard('api')->user()->id;
            $liked->liked = $request->liked;
            $liked->save();
        }

        return response(['message' => 'success']);
    }

    public function pokemon($name)
    {
        $endpoint = "https://pokeapi.co/api/v2/pokemon/" . $name;
        $client = new Client();
        $response = $client->request('GET', $endpoint);
        $data = json_decode($response->getBody());

        $liked = PokemonLike::where('pokemon', $name)
            ->where('user_id', auth()->guard('api')->user()->id)
            ->first();

        $data->abilities = array_map(function ($ability) use ($client) {
            $response = $client->request('GET', $ability->ability->url);
            $data = json_decode($response->getBody());

            return [
                'name' => $ability->ability->name,
                'effect' => $data->effect_entries[0]->effect
            ];
        }, $data->abilities);

        $data->moves = array_map(function ($move) use ($client) {
            $response = $client->request('GET', $move->move->url);
            $data = json_decode($response->getBody());

            return [
                'name' => $move->move->name,
                'effect' => $data->effect_entries[0]->effect,
                'short_effect' => $data->effect_entries[0]->short_effect,
            ];
        }, $data->moves);

        $data->liked = $liked ? $liked->liked : 2;
        $data->like = PokemonLike::where('pokemon', $name)->where('liked', true)->count();
        $data->dislike = PokemonLike::where('pokemon', $name)->where('liked', false)->count();
        $data->image = $data->sprites->front_default;

        return json_encode($data);
    }

    public function like($name)
    {
        $data['dislike'] = PokemonLike::with('user')->where('pokemon', $name)->where('liked', false)->get();
        $data['like'] = PokemonLike::with('user')->where('pokemon', $name)->where('liked', true)->get();

        return json_encode($data);
    }
}
