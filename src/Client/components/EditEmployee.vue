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

      <v-card-text style="height: 500px overflow-y:scroll">
        <div>
          <h3>Update basic details</h3>
          <v-select
            :items="role"
            v-model="user.role"
            label="Role"
            outlined
          ></v-select>

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
        </div>

        <v-divider class="my-10"></v-divider>

        <div>
          <h3 class="my-5">Reset Password</h3>
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
        </div>
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
        role: response.user.role,
        name: response.name,
        email: response.email,
        gender: response.gender,
        date_Of_Hire: response.date_Of_Hire,
        job_Title: response.job_Title,
        first_Reporting_Manager: response.first_Reporting_Manager.id,
        second_Reporting_Manager: response.second_Reporting_Manager.id,
      }
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
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

          dialog = false
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

          dialog = false
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error changing password',
            color: 'error',
          })
        })
    },
  },
}
</script>
