<template>
  <div class="pa-5">
    <div v-if="$fetchState.pending">
      <v-skeleton-loader class="px-10 my-5" type="card@2"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else class="pa-10">
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
              <h2 class="text-center">{{ profile.name }}</h2>
              <p class="text-center">{{ profile.email }}</p>
            </div>

            <v-simple-table>
              <template v-slot:default>
                <tbody>
                  <tr>
                    <th class="text-left">Employee ID</th>
                    <th class="text-left">{{ profile.employee_ID }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Department</th>
                    <th class="text-left">{{ profile.department.name }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">First reporting officer</th>
                    <td>{{ profile.first_Reporting_Manager.name }}</td>
                  </tr>
                  <tr>
                    <th class="text-left">Second reporting officer</th>
                    <td>{{ profile.second_Reporting_Manager.name }}</td>
                  </tr>
                  <tr>
                    <th class="text-left">Job Title</th>
                    <th class="text-left">{{ profile.job_Title }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Date of hire</th>
                    <th class="text-left">{{ profile.date_Of_Hire }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Citizenship status</th>
                    <th class="text-left">{{ profile.citizenship_Status }}</th>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </div>
        </v-col>
        <v-col>
          <div class="panel pa-5">
            <h3 class="my-5">Reset Password</h3>
            <v-text-field v-model="passwordReset.old_password" label="Old Password" outlined></v-text-field>
            <v-text-field v-model="passwordReset.password1" label="New Password" outlined></v-text-field>
            <v-text-field v-model="passwordReset.password2" label="Confirm Password" outlined></v-text-field>
            <v-btn elevation="0" color="primary" @click="changePassword"> Reset Password</v-btn>
          </div>
          <v-divider />
        </v-col>
      </v-row>
      <v-row class="lighten-1 pa-10"> </v-row>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Profile',
  layout: 'dashboard-template',
  async fetch() {
    try {
      this.profile = await this.$axios.$get(
        `/api/profile/${this.$auth.user.id}`
      )
      this.passwordReset.profile = this.profile.id
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      profile: {},
      passwordReset: {
        password1: '',
        password2: '',
        old_password: '',
        profile: 0,
      }
    }
  },
  methods: {
    changePassword() {
      this.$axios
        .$post('/api/profile/changepassword', this.passwordReset)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Password changed successully',
            color: 'info',
          })
          this.close()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error changing password',
            color: 'error',
          })
        })
    }
  }
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
}

.profile-panel img {
  width: 100%;
  height: 100%;
  border-radius: 100%;
  background: #ccc;
}
</style>
