import axios from "axios"
import QueryString from 'query-string'

const headers = {headers: {Accept: "application/json"}}

const headers_with_auth = {
    headers: {
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem('token')
    }
}

const PokemonURL = {
    pokemonList: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/pokemon/list", data, headers_with_auth)
    },
    pokemonLiked: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/pokemon/liked", data, headers_with_auth)
    },
    pokemon: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/pokemon/" + data, {}, headers_with_auth)
    },
    pokemonLike: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/pokemon/like/" + data, {}, headers_with_auth)
    },
}

export default PokemonURL