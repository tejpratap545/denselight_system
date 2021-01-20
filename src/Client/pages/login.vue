<template>
  <div class="login-backgroud">
    <v-card elevation="10" class="login-container">
      <img
        src="~assets/employeeManagement.jpg"
        class="login-image my-5"
        style="width: 100%; height: 200px"
      />

      <h1 class="mb-4 text-center">Hunet E-PMP</h1>
      <h3 class="my-8 text-center">{{ supervisor }}</h3>

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
          <v-btn color="primary" elevation="2" type="submit">
            Login
          </v-btn>
        </div>
        <p class="my-5 text-center">
          Don't remeber your password? <a>Forget Password</a>
        </p>
      </v-form>
    </v-card>
  </div>
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
        .then((res) => (this.supervisor = 'Supervisor:' + res.Supervisor))
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
.login-backgroud {
  display: grid;
  place-items: center;
  background-image: url('~assets/employeeManagement.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  height: 100vh;
}
.login-container {
  width: 100%;
  max-width: 450px;
  height: 500px;
  padding: 30px;
  border-radius: 8px;
  background: #fff;
}

.login-image {
  display: none;
}

@media (max-width: 600px) {
  .login-container {
    height: 100%;
    border-radius: 0px;
  }

  .login-image {
    display: block;
    border-radius: 8px;
  }
}
</style>
