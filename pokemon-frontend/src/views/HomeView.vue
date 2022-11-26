<template>
  <n-space vertical size="large">
    <n-layout>
      <NavigationComponent/>
      <n-layout-content>
        <br>

        <n-grid :x-gap="12" :y-gap="8" cols="10 s:12 m:6" item-responsive responsive="screen">
          <n-gi :offset="1" span="8 s:10 m:4">
            <n-breadcrumb>
              <n-breadcrumb-item>
                Pokemons
              </n-breadcrumb-item>
            </n-breadcrumb>
          </n-gi>
        </n-grid>

        <br>
        <n-grid :x-gap="12" :y-gap="8" cols="10 s:12 m:6" item-responsive responsive="screen">
          <n-gi :offset="1" span="8 s:10 m:4">
            <n-card>
              <n-grid :x-gap="12" :y-gap="8" :cols="1">
                <n-gi>
                  <n-grid :x-gap="12" :y-gap="8" cols="1 s:2 m:4" item-responsive responsive="screen">
                    <n-gi v-for="index in 20" v-if="firstLoad">
                      <n-card>
                        <div class="align-items-center">
                          <n-skeleton height="150px" width="50%"/>
                        </div>
                        <n-h1>
                          <n-skeleton :width="146" :sharp="false" size="large"/>
                        </n-h1>
                        <n-h3>
                          <n-skeleton :width="120" :sharp="false" size="medium"/>
                        </n-h3>
                        <div class="align-items-right">
                          <n-skeleton :width="120" :sharp="false" size="small"/>
                        </div>
                      </n-card>
                    </n-gi>

                    <n-gi v-for="pokemon in pokemons">
                      <n-card hoverable>
                        <router-link :to="'/pokemon/'+pokemon.name.toLowerCase()">
                          <div class="align-items-center">
                            <n-image
                                width="100"
                                :src="pokemon.image"
                                preview-disabled
                            />
                          </div>
                          <br>
                          <n-h1>
                            <n-skeleton v-if="isLoading" :width="146" :sharp="false" size="large"/>
                            <n-text v-else>{{ pokemon.name }}</n-text>
                          </n-h1>
                        </router-link>

                        <n-h3 prefix="bar" type="warning" align-text>
                          <n-skeleton v-if="isLoading" :width="120" :sharp="false" size="medium"/>
                          <n-text type="primary" v-else>
                            {{ pokemon.species }}
                          </n-text>
                        </n-h3>

                        <div class="align-items-right">

                          <n-skeleton v-if="isLoading" :width="120" :sharp="false" size="small"/>

                          <n-button quaternary round type="primary" size="medium" v-if="!isLoading"
                                    :disabled="pokemon.liked == 1"
                                    @click="liked(pokemon.name, true)">
                            <template #icon>
                              <n-icon>
                                <like v-if="pokemon.liked == 2||pokemon.liked == 0"/>
                                <like-filled v-if="pokemon.liked == 1"/>
                              </n-icon>
                            </template>
                            {{ pokemon.like }}
                          </n-button>

                          <n-button quaternary round type="warning" size="medium" v-if="!isLoading"
                                    :disabled="pokemon.liked == 0"
                                    @click="liked(pokemon.name, false)">
                            <template #icon>
                              <n-icon>
                                <dislike v-if="pokemon.liked == 2||pokemon.liked == 1"/>
                                <dislike-filled v-if="pokemon.liked == 0"/>
                              </n-icon>
                            </template>
                            {{ pokemon.dislike }}
                          </n-button>
                        </div>
                      </n-card>
                    </n-gi>
                  </n-grid>
                </n-gi>

                <n-gi class="align-items-center" style="margin-top: 20px">
                  <n-pagination v-model:page="page" :page-count="100" size="large" :on-update:page="pagination"
                                :item-count="total_items" :page-size="20" :page-slot="5" show-quick-jumper>
                    <template #goto>
                      Go!
                    </template>
                  </n-pagination>
                </n-gi>
              </n-grid>
            </n-card>
          </n-gi>
        </n-grid>

        <br><br><br>

      </n-layout-content>
    </n-layout>
  </n-space>
</template>

<script>
import NavigationComponent from '../components/NavigationComponent'
import PokemonURL from "@/urls/PokemonURL"
import {
  ThumbDislike20Filled as DislikeFilled,
  ThumbLike20Filled as LikeFilled,
  ThumbDislike20Regular as Dislike,
  ThumbLike20Regular as Like
} from '@vicons/fluent'
import {
  NSpace,
  NLayout,
  NLayoutHeader,
  NLayoutContent,
  NBreadcrumb,
  NBreadcrumbItem,
  NGrid,
  NGi,
  NCard,
  NH1,
  NPagination,
  NButton,
  NIcon,
  NSkeleton,
  NH3,
  NText,
  NImage
} from 'naive-ui'

export default {
  components: {
    DislikeFilled,
    LikeFilled,
    Dislike,
    Like,
    NSpace,
    NLayout,
    NLayoutHeader,
    NLayoutContent,
    NavigationComponent,
    NBreadcrumb,
    NBreadcrumbItem,
    NGrid,
    NGi,
    NCard,
    NH1,
    NPagination,
    NButton,
    NIcon,
    NSkeleton,
    NH3,
    NText,
    NImage
  },
  data() {
    return {
      pokemons: '',
      page: 1,
      total_items: 0,
      isLoading: true,
      firstLoad: true
    }
  },
  methods: {
    pagination(number) {
      this.page = number
      this.isLoading = true
      PokemonURL.pokemonList({offset: number == 1 ? 0 : 20 * (number - 1)})
          .then((response) => {
            this.total_items = response.data.count
            this.pokemons = response.data.results.map((pokemon) => {
              return {
                name: pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase(),
                species: pokemon.species.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase(),
                url: pokemon.url,
                like: pokemon.like,
                liked: pokemon.liked,
                dislike: pokemon.dislike,
                image: pokemon.image
              }
            })
            this.isLoading = false
          })
          .catch((error) => {
            this.isLoading = false
          })
    },
    liked(name, like) {
      PokemonURL.pokemonLiked({pokemon_name: name, liked: like})
          .then((response) => {

            this.pokemons.map((pokemon) => {

              pokemon.name = pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase()
              pokemon.species = pokemon.species.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase()
              pokemon.url = pokemon.url
              pokemon.image = pokemon.image

              if (pokemon.name == name) {
                pokemon.liked = like
                if (like) {
                  pokemon.like += 1
                  pokemon.dislike = pokemon.dislike > 0 ? pokemon.dislike - 1 : 0
                } else {
                  pokemon.like = pokemon.like > 0 ? pokemon.like - 1 : 0
                  pokemon.dislike += 1
                }
              }
            })
          })
          .catch((error) => {
          })
    },
  },
  created() {
    document.title = "Home | Pokedex"
    PokemonURL.pokemonList()
        .then((response) => {
          this.total_items = response.data.count
          this.pokemons = response.data.results.map((pokemon) => {
            return {
              name: pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase(),
              species: pokemon.species.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase(),
              url: pokemon.url,
              like: pokemon.like,
              liked: pokemon.liked,
              image: pokemon.image,
              dislike: pokemon.dislike
            }
          })
          this.isLoading = false
          this.firstLoad = false
        })
        .catch((error) => {
          this.isLoading = false
          this.firstLoad = false
        })
  },
  name: "HomeView"
}
</script>

<style scoped>

</style>