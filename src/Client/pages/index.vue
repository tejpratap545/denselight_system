<template>
  <v-container fluid fill-height class="pa-0 align-stretch">
    <v-row>
      <v-col cols="0" sm="7" md="8" lg="9" class="login-bg-img">
        <!-- <div class="center-brand">
          <div class="inner-container">
            <i class="fas fa-fire"></i>
          </div>
        </div> -->
      </v-col>
      <v-col cols="12" sm="5" md="4" lg="3" class="light pa-15 pa-sm-10">
        <h1 class="mb-4 font-weight-light text-center">Denselight E-PMP</h1> 
        <h2 class="my-8 font-weight-light">Login</h2>
        <v-form 
          ref="form"
          lazy-validation 
          @submit.prevent="formsubmit">
          <v-text-field
            type="text"
            label="Username"
            v-model="user.username"
            :rules="[v => !!v || 'Username is required']"
            clearable
            required
          ></v-text-field>
          <v-text-field
            type="email"
            label="Email"
            v-model="user.email"
            :rules="[v => !!v || 'Email is required', v => /.+@.+\..+/.test(v) || 'E-mail must be valid']"
            clearable
            required
          ></v-text-field>
          <v-text-field
            type="password"
            label="Password"
            v-model="user.password"
            :rules="[v => !!v || 'Password is required']"
            clearable
            required
          ></v-text-field>
          <v-radio-group row v-model="user.radioOpt" mandatory>
            <v-radio label="Direct" value="direct"></v-radio>
            <v-radio label="Indirect" value="indirect"></v-radio>
          </v-radio-group>
          
          <div class="text-right">
            <v-btn
              color="primary"
              elevation="2"
              type="submit"
            >
              Login
            </v-btn>
          </div>
          <div class="my-4">
            <p class="font-weight-light">Don't remeber your password? <a>Forget Password</a></p>
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
export default {
  layout: 'empty',
  components: {},
  data() {
    return {
      user:{
        username: "",
        email: "",
        password: "",
        radioOpt: "",
      }
    }
  },
  methods: {
    formsubmit(){
      if(this.$refs.form.validate()){
        console.log(this.user);
      }
    }
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
  background-image: url('~assets/login_bg.jpg');
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

@media (max-width: 600px){
  .login-bg-img{
    display: none !important;
    background-image: none;
  }
}
</style>