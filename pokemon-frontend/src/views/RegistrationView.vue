<template>
  <br><br>
  <n-grid :x-gap="12" :y-gap="8" cols="10 s:6 m:3" item-responsive responsive="screen">
    <n-gi :offset="1" span="8 s:4 m:1">
      <n-card title="Registration">

        <n-form-item label="First Name" size="large" :feedback="registration_errors.first_name.message"
                     :validation-status="registration_errors.first_name.status">
          <n-input :disabled="isLoading" type="text" placeholder="Input first name"
                   v-model:value="registration_data.first_name"/>
        </n-form-item>

        <n-form-item label="Last Name" size="large" :feedback="registration_errors.last_name.message"
                     :validation-status="registration_errors.last_name.status">
          <n-input :disabled="isLoading" type="text" placeholder="Input last name"
                   v-model:value="registration_data.last_name"/>
        </n-form-item>

        <n-form-item label="Birthday" size="large" :feedback="registration_errors.birthday.message"
                     :validation-status="registration_errors.birthday.status">
          <n-date-picker :disabled="isLoading" style="width: 100%"
                         type="date"
                         value-format="yyyy-MM-dd"
                         clearable v-model:formatted-value="registration_data.birthday"
          />
        </n-form-item>

        <n-form-item label="Email" size="large" :feedback="registration_errors.email.message"
                     :validation-status="registration_errors.email.status">
          <n-input :disabled="isLoading" type="email" placeholder="Input email"
                   v-model:value="registration_data.email"/>
        </n-form-item>

        <n-form-item label="Password" size="large" :feedback="registration_errors.password.message"
                     :validation-status="registration_errors.password.status">
          <n-input :disabled="isLoading" type="password" placeholder="Input password"
                   v-model:value="registration_data.password"/>
        </n-form-item>

        <n-form-item label="Confirm Password" size="large" :feedback="registration_errors.confirm_password.message"
                     :validation-status="registration_errors.confirm_password.status">
          <n-input :disabled="isLoading" type="password" placeholder="Confirm password"
                   v-model:value="registration_data.confirm_password"/>
        </n-form-item>

        <n-divider/>

        <n-grid :x-gap="6" :y-gap="8" cols="4 s:6 m:4" item-responsive responsive="screen">
          <n-gi class="align-items-right align-items-v-center" span="4 s:2 m:1" offset="0 s:2 m:2">
            <router-link to="/">
              <n-button
                  text
                  tag="a"
                  target="_blank"
                  type="primary"
              >
                Already have an account?
              </n-button>
            </router-link>
          </n-gi>

          <n-gi class="align-items-right" span="4 s:2 m:1">
            <n-button type="primary" size="large" round icon-placement="right" @click="register" :secondary="isLoading"
                      :disabled="isLoading">
              Submit
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
  NSpin,
  NSpace,
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
    NSpin,
    NSpace,
  },
  data() {
    return {
      isLoading: false,
      registration_data: {
        first_name: '',
        last_name: '',
        birthday: '2022-07-21',
        email: '',
        password: '',
        confirm_password: ''
      },

      registration_errors: {
        first_name: {status: "success", message: ''},
        last_name: {status: "success", message: ''},
        birthday: {status: "success", message: ''},
        email: {status: "success", message: ''},
        password: {status: "success", message: ''},
        confirm_password: {status: "success", message: ''}
      }
    }
  },
  created() {
    document.title = "Registration | Pokedex"
  },
  methods: {
    register() {
      this.isLoading = true
      AccountURL.register(this.registration_data)
          .then((response) => {
            localStorage.setItem('token', response.data.token)
            localStorage.setItem('user', JSON.stringify(response.data.user_profile))
            this.$router.push('/home')
            this.isLoading = false
          })
          .catch((error) => {
            if (error.response.data.errors.first_name != undefined) {
              this.registration_errors.first_name.status = "error"
              this.registration_errors.first_name.message = error.response.data.errors.first_name[0]
            } else {
              this.registration_errors.first_name.status = "success"
              this.registration_errors.first_name.message = ""
            }

            if (error.response.data.errors.last_name != undefined) {
              this.registration_errors.last_name.status = "error"
              this.registration_errors.last_name.message = error.response.data.errors.last_name[0]
            } else {
              this.registration_errors.last_name.status = "success"
              this.registration_errors.last_name.message = ""
            }

            if (error.response.data.errors.birthday != undefined) {
              this.registration_errors.birthday.status = "error"
              this.registration_errors.birthday.message = error.response.data.errors.birthday[0]
            } else {
              this.registration_errors.birthday.status = "success"
              this.registration_errors.birthday.message = ""
            }

            if (error.response.data.errors.email != undefined) {
              this.registration_errors.email.status = "error"
              this.registration_errors.email.message = error.response.data.errors.email[0]
            } else {
              this.registration_errors.email.status = "success"
              this.registration_errors.email.message = ""
            }

            if (error.response.data.errors.password != undefined) {
              this.registration_errors.password.status = "error"
              this.registration_errors.password.message = error.response.data.errors.password[0]
            } else {
              this.registration_errors.password.status = "success"
              this.registration_errors.password.message = ""
            }

            if (error.response.data.errors.confirm_password != undefined) {
              this.registration_errors.confirm_password.status = "error"
              this.registration_errors.confirm_password.message = error.response.data.errors.confirm_password[0]
            } else {
              this.registration_errors.confirm_password.status = "success"
              this.registration_errors.confirm_password.message = ""
            }

            this.isLoading = false
          })
    },
  },
}
</script>

<style scoped>
</style>
