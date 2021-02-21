<template>
  <v-dialog v-model="dialog" persistent width="800">
    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Edit Employee 

         <v-spacer />
            <v-btn @click="close" icon>
              <v-icon>mdi-close</v-icon>
            </v-btn> 
      </v-card-title>

      <v-card-text>
        <v-tabs v-model="tab">
          <v-tab>Basic details</v-tab>
          <v-tab>Change Password</v-tab>
          <v-tab>Change Role</v-tab>
        </v-tabs>

        <v-tabs-items
          v-model="tab"
          style="height: 600px; overflow-y: scroll; padding: 20px 5px"
        >
          <v-tab-item>
            <v-text-field
              v-model="user.name"
              label="Full Name"
              outlined
            ></v-text-field>

            <v-select
              v-model="user.department"
              :items="departments"
              item-text="name"
              item-value="id"
              label="Department"
              outlined
            ></v-select>

            <v-text-field
              v-model="user.email"
              type="email"
              label="email"
              @change="checkEmail"
              :error="emailinputError"
              outlined
            ></v-text-field>

            <v-alert type="warning" v-if="emailinputError" text dense>
              Email must be unique
            </v-alert>
            <v-alert
              type="success"
              v-else-if="!emailinputError && user.email != ''"
              text
              dense
            >
              Email is valid
            </v-alert>

            <v-text-field
              v-model="user.citizenship_Status"
              label="Citizenship status"
              outlined
            ></v-text-field>

            <v-text-field
              v-model="user.division_Centre"
              label="Divison center"
              outlined
            ></v-text-field>

            <v-text-field
              v-model="user.nric"
              label="NRIC"
              outlined
            ></v-text-field>

            <v-text-field
              v-model="user.phone"
              label="Phone"
              outlined
            ></v-text-field>

            <v-textarea v-model="user.address_1" label="Address" outlined>
            </v-textarea>

            <v-select
              v-model="user.gender"
              :items="['Male', 'Female']"
              label="Gender"
              outlined
            ></v-select>

            <v-text-field
              v-model="user.job_Title"
              label="Job Title"
              outlined
            ></v-text-field>

            <v-combobox
              v-model="user.first_Reporting_Manager"
              :items="employees"
              item-text="name"
              item-value="id"
              label="First reporting manager"
              outlined
              chips
              return-object
            ></v-combobox>

            <v-combobox
              v-model="user.second_Reporting_Manager"
              :items="employees"
              item-text="name"
              item-value="id"
              label="Second reporting manager"
              chips
              return-object
              outlined
            ></v-combobox>

            <v-alert type="warning" v-if="!emailUnique"
              >One or more entries are invalid</v-alert
            >

            <v-btn color="primary" @click="createUser" :disabled="!emailUnique">
              Save
            </v-btn>
            <v-btn text @click="close"> Close </v-btn>
          </v-tab-item>

          <v-tab-item>
            <v-text-field
              v-model="passwordReset.password1"
              label="New Password"
              @change="checkPassword"
              :error="passwordinputError"
              outlined
            ></v-text-field>

            <v-alert type="warning" v-if="passwordinputError" text dense>
              Password is weak, password must include
              <ul>
                <li>8 minimum character</li>
                <li>Capital letter</li>
                <li>Numbers & symbols</li>
              </ul>
            </v-alert>
            <v-alert
              type="success"
              v-else-if="!passwordinputError && passwordReset.password1 != ''"
              text
              dense
            >
              Password is strong
            </v-alert>

            <v-text-field
              v-model="passwordReset.password2"
              label="Confirm Password"
              outlined
            ></v-text-field>

            <v-alert
              type="warning"
              v-if="!passwordStrong && passwordReset.password1 != ''"
              >One or more entries are invalid</v-alert
            >

            <v-btn
              elevation="0"
              color="primary"
              @click="changePassword"
              :disabled="!passwordStrong"
            >
              Reset Password</v-btn
            >
            <v-btn text @click="close"> Close </v-btn>
          </v-tab-item>

          <v-tab-item>
            <v-select
              v-model="newRole.role"
              :items="['HRManager', 'Hr', 'Manager', 'Employee', 'Admin']"
              label="Role"
              outlined
            ></v-select>

            <v-btn elevation="0" color="primary" @click="changeRole">
              Change Role</v-btn
            >

            <v-btn text @click="close"> Close </v-btn>
          </v-tab-item>
        </v-tabs-items>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['id', 'dialog'],
  async fetch() {
    try {
      this.departments = await this.$axios.$get(`/api/department/`)
      this.employees = await this.$axios.$get('/api/manager/short/list')

      this.user = await this.$axios.$get(`/api/profile/${this.id}`)

      this.newRole.role = this.user.user.role
    } catch (err) {
      console.log(err)
    }
  },
  data() {
    return {
      tab: null,
      employees: '',

      departments: [],
      user: {},
      passwordReset: {
        password1: '',
        password2: '',
        profile: this.id,
      },
      newRole: {
        id: this.id,
        role: '',
      },
      emailUnique: true,
      emailinputError: false,

      passwordStrong: false,
      passwordinputError: false,
    }
  },
  methods: {
    close() {
      this.$emit('close')
    },
    createUser() {
      this.$axios
        .patch(`/api/profile/${this.id}`, {
          name: this.user.name,
          department: this.user.department.id,
          email: this.user.email,
          citizenship_Status: this.user.citizenship_Status,
          division_Centre: this.user.division_Centre,
          nric: this.user.nric,
          phone: this.user.phone,
          gender: this.user.gender,
          job_Title: this.user.job_Title,
          first_Reporting_Manager: this.user.first_Reporting_Manager.id,
          second_Reporting_Manager: this.user.first_Reporting_Manager.id,
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success updating user',
            color: 'info',
          })

          this.$emit('reload-mainvue')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error updating user',
            color: 'error',
          })
        })
        .finally(() => {
          this.close()
        })
    },
    changePassword() {
      this.$axios
        .$post('/api/profile/setpassword', this.passwordReset)
        .then((res) => {
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
        .finally(() => {
          this.close()
        })
    },
    changeRole() {
      this.$axios
        .$post('/api/profile/changerole', this.newRole)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Role changed successully',
            color: 'info',
          })

          this.$emit('reload-mainvue')
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error changing role',
            color: 'error',
          })
        })
        .finally(() => {
          this.close()
        })
    },
    checkEmail() {
      this.$axios
        .$post('api/check/email', {
          email: this.user.email,
        })
        .then((_) => {
          this.emailUnique = true
          this.emailinputError = false
        })
        .catch((_) => {
          this.emailUnique = false
          this.emailinputError = true
        })
    },
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
  },
}
</script>
