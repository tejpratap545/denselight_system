<template>
  <v-container fluid fill-height class="pa-0 align-stretch">
    <v-row>
      <v-col cols="0" sm="7" md="8" lg="9" class="login-bg-img"> </v-col>

      <v-col cols="12" sm="5" md="4" lg="3" class="light pa-5 pa-sm-10">
        <h1 class="mb-4 font-weight-light text-center">Denselight E-PMP</h1>
        <h3 class="my-8 font-weight-light text-center">{{ supervisor }}</h3>

        <v-form ref="form" lazy-validation @submit.prevent="logIn">
          <v-text-field
            v-model="user.username"
            type="text"
            label="Username"
            :rules="[(v) => !!v || 'Username is required']"
            clearable
            required
            @change="getsup"
          ></v-text-field>
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
            v-model="user.password"
            label="Password"
            :rules="[(v) => !!v || 'Password is required']"
            clearable
            type="password"
            required
          ></v-text-field>
          <v-radio-group v-model="user.typeOfEmployee" row mandatory>
            <v-radio label="Direct" value="DIRECT"></v-radio>
            <v-radio label="Indirect" value="INDIRECT"></v-radio>
          </v-radio-group>
          <div class="text-right">
            <v-btn color="primary" elevation="2" type="submit"> Login </v-btn>
          </div>
          <div class="my-4">
            <p class="font-weight-light">
              Don't remeber your password? <a>Forget Password</a>
            </p>
          </div>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { logout, signIn } from '~/plugins/auth'

export default {
  layout: 'empty',
  components: {},
  data() {
    return {
      user: {
        username: '',
        email: '',
        password: '',
        typeOfEmployee: '',
      },
      supervisor: ' ',
    }
  },

  methods: {
    getsup() {
      this.$axios
        .$post('api/get_supervisor', this.user)
        .then((res) => (this.supervisor = res.Supervisor))
        .catch((err) => (this.supervisor = ' '))
    },
    logIn() {
      if (this.$refs.form.validate()) {
        logout(this.$auth, this.$axios)
        signIn(
          this.$axios,
          this.$auth,
          this.$store,
          this.$router,
          this.$route.query.redirect || '/',
          this.user
        )
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
.login-bg-img {
  background-image: url('~assets/epmp.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}

@media (max-width: 600px) {
  .login-bg-img {
    display: none !important;
    background-image: none;
  }
}
</style>
