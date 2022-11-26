import {createRouter, createWebHistory, RouteRecordRaw} from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import PokemonView from '../views/PokemonView.vue'
import TrainerView from '../views/TrainerView.vue'
import UpdateView from '../views/UpdateView.vue'
import RegistrationView from '../views/RegistrationView.vue'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'login',
        component: LoginView,
        beforeEnter: (to, from, next) => {
            if (localStorage.getItem('token')) next({name: 'home'})
            else next()
        }
    },
    {
        path: '/registration',
        name: 'registration',
        component: RegistrationView,
        beforeEnter: (to, from, next) => {
            if (localStorage.getItem('token')) next({name: 'home'})
            else next()
        }
    },
    {
        path: '/home',
        name: 'home',
        component: HomeView,
        beforeEnter: (to, from, next) => {
            if (!localStorage.getItem('token')) next({name: 'login'})
            else next()
        }
    },
    {
        path: '/pokemon/:name',
        name: 'pokemon',
        props: true,
        component: PokemonView,
        beforeEnter: (to, from, next) => {
            if (!localStorage.getItem('token')) next({name: 'login'})
            else next()
        }
    },
    {
        path: '/trainer/:id',
        name: 'trainer',
        props: true,
        component: TrainerView,
        beforeEnter: (to, from, next) => {
            if (!localStorage.getItem('token')) next({name: 'login'})
            else next()
        }
    },
    {
        path: '/user/update/:id',
        name: 'user-update',
        props: true,
        component: UpdateView,
        beforeEnter: (to, from, next) => {
            if (!localStorage.getItem('token')) next({name: 'login'})
            else next()
        }
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
