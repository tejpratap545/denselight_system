<template>
  <div class="pa-5">
    <div v-if="$fetchState.pending">
      <v-skeleton-loader class="px-10 my-5" type="card@2"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else class="pa-5">
      <v-row class="lighten-1 pa-5">
        <v-col>
          <div class="panel">
            <div style="justify-content: center; display: flex">
              <div class="profile-panel">
                <img
                  :src="
                    profile.profile_Profile
                      ? profile.profile_Profile
                      : `https://avatars.dicebear.com/api/identicon/${this.$auth.user.id}.svg`
                  "
                  alt="profile"
                />
              </div>
            </div>

            <div>
              <h2 class="text-center">{{ profile.name || '' }}</h2>
              <p class="text-center">{{ profile.email }}</p>
            </div>

            <div>
              <v-file-input
                label="Upload new picture"
                filled
                prepend-icon="mdi-camera"
                name="profilePicture"
                v-model="file"
                @change="uploadPicture"
              ></v-file-input>
            </div>

            <v-simple-table>
              <template v-slot:default>
                <tbody>
                  <tr>
                    <th class="text-left">Employee ID</th>
                    <th class="text-left">{{ profile.employee_ID }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Type of employee</th>
                    <th class="text-left">{{ profile.typeOfEmployee }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Address</th>
                    <th class="text-left">{{ profile.address_1 }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Phone</th>
                    <th class="text-left">{{ profile.phone }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">First reporting officer</th>
                    <td>{{ profile.first_Reporting_Manager.name }}</td>
                  </tr>
                  <tr>
                    <th class="text-left">Second reporting officer</th>
                    <td>{{ profile.second_Reporting_Manager.name || '' }}</td>
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
                  <tr>
                    <th class="text-left">NRIC</th>
                    <th class="text-left">{{ profile.nric }}</th>
                  </tr>
                  <tr>
                    <th class="text-left">Date of Passport Expiry</th>
                    <th class="text-left">
                      {{ profile.date_Of_Passport_Expiry }}
                    </th>
                  </tr>
                  <tr>
                    <th class="text-left">Employment Type</th>
                    <th class="text-left">{{ profile.employment_Type }}</th>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </div>
        </v-col>
        <v-col>
          <div class="panel pa-5">
            <h3 class="my-5">Reset Password</h3>
            <v-text-field
              v-model="passwordReset.old_password"
              label="Old Password"
              outlined
            ></v-text-field>
            <v-text-field
              v-model="passwordReset.password1"
              label="New Password"
              outlined
            ></v-text-field>
            <v-text-field
              v-model="passwordReset.password2"
              label="Confirm Password"
              outlined
            ></v-text-field>
            <v-btn elevation="0" color="primary" @click="changePassword">
              Reset Password</v-btn
            >
          </div>
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
  data() {
    return {
      profile: this.$auth.user,
      passwordReset: {
        password1: '',
        password2: '',
        old_password: '',
        profile: this.$auth.user.id,
      },
      file: null,
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
    },
    uploadPicture() {
      var bodyFormData = new FormData()
      bodyFormData.append('profilePicture', this.file)

      this.$axios
        .$post('/api/profile/change_profile_picture', bodyFormData)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Profile picture uploaded success',
            color: 'info',
          })
          this.close()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Profile picture uploaded failed',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style>
.panel {
  min-height: 650px;
  margin: 0 30px;
  padding: 20px 10px;
  background: rgba(0, 0, 0, 0.2);
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
