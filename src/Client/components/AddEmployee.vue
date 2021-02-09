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
          @change="checkUser"
          :error="userinputError"
          outlined
        ></v-text-field>

        <v-alert type="warning" v-if="userinputError" text dense>
          Username must be unique
        </v-alert>
        <v-alert
          type="success"
          v-if="!userinputError && user.username != ''"
          text
          dense
        >
          Username is valid
        </v-alert>

        <v-text-field
          v-model="user.password"
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
          v-else-if="!passwordinputError && user.password != ''"
          text
          dense
        >
          Password is strong
        </v-alert>

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
          @change="checkEmail"
          :error="emailinputError"
          outlined
        ></v-text-field>

        <v-alert type="warning" v-if="emailinputError" text dense>
          Email must be unique
        </v-alert>
        <v-alert
          type="success"
          v-if="!emailinputError && user.email != ''"
          text
          dense
        >
          Email is valid
        </v-alert>

        <v-select
          v-model="user.gender"
          :items="['Male', 'Female']"
          label="Gender"
          outlined
        ></v-select>

        <v-select
          v-model="user.typeOfEmployee"
          :items="['DIRECT', 'INDIRECT']"
          label="Type of employee"
          outlined
        ></v-select>

        <v-text-field
          v-model="user.job_Title"
          label="Job Title"
          outlined
        ></v-text-field>

        <v-text-field v-model="user.nric" label="NRIC" outlined> </v-text-field>

        <v-text-field
          v-model="user.address_1"
          label="Address"
          outlined
        ></v-text-field>

        <v-text-field
          v-model="user.division_Centre"
          label="Division center"
          outlined
        ></v-text-field>

        <v-select
          v-model="user.department"
          :items="departments"
          label="Department"
          item-text="name"
          item-value="id"
          outlined
        ></v-select>

        <v-select
          v-model="user.employment_Type"
          :items="['Contractor', 'Full-time', 'Part-time', 'Internship']"
          label="Type of employee"
          outlined
        ></v-select>

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

        <v-alert type="warning" v-if="!formValid"
          >One or more entries are invalid</v-alert
        >
      </v-card-text>
      <v-card-actions>
        <v-btn color="primary" @click="createUser" :disabled="!formValid">
          Create
        </v-btn>
        <v-btn
          text
          @click="
            dialog = false
            reset()
          "
        >
          Close
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  async fetch() {
    try {
      this.employees = await this.$axios.$get('/api/employee/short/list')
      this.departments = await this.$axios.$get('/api/department/')
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      role: ['Admin', 'HRManager', 'Hr', 'Manager', 'Employee'],
      departments: [],
      employees: [],
      user: {
        username: '',
        password: '',
        typeOfEmployee: 'INDIRECT',
        role: '',
        name: '',
        email: '',

        nric: '',
        address_1: '',
        employment_Type: '',
        division_Centre: '',
        department: '',

        gender: '',
        date_Of_Hire: new Date().toISOString().substr(0, 10),
        job_Title: '',
        first_Reporting_Manager: 0,
        second_Reporting_Manager: 0,
      },
      userUnique: false,
      emailUnique: false,
      userinputError: false,
      emailinputError: false,
      passwordStrong: false,
      passwordinputError: false,
    }
  },
  methods: {
    reset() {
      this.user = {
        username: '',
        password: '',
        typeOfEmployee: 'INDIRECT',
        role: '',
        name: '',
        email: '',

        nric: '',
        address_1: '',
        employment_Type: '',
        division_Centre: '',
        department: '',

        gender: '',
        date_Of_Hire: new Date().toISOString().substr(0, 10),
        job_Title: '',
        first_Reporting_Manager: 0,
        second_Reporting_Manager: 0,
      }
    },
    createUser() {
      this.dialog = false

      this.$axios
        .$post('api/profile/create', this.user)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating user',
            color: 'info',
          })

          this.reset()
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
    checkUser() {
      this.$axios
        .$post('api/check/username', {
          username: this.user.username,
        })
        .then((_) => {
          this.userUnique = true
          this.userinputError = false
        })
        .catch((_) => {
          this.userUnique = false
          this.userinputError = true
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
          password: this.user.password,
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
  computed: {
    formValid: function () {
      return this.userUnique && this.emailUnique && this.passwordStrong
    },
  },
}
</script>
