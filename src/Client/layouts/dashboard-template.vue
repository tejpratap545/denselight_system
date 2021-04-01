<template>
  <v-app>
    <Snackbar></Snackbar>

    <v-navigation-drawer v-model="drawer" app>
      <template v-slot:prepend>
        <img
          src="~assets/logo.svg"
          style="margin: 100px 0 30px 0; padding: 0 20px; width: 100%"
        />

        <v-list-item two-line>
          <v-list-item-avatar>
            <img
              :src="
                $auth.user.profile_Picture
                  ? $auth.user.profile_Picture
                  : `https://avatars.dicebear.com/api/identicon/${$auth.user.id}.svg`
              "
              alt="profile"
            />
          </v-list-item-avatar>

          <v-list-item-content>
            <NLink to="/sections/profile">
              <v-list-item-title class="text--secondary"
                ><b>{{ name }}</b></v-list-item-title
              >
            </NLink>
            <v-list-item-subtitle>
              <a class="danger" @click="logout">Logout</a>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>

      <v-divider></v-divider>

      <v-list dense rounded>
        <v-list-item to="/">
          <v-list-item-icon>
            <v-icon>mdi-view-dashboard-outline</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Dashboard</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item
          v-if="$auth.user.user.role != 'Employee'"
          to="/sections/department"
        >
          <v-list-item-icon>
            <v-icon>mdi-domain</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Department</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item to="/sections/peer">
          <v-list-item-icon>
            <v-icon>mdi-account-group-outline</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Peer</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item
          v-if="
            $auth.user.user.role == 'HRManager' ||
            $auth.user.user.role == 'Hr' ||
            $auth.user.user.role == 'Admin'
          "
          to="/sections/appraisal-status"
        >
          <v-list-item-icon>
            <v-icon>mdi-list-status</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Appraisal Status</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item
          v-if="$auth.user.user.role == 'Admin'"
          to="/sections/employee-management"
        >
          <v-list-item-icon>
            <v-icon>mdi-account-supervisor-outline</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Employee Management</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item to="/sections/records">
          <v-list-item-icon>
            <v-icon>mdi-book-open-outline</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Records</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item
          v-if="$auth.user.user.role == 'Admin'"
          to="/sections/admin"
        >
          <v-list-item-icon>
            <v-icon>mdi-account-check</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Admin</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item to="/sections/guide">
          <v-list-item-icon>
            <v-icon>mdi-television-guide</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Guide</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          v-if="$auth.user.user.role == 'Admin'"
          to="/sections/bell-curve"
        >
          <v-list-item-icon>
            <v-icon>mdi-chart-bell-curve</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Bell Curve</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-spacer></v-spacer>

      <div>
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" icon v-on="on">
              <v-badge :content="statusEffect.a1"
                ><v-icon>mdi-rocket-launch-outline</v-icon>
              </v-badge>
            </v-btn>
          </template>
          <span>Appraisals In Goal Settings Stage</span>
        </v-tooltip>
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" icon v-on="on">
              <v-badge :content="statusEffect.a2"
                ><v-icon>mdi-calendar</v-icon>
              </v-badge>
            </v-btn>
          </template>
          <span>Appraisals In Mid Year Review Stage</span>
        </v-tooltip>

        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" icon v-on="on">
              <v-badge :content="statusEffect.a3">
                <v-icon>mdi-calendar</v-icon>
              </v-badge>
            </v-btn>
          </template>
          <span>Appraisals In End Year Review Stage</span>
        </v-tooltip>

        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" icon v-on="on">
              <v-badge :content="statusEffect.a4">
                <v-icon>mdi-account-clock-outline</v-icon>
              </v-badge>
            </v-btn>
          </template>
          <span>Peer Appraisals</span>
        </v-tooltip>

        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" icon v-on="on" @click="toggleDarkTheme()">
              <v-icon>mdi-theme-light-dark</v-icon>
            </v-btn>
          </template>
          <span>Change Theme To Lighting</span>
        </v-tooltip>
      </div>

      <Notifications />
    </v-app-bar>

    <v-main>
      <v-container fluid>
        <nuxt />
      </v-container>
    </v-main>

    <v-footer app> </v-footer>
  </v-app>
</template>

<script>
export default {
  fetch() {
    this.$axios
      .$get('api/status')
      .then((res) => {
        this.statusEffect = res
      })
      .catch((err) => console.log(err))
  },
  data() {
    return {
      drawer: null,
      name: this.$auth.loggedIn ? this.$auth.user.name : 'John Doe',
      id: this.$auth.loggedIn ? this.$auth.user.id : 0,
      profile_Profile: this.$auth.user.profile_Profile
        ? this.$auth.user.profile_Profile
        : null,
      statusEffect: {
        a1: 0,
        a2: 0,
        a3: 0,
        a4: 0,
      },
    }
  },
  mounted() {
    if (window.localStorage.getItem('app-theme-dark') == 'false') {
      this.$vuetify.theme.dark = false
    } else {
      this.$vuetify.theme.dark = true
    }
  },
  methods: {
    logout() {
      this.$auth.setToken(false)
      this.$auth.setRefreshToken(false)
      this.$axios.setHeader('Authorization', false)
      this.$auth.logout()
    },
    toggleDarkTheme() {
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark
      window.localStorage.setItem('app-theme-dark', this.$vuetify.theme.dark)
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
