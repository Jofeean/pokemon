<template>
  <br><br>
  <n-grid :x-gap="12" :y-gap="8" cols="10 s:6 m:3" item-responsive responsive="screen">
    <n-gi offset="1" span="8 s:4 m:1">
      <n-card title="Login">

        <n-form-item label="Email" size="large" :feedback="login_errors.email.message"
                     :validation-status="login_errors.email.status">
          <n-input type="email" placeholder="Input email" v-model:value="login_data.email"/>
        </n-form-item>

        <n-form-item label="Password" size="large" :feedback="login_errors.password.message"
                     :validation-status="login_errors.password.status">
          <n-input type="password" placeholder="Input password" v-model:value="login_data.password"/>
        </n-form-item>

        <n-divider/>

        <n-grid :x-gap="6" :y-gap="8" cols="4" item-responsive responsive="screen">
          <n-gi class="align-items-right align-items-v-center" span="4 s:1" offset="0 s:2">
            <router-link to="/registration">
              <n-button
                  text
                  tag="a"
                  target="_blank"
                  type="primary"
              >
                Don't have an account?
              </n-button>
            </router-link>
          </n-gi>

          <n-gi class="align-items-right" span="4 s:1">
            <n-button type="primary" size="large" round icon-placement="right" @click="login" :secondary="isLoading"
                      :disabled="isLoading">
              Login
              <template #icon v-if="!isLoading">
                <n-icon size="medium">
                  <arrow-right/>
                </n-icon>
              </template>

              <template #icon>
                <n-spin size="small" v-if="isLoading">
                  <template #icon>
                    <n-icon>
                      <ArrowClockwise/>
                    </n-icon>
                  </template>
                </n-spin>
              </template>

            </n-button>
          </n-gi>
        </n-grid>
      </n-card>
    </n-gi>

  </n-grid>
</template>

<script>
import AccountURL from "@/urls/AccountURL"
import {ArrowRight20Filled as ArrowRight, ArrowClockwise20Filled as ArrowClockwise} from '@vicons/fluent'
import {
  NButton,
  NGrid,
  NGi,
  NCard,
  NForm,
  NFormItem,
  NInput,
  NDatePicker,
  NIcon,
  NDivider,
  NSpin
} from 'naive-ui'

export default {
  components: {
    ArrowClockwise,
    ArrowRight,
    NButton,
    NGrid,
    NGi,
    NCard,
    NForm,
    NFormItem,
    NInput,
    NDatePicker,
    NIcon,
    NDivider,
    NSpin
  },
  data() {
    return {
      isLoading: false,
      login_data: {
        email: '',
        password: '',
      },

      login_errors: {
        email: {status: "success", message: ''},
        password: {status: "success", message: ''},
      }
    }
  },
  created() {
    document.title = "Login | Pokedex"
  },
  methods: {
    login() {
      this.isLoading = true
      AccountURL.login(this.login_data)
          .then((response) => {
            localStorage.setItem('token', response.data.token)
            localStorage.setItem('user', JSON.stringify(response.data.user_profile))
            this.$router.push('/home')
            this.isLoading = false
          })
          .catch((error) => {
            if (error.response.data.errors.email != undefined) {
              this.login_errors.email.status = "error"
              this.login_errors.email.message = error.response.data.errors.email[0]
            } else {
              this.login_errors.email.status = "success"
              this.login_errors.email.message = ""
            }

            if (error.response.data.errors.password != undefined) {
              this.login_errors.password.status = "error"
              this.login_errors.password.message = error.response.data.errors.password[0]
            } else {
              this.login_errors.password.status = "success"
              this.login_errors.password.message = ""
            }

            this.isLoading = false
          })
    }
  }
}
</script>
