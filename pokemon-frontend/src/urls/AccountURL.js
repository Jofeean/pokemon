import axios from "axios"

const headers = {headers: {Accept: "application/json"}}

const headers_with_auth = {
    headers: {
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem('token')
    }
}

const AccountURL = {
    register: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/user", data, headers)
    },
    login: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/login", data, headers)
    },
    user: (data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/user/" + data, {}, headers_with_auth)
    },
    update: (id, data) => {
        return axios.post(process.env.VUE_APP_BASE_URL + "/user/update/" + id, data, headers_with_auth)
    },
}

export default AccountURL