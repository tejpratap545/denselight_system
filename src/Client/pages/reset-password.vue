<template>
  <v-container fluid fill-height class="pa-0 align-stretch">
    <v-row>
      <v-col cols="0" sm="7" md="8" lg="9" style="padding: 0">
        <img src="~assets/epmp.jpg" style="width: 100%; height: 100%" />
      </v-col>

      <v-col cols="12" sm="5" md="4" lg="3" class="pa-5 pa-sm-10">
        <h1 class="mb-4 font-weight-light text-center">Password Reset</h1>

        <v-form ref="form" lazy-validation @submit.prevent="resetPassword">
          <v-text-field
            v-model="user.email"
            type="email"
            label="Email"
            :rules="[
              (v) => !!v || 'Email is required',
              (v) => /.+@.+\..+/.test(v) || 'E-mail must be valid',
            ]"
            clearable
            required
          >
          </v-text-field>
          <v-text-field
            v-model="user.token"
            type="text"
            label="OTP"
            :rules="[(v) => !!v || 'OTP is required']"
            clearable
            required
          ></v-text-field>

          <v-text-field
            v-model="user.password1"
            label="New Password"
            :rules="[(v) => !!v || 'Password is required']"
            clearable
            type="password"
            required
          ></v-text-field>

          <v-text-field
            v-model="user.password2"
            label="Confirm New Password"
            :rules="[(v) => !!v || 'Password is required']"
            clearable
            type="password"
            required
          ></v-text-field>

          <div class="text-center">
            <v-btn color="primary" elevation="2" type="submit"
              >Reset Password
            </v-btn>
          </div>
          <div class="my-4">
            <p class="font-weight-light text-center">
              Login Instead?
              <a href="/login">Login</a>
            </p>
          </div>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  auth: false,
  layout: 'empty',
  components: {},
  data() {
    return {
      user: {
        email: '',
        token: '',
        password1: '',
        password2: '',
      },
    }
  },

  methods: {
    resetPassword() {
      if (this.$refs.form.validate()) {
        this.$axios
          .$post('api/reset_password', this.user)
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Now you can login with your new credentials',
              color: 'success',
            })

            location.replace('/login')
          })
          .catch((err) => {
            this.$notifier.showMessage({
              content: 'Error resetting password',
              color: 'error',
            })
          })
      }
    },
  },
}
</script>

<style>
html,
body {
  padding: 0;
  margin: 0;
}
</style>
