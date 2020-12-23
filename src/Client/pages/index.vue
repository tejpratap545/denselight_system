<template>
  <v-container fluid fill-height class="pa-0 align-stretch">
    <v-row>
      <v-col cols="5" sm="7" md="8" lg="9" class="login-bg-img">
        <!-- <div class="center-brand">
          <div class="inner-container">
            <i class="fas fa-fire"></i>
          </div>
        </div> -->
      </v-col>
      <v-col cols="7" sm="5" md="4" lg="3" class="light pa-5 pa-sm-10">
        <h1 class="mb-4 font-weight-light text-center">Denselight E-PMP</h1>
        {{ $auth.loggedIn }} {{ $route.query.redirect }}
        <h2 class="my-8 font-weight-light">Login</h2>
        <v-form>
          <v-text-field
            v-model="username"
            type="text"
            label="Username"
            clearable
          >
          </v-text-field>
          <v-text-field v-model="email" type="email" label="Email" clearable>
          </v-text-field>
          <v-text-field
            v-model="password"
            label="Password"
            :append-icon="show_password ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show_password ? 'text' : 'password'"
            @click:append="show_password = !show_password"
          >
          </v-text-field>
          <v-radio-group v-model="typeOfEmployee" row>
            <v-radio label="Indirect" value="INDIRECT"></v-radio>
            <v-radio label="Direct" value="DIRECT"></v-radio>
          </v-radio-group>
          <div class="text-right" @click="logIn">
            <v-btn color="primary" elevation="2"> Login </v-btn>
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
  <!-- <v-row align="center" justify="center">
    <v-col class="text-center" cols="12">
      <h1 class="display-1 font-weight-thin mb-4">Hello, Vuetify</h1>
      <h4 class="subheading">Build your application today!</h4>
    </v-col>
  </v-row> -->
</template>

<script>
import { logout, signIn } from '~/plugins/auth'
export default {
  layout: 'empty',
  components: {},
  data() {
    return {
      username: '',
      show_password: false,
      password: '',
      email: '',
      typeOfEmployee: 'INDIRECT',
    }
  },
  methods: {
    logIn() {
      logout(this.$auth, this.$axios)

      signIn(
        this.$axios,
        this.$auth,
        this.$store,
        this.$router,
        this.$route.query.redirect || '/',
        {
          username: this.username,
          password: this.password,
          email: this.email,
          typeOfEmployee: this.typeOfEmployee,
        }
      ).catch((err) => {
        this.$notifier.showMessage({
          content: `Sorry something went wrong please check your login information`,
          color: 'info',
        })
      })
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
  background-image: url('https://colorlib.com/polygon/adminator/assets/static/images/bg.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}

/* .center-brand{
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
  transform: translate(-50%,-50%);
}
.center-brand .inner-container{
  background: #fff;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  position: relative;
} */
</style>
