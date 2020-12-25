<template>
  <v-app>
    <v-navigation-drawer app>
      <template v-slot:prepend>
        <v-list-item style="margin: 50px 0">
          <img src="~/assets/logo.svg" width="220" />
        </v-list-item>
        <v-list-item two-line>
          <v-list-item-avatar>
            <img src="https://randomuser.me/api/portraits/women/81.jpg" />
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>{{ name }}</v-list-item-title>
            <v-list-item-subtitle>
              <a class="danger" @click="logout">Logout</a>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>

      <v-divider></v-divider>

      <v-list dense rounded>
        <v-list-item v-for="item in items" :key="item.title" :to="item.link">
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-main>

    <v-footer app> </v-footer>
  </v-app>
</template>

<script>
// eslint-disable-next-line no-unused-vars
// import logout from '~/plugins/auth'
export default {
  data() {
    return {
      name: this.$auth.user.name,
      items: [
        {
          link: '/dashboard',
          title: this.$auth.user.name,
          icon: 'mdi-view-dashboard-outline',
        },
        {
          link: '/sections/department',
          title: 'Department',
          icon: 'mdi-domain',
        },
        {
          link: '/sections/peer',
          title: 'Peer',
          icon: 'mdi-account-group-outline',
        },
        {
          link: '/sections/appraisal-status',
          title: 'Appraisal Status',
          icon: 'mdi-list-status',
        },
        {
          link: '/sections/employee-management',
          title: 'Employee Management',
          icon: 'mdi-account-supervisor-outline',
        },
        {
          link: '/sections/records',
          title: 'Records',
          icon: 'mdi-book-open-outline',
        },
      ],
    }
  },
  methods: {
    logout() {
      this.$auth.setToken(false)
      this.$auth.setRefreshToken(false)
      this.$axios.setHeader('Authorization', false)
      this.$auth.logout()
    },
  },
}
</script>

<style>
a {
  text-decoration: none;
}

a.muted {
  color: #666;
}

a.danger {
  color: #ff5252;
}
</style>
