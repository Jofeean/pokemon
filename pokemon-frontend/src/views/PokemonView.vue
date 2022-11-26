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
                <router-link to="/home">
                  Pokemons
                </router-link>
              </n-breadcrumb-item>
              <n-breadcrumb-item>
                {{ name.charAt(0).toUpperCase() + name.slice(1).toLowerCase() }}
              </n-breadcrumb-item>
            </n-breadcrumb>
          </n-gi>
        </n-grid>

        <br>
        <n-grid :x-gap="12" :y-gap="8" cols="10 s:12 m:6" item-responsive responsive="screen">
          <n-gi :offset="1" span="8 s:10 m:4">
            <n-card>
              <n-grid :x-gap="12" :y-gap="8" cols="1 s:7 m:7" item-responsive responsive="screen">
                <n-gi span="1 s:5 m:4">
                  <n-grid :x-gap="12" :y-gap="8" cols="1" item-responsive responsive="screen">
                    <n-gi v-if="firstLoad">
                      <n-card>
                        <div class="align-items-center">
                          <n-skeleton height="200px" width="50%"/>
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
                        <n-divider/>
                        <n-h3>
                          <n-skeleton :width="200" :sharp="false" size="medium"/>
                        </n-h3>
                        <n-h4>
                          <n-skeleton :width="160" :sharp="false" size="small"/>
                        </n-h4>
                        <n-skeleton text :repeat="2"/>
                        <n-skeleton text style="width: 60%"/>
                        <n-h4>
                          <n-skeleton :width="150" :sharp="false" size="small"/>
                        </n-h4>
                        <n-skeleton text :repeat="2"/>
                        <n-skeleton text style="width: 60%"/>
                        <n-h3>
                          <n-skeleton :width="120" :sharp="false" size="medium"/>
                        </n-h3>
                        <n-h4>
                          <n-skeleton :width="150" :sharp="false" size="small"/>
                        </n-h4>
                        <n-skeleton text :repeat="2"/>
                        <n-skeleton text style="width: 60%"/>
                        <n-h4>
                          <n-skeleton :width="150" :sharp="false" size="small"/>
                        </n-h4>
                        <n-skeleton text :repeat="2"/>
                        <n-skeleton text style="width: 60%"/>
                      </n-card>
                    </n-gi>

                    <n-gi v-if="!firstLoad">
                      <n-card hoverable>
                        <div class="align-items-center">
                          <n-image
                              width="200"
                              :src="pokemon.image"
                              preview-disabled
                          />
                        </div>
                        <br>
                        <n-h1>
                          <n-text>{{
                              pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase()
                            }}
                          </n-text>
                        </n-h1>

                        <n-h3 prefix="bar" type="warning" align-text>
                          <n-text type="primary">
                            {{ pokemon.species.name }}
                          </n-text>
                        </n-h3>

                        <div class="align-items-right">

                          <n-button quaternary round type="primary" size="medium" :disabled="pokemon.liked == 1"
                                    @click="liked(pokemon.name, true)">
                            <template #icon>
                              <n-icon>
                                <like v-if="pokemon.liked == 2||pokemon.liked == 0"/>
                                <like-filled v-if="pokemon.liked == 1"/>
                              </n-icon>
                            </template>
                            {{ pokemon.like }}
                          </n-button>

                          <n-button quaternary round type="warning" size="medium" :disabled="pokemon.liked == 0"
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

                        <n-divider/>

                        <n-h3 prefix="bar" type="primary" align-text>
                          <n-text type="warning">
                            Abilities
                          </n-text>
                        </n-h3>

                        <div style="padding: 20px" v-for="ability in pokemon.abilities">
                          <n-h4 class="align-items-right">
                            <n-text type="info">
                              {{ ability.name.charAt(0).toUpperCase() + ability.name.slice(1).toLowerCase() }}
                            </n-text>
                          </n-h4>
                          <n-p>{{ ability.effect }}</n-p>
                        </div>

                        <n-h3 prefix="bar" type="primary" align-text>
                          <n-text type="warning">
                            Moves
                          </n-text>
                        </n-h3>

                        <div style="padding: 20px" v-for="move in pokemon.moves">
                          <n-h4 class="align-items-right">
                            <n-text type="info">
                              {{ move.name.charAt(0).toUpperCase() + move.name.slice(1).toLowerCase() }}
                            </n-text>
                          </n-h4>
                          <n-h6>Effect:</n-h6>
                          <n-p>{{ move.effect }}</n-p>
                          <n-h6>Short Effect:</n-h6>
                          <n-p>{{ move.effect }}</n-p>
                        </div>

                      </n-card>
                    </n-gi>
                  </n-grid>
                </n-gi>

                <n-gi span="1 s:2 m:3">
                  <n-grid :x-gap="12" :y-gap="8" cols="1 s:1 m:2" item-responsive responsive="screen">
                    <n-gi span="1 s:1 m:1">
                      <n-h3>
                        <n-text type="primary">
                          Liked
                        </n-text>
                        <n-icon color="#0e7a0d">
                          <like-filled/>
                        </n-icon>
                      </n-h3>

                      <n-layout>
                        <n-layout-content>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>

                          <div v-for="like in likes" v-if="!isLoading2" style="margin-bottom: 2px">
                            <router-link :to="'/trainer/'+like.user.id">
                              <n-button text target="_blank" type="info">
                                {{
                                  like.user.first_name.charAt(0).toUpperCase() + like.user.first_name.slice(1).toLowerCase() + ' ' +
                                  like.user.last_name.charAt(0).toUpperCase() + like.user.last_name.slice(1).toLowerCase()
                                }}
                              </n-button>
                            </router-link>
                            <br>
                          </div>

                        </n-layout-content>
                      </n-layout>
                    </n-gi>

                    <n-gi span="1 s:1 m:1">
                      <n-h3>
                        <n-text type="warning">
                          Disliked
                        </n-text>
                        <n-icon color="#b07518">
                          <dislike-filled/>
                        </n-icon>
                      </n-h3>

                      <n-layout>
                        <n-layout-content>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading2"
                                      style="margin-bottom: 10px"/>

                          <div v-for="dislike in dislikes" v-if="!isLoading2" style="margin-bottom: 2px">
                            <router-link :to="'/trainer/'+dislike.user.id">
                              <n-button text target="_blank" type="info">
                                {{
                                  dislike.user.first_name.charAt(0).toUpperCase() + dislike.user.first_name.slice(1).toLowerCase() + ' ' +
                                  dislike.user.last_name.charAt(0).toUpperCase() + dislike.user.last_name.slice(1).toLowerCase()
                                }}
                              </n-button>
                            </router-link>
                            <br>
                          </div>
                        </n-layout-content>
                      </n-layout>
                    </n-gi>
                  </n-grid>
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
  NSpace, NLayout, NLayoutHeader, NLayoutContent, NBreadcrumb, NBreadcrumbItem, NGrid, NGi, NCard, NH1, NButton, NIcon,
  NSkeleton, NH3, NText, NImage, NDivider, NH4, NH5, NP, NH6, NUl, NLi
} from 'naive-ui'

export default {
  components: {
    DislikeFilled, LikeFilled, Dislike, Like, NSpace, NLayout, NLayoutHeader, NLayoutContent, NavigationComponent,
    NBreadcrumb, NBreadcrumbItem, NGrid, NGi, NCard, NH1, NButton, NIcon, NSkeleton, NH3, NText, NImage, NDivider, NH4,
    NH5, NP, NH6, NUl, NLi
  },
  props: ['name'],
  data() {
    return {
      pokemon: [],
      isLoading: true,
      isLoading2: true,
      firstLoad: true,
      likes: [],
      dislikes: []
    }
  },
  methods: {
    liked(name, like) {
      PokemonURL.pokemonLiked({pokemon_name: name, liked: like})
          .then((response) => {
            this.pokemon.liked = like
            if (like) {
              this.pokemon.like += 1
              this.pokemon.dislike = this.pokemon.dislike > 0 ? this.pokemon.dislike - 1 : 0
            } else {
              this.pokemon.like = this.pokemon.like > 0 ? this.pokemon.like - 1 : 0
              this.pokemon.dislike += 1
            }
          })
          .catch((error) => {
          })
    },
  },
  created() {
    document.title = this.name.charAt(0).toUpperCase() + this.name.slice(1).toLowerCase() + " | Pokedex"
    PokemonURL.pokemon(this.name)
        .then((response) => {
          this.pokemon = response.data
          this.isLoading = false
          this.firstLoad = false
        })
        .catch((error) => {
          this.isLoading = false
          this.firstLoad = false
        })
    PokemonURL.pokemonLike(this.name)
        .then((response) => {
          this.likes = response.data.like.filter((user) => {
            return user.user_id != JSON.parse(localStorage.getItem('user')).id
          })
          this.dislikes = response.data.dislike.filter((user) => {
            return user.user_id != JSON.parse(localStorage.getItem('user')).id
          })

          this.isLoading2 = false
        })
        .catch((error) => {
          this.isLoading2 = false
        })
  },
  name: "PokemonView"
}
</script>

<style scoped>

</style>