<template>
  <v-dialog v-model="dialog" persistent width="800">
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
              label="Email"
              outlined
            ></v-text-field>

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
              :items="gender"
              label="Gender"
              outlined
            ></v-select>

            <v-text-field
              v-model="user.job_Title"
              label="Job Title"
              outlined
            ></v-text-field>

            <v-select
              v-model="user.first_Reporting_Manager"
              :items="employees"
              item-text="name"
              item-value="id"
              label="First reporting manager"
              outlined
            ></v-select>

            <v-select
              v-model="user.second_Reporting_Manager"
              :items="employees"
              item-text="name"
              item-value="id"
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
              v-model="newRole.role"
              :items="role"
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
  props: ['id', 'dialog', 'employees'],
  async fetch() {
    try {
      const response = await this.$axios.$get(`/api/profile/${this.id}`)
      this.departments = await this.$axios.$get(`/api/department/`)

      this.user = {
        id: response.id,
        name: response.name,
        department: response.department.id,
        email: response.email,
        citizenship_Status: response.citizenship_Status,
        division_Centre: response.division_Centre,
        nric: response.nric,
        phone: response.phone,
        gender: response.gender,
        job_Title: response.job_Title,
        first_Reporting_Manager: response.first_Reporting_Manager.id,
        second_Reporting_Manager: response.second_Reporting_Manager.id
      }
      this.newRole.role = this.user.user.role
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tab: null,
      dialog: false,
      role: ['HRManager', 'Hr', 'Manager', 'Employee', 'Admin'],
      gender: ['Male', 'Female'],
      departments: [],
      user: {
        id: 0,
        name: '',
        department: 0,
        email: '',
        citizenship_Status: '',
        division_Centre: '',
        nric: '',
        phone: '',
        gender: 'Male',
        job_Title: '',
        first_Reporting_Manager: 0,
        second_Reporting_Manager: 0
      },
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
    close() {
      this.$emit('close')
    },
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

          this.dialog = false
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

          this.dialog = false
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
  },
}
</script>
