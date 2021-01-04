<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn elevation="0" color="primary" dark v-bind="attrs" v-on="on">
        Update Profile
      </v-btn>
    </template>

    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Edit Employee </v-card-title>

      <v-card-text style="height: 500px overflow-y:scroll">
        <v-text-field
          label="Username"
          v-model="user.user.username"
          outlined
        ></v-text-field>

        <v-select
          :items="role"
          v-model="user.user.role"
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
      </v-card-text>
      <v-card-actions>
        <v-btn color="primary" @click="createUser"> Save </v-btn>
        <v-btn text @click="dialog = false"> Close </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['id'],
  async fetch() {
    try {
      this.employees = await this.$axios.$get('/api/employee/short/list')
      this.user = await this.$axios.$get(`/api/profile/${this.id}`)
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
  },
}
</script>
