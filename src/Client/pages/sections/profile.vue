<template>
  <div>
    <v-row class="lighten-1 pa-5">
      <v-col>
        <div class="panel">
          <div style="justify-content: center; display: flex">
            <div class="profile-panel">
              <img
                :src="
                  profile.profile_Picture
                    ? profile.profile_Picture
                    : `https://avatars.dicebear.com/api/identicon/${this.$auth.user.id}.svg`
                "
                alt="profile"
              />
            </div>
          </div>

          <div>
            <h2 class="text-center">{{ profile.name || '' }}</h2>
            <p class="text-center">{{ profile.email || '' }}</p>
          </div>

          <div>
            <v-file-input
              v-model="file"
              label="Upload new picture"
              filled
              prepend-icon="mdi-camera"
              name="profilePicture"
              @change="uploadPicture"
            ></v-file-input>
          </div>

          <v-simple-table>
            <template v-slot:default>
              <tbody>
                <tr>
                  <th class="text-left">Employee ID</th>
                  <th class="text-left">{{ profile.employee_ID || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Type of employee</th>
                  <th class="text-left">{{ profile.typeOfEmployee || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Address</th>
                  <th class="text-left">{{ profile.address_1 || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Phone</th>
                  <th class="text-left">{{ profile.phone || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">First reporting officer</th>
                  <td>
                    {{
                      profile.first_Reporting_Manager
                        ? profile.first_Reporting_Manager.name
                        : ''
                    }}
                  </td>
                </tr>

                <tr>
                  <th class="text-left">Second reporting officer</th>
                  <td>
                    {{
                      profile.second_Reporting_Manager
                        ? profile.second_Reporting_Manager.name
                        : ''
                    }}
                  </td>
                </tr>
                <tr>
                  <th class="text-left">Job Title</th>
                  <th class="text-left">{{ profile.job_Title || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Date of hire</th>
                  <th class="text-left">{{ profile.date_Of_Hire || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Citizenship status</th>
                  <th class="text-left">
                    {{ profile.citizenship_Status || '' }}
                  </th>
                </tr>
                <tr>
                  <th class="text-left">NRIC</th>
                  <th class="text-left">{{ profile.nric || '' }}</th>
                </tr>
                <tr>
                  <th class="text-left">Date of Passport Expiry</th>
                  <th class="text-left">
                    {{ profile.date_Of_Passport_Expiry || '' }}
                  </th>
                </tr>
                <tr>
                  <th class="text-left">Employment Type</th>
                  <th class="text-left">{{ profile.employment_Type || '' }}</th>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </div>
      </v-col>
      <v-col>
        <div class="panel pa-5">
          <h3 class="my-5">Update Password</h3>
          <v-text-field
            v-model="passwordReset.old_password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            label="Old Password"
            :type="show1 ? 'text' : 'password'"
            outlined
            @click:append="show1 = !show1"
          ></v-text-field>
          <v-text-field
            v-model="passwordReset.password1"
            :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
            label="New Password"
            :type="show2 ? 'text' : 'password'"
            :error="passwordinputError"
            outlined
            @click:append="show2 = !show2"
            @change="checkPassword"
          ></v-text-field>

          <v-alert v-if="passwordinputError" type="warning" text dense>
            Password is weak, password must include
            <ul>
              <li>8 minimum character</li>
              <li>Capital letter</li>
              <li>Numbers & symbols</li>
            </ul>
          </v-alert>
          <v-alert
            v-else-if="!passwordinputError && passwordReset.password1 != ''"
            type="success"
            text
            dense
          >
            Password is strong
          </v-alert>

          <v-text-field
            v-model="passwordReset.password2"
            :append-icon="show3 ? 'mdi-eye' : 'mdi-eye-off'"
            label="Confirm Password"
            outlined
            :rules="confirmPasswordRules"
            :type="show3 ? 'text' : 'password'"
            @click:append="show3 = !show3"
          ></v-text-field>

          <v-alert
            v-if="!passwordStrong && passwordReset.password1 != ''"
            type="warning"
            >One or more entries are invalid</v-alert
          >

          <v-btn
            elevation="0"
            color="primary"
            :disabled="!passwordStrong"
            @click="changePassword"
          >
            Reset Password</v-btn
          >
        </div>
      </v-col>
    </v-row>
    <v-row class="lighten-1 pa-10"> </v-row>
  </div>
</template>

<script>
export default {
  name: 'Profile',
  layout: 'dashboard-template',
  data() {
    return {
      show3: false,
      show1: false,
      show2: false,
      profile: this.$auth.user,
      passwordReset: {
        password1: '',
        password2: '',
        old_password: '',
        profile: this.$auth.user.id,
      },
      file: null,

      passwordStrong: false,
      passwordinputError: false,
      confirmPasswordRules: [
        (value) => !!value || 'type confirm password',
        (value) =>
          value === this.passwordReset.password1 ||
          'The password confirmation does not match.',
      ],
    }
  },
  methods: {
    checkPassword() {
      this.$axios
        .$post('api/check/password', {
          password: this.passwordReset.password1,
        })
        .then((_) => {
          this.passwordStrong = true
          this.passwordinputError = false
        })
        .catch((_) => {
          this.passwordStrong = false
          this.passwordinputError = true
        })
    },
    changePassword() {
      this.$axios
        .$post('/api/profile/changepassword', this.passwordReset)
        .then((res) => {
          this.passwordReset = {
            password1: '',
            password2: '',
            old_password: '',
            profile: this.$auth.user.id,
          }

          this.$notifier.showMessage({
            content: 'Password changed successully',
            color: 'info',
          })
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error changing password',
            color: 'error',
          })
        })
    },
    uploadPicture() {
      const bodyFormData = new FormData()
      bodyFormData.append('profilePicture', this.file)

      this.$axios
        .$post('/api/profile/change_profile_picture', bodyFormData)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Profile picture uploaded success',
            color: 'info',
          })

          location.reload()
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
  padding: 20px;
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
