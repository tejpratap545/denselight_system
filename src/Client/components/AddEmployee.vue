<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn elevation="0" color="primary" dark v-bind="attrs" v-on="on">
        Add Employee
      </v-btn>
    </template>

    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Add Employee </v-card-title>

      <v-card-text style="height: 500px overflow-y:scroll">
        <v-text-field
          v-model="user.username"
          label="Username"
          outlined
        ></v-text-field>
        <v-text-field
          v-model="user.password"
          label="Password"
          outlined
        ></v-text-field>

        <v-select
          v-model="user.role"
          :items="role"
          label="Role"
          outlined
        ></v-select>

        <v-text-field
          v-model="user.name"
          label="Full Name"
          outlined
        ></v-text-field>
        <v-text-field
          v-model="user.email"
          label="email"
          outlined
        ></v-text-field>

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
      </v-card-text>
      <v-card-actions>
        <v-btn color="primary" @click="createUser"> Create </v-btn>
        <v-btn text @click="dialog = false"> Close </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  async fetch() {
    try {
      this.employees = await this.$axios.$get('/api/employee/short/list')
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
      user: {
        username: '',
        password: '',
        typeOfEmployee: 'INDIRECT',
        role: '',
        name: '',
        email: '',
        gender: '',
        date_Of_Hire: new Date().toISOString().substr(0, 10),
        job_Title: '',
        first_Reporting_Manager: 0,
        second_Reporting_Manager: 0,
      },
    }
  },
  methods: {
    createUser() {
      this.$axios
        .$post('api/profile/create', this.user)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating user',
            color: 'info',
          })
          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating user',
            color: 'error',
          })
        })
        .finally(() => {
          this.$emit('close')
        })
    },
  },
}
</script>
