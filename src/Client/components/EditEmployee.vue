<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="success" dark v-bind="attrs" v-on="on" icon>
        <v-icon>mdi-circle-edit-outline</v-icon>
      </v-btn>
    </template>

    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Edit Employee </v-card-title>

      <v-card-text>
        <v-tabs v-model="tab">
          <v-tab>Basic details</v-tab>
          <v-tab>Change Password</v-tab>
          <v-tab>Change Role</v-tab>
        </v-tabs>

        <v-tabs-items v-model="tab" style="height: 600px; overflow-y:scroll; padding:20px 5px">
          <v-tab-item>
            <v-text-field
              label="Full Name"
              v-model="user.name"
              outlined
            ></v-text-field>
            <v-text-field
              label="email"
              v-model="user.email"
              outlined
            ></v-text-field>

            <v-select
              :items="gender"
              v-model="user.gender"
              label="Gender"
              outlined
            ></v-select>

            <v-text-field
              label="Job Title"
              v-model="user.job_Title"
              outlined
            ></v-text-field>

            <v-select
              :items="employees"
              item-text="name"
              item-value="id"
              v-model="user.first_Reporting_Manager"
              label="First reporting manager"
              outlined
            ></v-select>

            <v-select
              :items="employees"
              item-text="name"
              item-value="id"
              v-model="user.second_Reporting_Manager"
              label="Second reporting manager"
              outlined
            ></v-select>

            <v-btn color="primary" @click="createUser"> Save </v-btn>
            <v-btn text @click="dialog = false"> Close </v-btn>
          </v-tab-item>
          <v-tab-item>
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
            <v-btn text @click="dialog = false"> Close </v-btn>
          </v-tab-item>
          <v-tab-item>
            <v-select
              :items="role"
              v-model="newRole.role"
              label="Role"
              outlined
            ></v-select>

            <v-btn elevation="0" color="primary" @click="changeRole">
              Change Role</v-btn
            >
            <v-btn text @click="dialog = false"> Close </v-btn>
          </v-tab-item>
        </v-tabs-items>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['id'],
  async fetch() {
    try {
      this.employees = await this.$axios.$get('/api/employee/short/list')
      const response = await this.$axios.$get(`/api/profile/${this.id}`)

      this.user = {
        id: this.id,
        name: response.name,
        email: response.email,
        gender: response.gender,
        date_Of_Hire: response.date_Of_Hire,
        job_Title: response.job_Title,
        first_Reporting_Manager: response.first_Reporting_Manager.id,
        second_Reporting_Manager: response.second_Reporting_Manager.id,
      }

      this.newRole.role = response.role
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tab: null,
      dialog: false,
      role: ['HRManager', 'Hr', 'Manager', 'Employee'],
      gender: ['Male', 'Female'],
      employees: [],
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
    }
  },
  methods: {
    createUser() {
      this.$axios
        .patch(`/api/profile/${this.id}`, this.user)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success updating user',
            color: 'info',
          })

          this.dialog = false
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error updating user',
            color: 'error',
          })
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

          this.dialog = false
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error changing password',
            color: 'error',
          })
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

          this.dialog = false
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error changing role',
            color: 'error',
          })
        })
    },
  },
}
</script>
