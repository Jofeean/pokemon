<template>
  <n-space vertical size="large">
    <n-layout>
      <NavigationComponent/>
      <n-layout-content>

        <br>
        <n-grid :x-gap="12" :y-gap="8" cols="10 s:6 m:3" item-responsive responsive="screen">
          <n-gi :offset="1" span="8 s:4 m:1">
            <n-card title="Edit Profile">

              <n-form-item label="First Name" size="large" :feedback="user_errors.first_name.message"
                           :validation-status="user_errors.first_name.status">
                <n-input :disabled="isLoading" type="text" placeholder="Input first name"
                         v-model:value="user_data.first_name"/>
              </n-form-item>

              <n-form-item label="Last Name" size="large" :feedback="user_errors.last_name.message"
                           :validation-status="user_errors.last_name.status">
                <n-input :disabled="isLoading" type="text" placeholder="Input last name"
                         v-model:value="user_data.last_name"/>
              </n-form-item>

              <n-form-item label="Birthday" size="large" :feedback="user_errors.birthday.message"
                           :validation-status="user_errors.birthday.status">
                <n-date-picker :disabled="isLoading" style="width: 100%"
                               type="date"
                               value-format="yyyy-MM-dd"
                               clearable v-model:formatted-value="user_data.birthday"
                />
              </n-form-item>

              <n-divider/>

              <n-grid :x-gap="6" :y-gap="8" cols="4 s:6 m:4" item-responsive responsive="screen">
                <n-gi class="align-items-right" span="4 s:6 m:4">
                  <n-button type="primary" size="large" round icon-placement="right" @click="edit"
                            :secondary="isLoading"
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

        <br><br><br>

      </n-layout-content>
    </n-layout>
  </n-space>
</template>

<script>
import NavigationComponent from '../components/NavigationComponent'
import AccountURL from "@/urls/AccountURL"
import {ArrowRight20Filled as ArrowRight, ArrowClockwise20Filled as ArrowClockwise} from '@vicons/fluent'
import {
  NSpace, NLayout, NLayoutContent, NGrid, NGi, NCard, NButton, NIcon, NDivider, NForm, NFormItem, NInput, NDatePicker,
  NSpin,
} from 'naive-ui'

export default {
  components: {
    ArrowClockwise, ArrowRight, NButton, NGrid, NGi, NCard, NForm, NFormItem, NInput, NDatePicker, NIcon, NDivider,
    NSpin, NSpace, NavigationComponent,
  },
  props: ['id'],
  data() {
    return {
      isLoading: false,
      user_data: {
        first_name: '',
        last_name: '',
        birthday: '2022-07-21',
      },

      user_errors: {
        first_name: {status: "success", message: ''},
        last_name: {status: "success", message: ''},
        birthday: {status: "success", message: ''},
      }
    }
  },
  methods: {
    edit() {
      this.isLoading = true
      AccountURL.update(JSON.parse(localStorage.getItem('user')).id, this.user_data)
          .then((response) => {
            localStorage.setItem('token', response.data.token)
            localStorage.setItem('user', JSON.stringify(response.data.user_profile))
            this.isLoading = false
          })
          .catch((error) => {
            if (error.response.data.errors.first_name != undefined) {
              this.user_errors.first_name.status = "error"
              this.user_errors.first_name.message = error.response.data.errors.first_name[0]
            } else {
              this.user_errors.first_name.status = "success"
              this.user_errors.first_name.message = ""
            }

            if (error.response.data.errors.last_name != undefined) {
              this.user_errors.last_name.status = "error"
              this.user_errors.last_name.message = error.response.data.errors.last_name[0]
            } else {
              this.user_errors.last_name.status = "success"
              this.user_errors.last_name.message = ""
            }

            if (error.response.data.errors.birthday != undefined) {
              this.user_errors.birthday.status = "error"
              this.user_errors.birthday.message = error.response.data.errors.birthday[0]
            } else {
              this.user_errors.birthday.status = "success"
              this.user_errors.birthday.message = ""
            }

            this.isLoading = false
          })
    }
  },
  created() {
    document.title = "Edit User | Pokedex"
  },
  mounted() {
    let user = JSON.parse(localStorage.getItem('user'))
    this.user_data.first_name = user.first_name
    this.user_data.last_name = user.last_name
    this.user_data.birthday = user.birthday
  },
  name: "UpdateView"
}
</script>

<style scoped>

</style>