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
                Trainer
              </n-breadcrumb-item>
            </n-breadcrumb>
          </n-gi>
        </n-grid>

        <br>
        <n-grid :x-gap="12" :y-gap="8" cols="10 s:12 m:6" item-responsive responsive="screen">
          <n-gi :offset="1" span="8 s:10 m:4">
            <n-card>
              <n-grid :x-gap="12" :y-gap="8" cols="1 s:7 m:7" item-responsive responsive="screen">
                <n-gi span="1 s:4 m:4">
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
                      </n-card>
                    </n-gi>

                    <n-gi v-if="!firstLoad">
                      <n-card hoverable>
                        <div class="align-items-center">
                          <n-image
                              width="200"
                              src="https://i.pinimg.com/originals/95/e6/35/95e6355e7c277c330defea0968935dfd.jpg"
                              preview-disabled
                          />
                        </div>
                        <br>
                        <n-h1>
                          <n-text>{{
                              user.first_name.charAt(0).toUpperCase() + user.first_name.slice(1).toLowerCase() + " " + user.last_name.charAt(0).toUpperCase() + user.last_name.slice(1).toLowerCase()
                            }}
                          </n-text>
                        </n-h1>

                        <n-h3 prefix="bar" type="warning" align-text>
                          <n-text type="primary">
                            Birthday:
                          </n-text>
                          <n-text>
                            {{ user.birthday }}
                          </n-text>
                        </n-h3>

                      </n-card>
                    </n-gi>
                  </n-grid>
                </n-gi>

                <n-gi span="1 s:3 m:3">
                  <n-grid :x-gap="12" :y-gap="8" cols="1">
                    <n-gi span="1">
                      <br>
                      <n-h3 align-text>
                        <n-text type="primary">
                          Liked
                        </n-text>
                        <n-icon color="#0e7a0d">
                          <like-filled/>
                        </n-icon>
                      </n-h3>

                      <n-layout>
                        <n-layout-content>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>

                          <n-grid :x-gap="12" :y-gap="8" cols="1 s:1 m:2" item-responsive responsive="screen">
                            <n-gi v-for="pokemon in user.pokemon_list" :span="pokemon.liked_by_user?1:0">
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
                                    <n-text v-else>
                                      {{ pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase() }}
                                    </n-text>
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

                        </n-layout-content>
                      </n-layout>
                    </n-gi>

                    <n-gi span="1">
                      <br>
                      <n-h3>
                        <n-text type="warning">
                          DisLiked
                        </n-text>
                        <n-icon color="#b07518">
                          <like-filled/>
                        </n-icon>
                      </n-h3>

                      <n-layout>
                        <n-layout-content>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>
                          <n-skeleton width="100%" :sharp="false" size="small" v-if="isLoading"
                                      style="margin-bottom: 10px"/>

                          <n-grid :x-gap="12" :y-gap="8" cols="1 s:1 m:2" item-responsive responsive="screen">
                            <n-gi v-for="pokemon in user.pokemon_list" :span="!pokemon.liked_by_user?1:0">
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
                                    <n-text v-else>
                                      {{ pokemon.name.charAt(0).toUpperCase() + pokemon.name.slice(1).toLowerCase() }}
                                    </n-text>
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
import AccountURL from "@/urls/AccountURL"
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
  props: ['id'],
  data() {
    return {
      user: [],
      isLoading: true,
      firstLoad: true,
      likes: [],
      dislikes: []
    }
  },
  methods: {
    liked(name, like) {
      PokemonURL.pokemonLiked({pokemon_name: name, liked: like})
          .then((response) => {
            this.user.pokemon_list = this.user.pokemon_list.map((pokemon) => {
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

              return pokemon
            })
          })
          .catch((error) => {
          })
    },
  },
  created() {
    document.title = "Trainer | Pokedex"
    AccountURL.user(this.id)
        .then((response) => {
          this.user = response.data.user
          this.firstLoad = false
          this.isLoading = false
        })
        .catch((error) => {
          this.user = response.data.user
          this.firstLoad = false
          this.isLoading = false
        })
  },
  name: "TrainerView"
}
</script>

<style scoped>

</style>