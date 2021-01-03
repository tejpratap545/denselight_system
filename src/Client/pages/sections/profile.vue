<template>
  <div class="pa-10">
    <v-row class="lighten-1 pa-10">
      <v-col>
        <div class="panel">
          <div style="justify-content: center; display: flex">
            <div class="profile-panel">
              <img
                :src="`https://avatars.dicebear.com/api/identicon/${this.$auth.user.id}.svg`"
                alt="profile"
              />
            </div>
          </div>

          <div>
            <h2 class="text-center">{{ this.$auth.user.name }}</h2>
            <p class="text-center">{{ this.$auth.user.email }}</p>
          </div>
        </div>
      </v-col>
      <v-col>
        <div class="panel"></div>
      </v-col>
    </v-row>
    <v-row class="lighten-1 pa-10"> </v-row>
  </div>
</template>

<script>
export default {
  name: 'Profile',
  layout: 'dashboard-template',
}
</script>

<style>
.panel {
  height: 600px;
  margin: 0 50px;
  padding: 20px 10px;
  background: #222;
  border-radius: 10px;
}

.profile-panel {
  width: 100px;
  height: 100px;
  margin: 20px;
  background: #ccc;
  border-radius: 100%;
}

.profile-panel img {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
