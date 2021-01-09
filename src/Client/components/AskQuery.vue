<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" elevation="0" dark v-bind="attrs" v-on="on">
        Create Appraisal
      </v-btn>
    </template>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>

    <v-card v-else>
      <v-card-title class="headline py-5"> Ask Query </v-card-title>

      <v-card-text>
        <v-stepper v-model="e1">
          <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1">
              Basic Details
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step :complete="e1 > 2" step="2">
              Select Employees
            </v-stepper-step>
          </v-stepper-header>

          <v-stepper-items>
            <v-stepper-content step="1">
              <div class="mb-12" style="height: 400px">
                <v-select
                  v-model="peerappraisal.appraisal"
                  :items="appraisals"
                  item-text="name"
                  item-value="id"
                  label="Select Appraisals"
                ></v-select>

                <v-text-field
                  v-model="peerappraisal.title1"
                  label="Query 1"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="peerappraisal.title2"
                  label="Query 2"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="peerappraisal.title3"
                  label="Query 3"
                  required
                ></v-text-field>
              </div>

              <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>
              <v-btn
                text
                @click="this.reset()"
              >
                Close
              </v-btn>
            </v-stepper-content>

            <v-stepper-content step="2">
              <div class="mb-12" style="height: 400px">
                <v-combobox
                  v-model="peerappraisal.employee_list"
                  :items="employees"
                  item-text="name"
                  item-value="id"
                  label="Select Employee(s)"
                  multiple
                  chips
                ></v-combobox>
              </div>

              <v-btn color="primary" @click="askQuery"> Save query </v-btn>
              <v-btn text @click="e1 = 1"> Back </v-btn>
            </v-stepper-content>
          </v-stepper-items>
        </v-stepper>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  async fetch() {
    try {
      var response = await this.$axios.$get(
        '/api/appraisals/list/short/manager'
      )
      response.forEach((user) => {
        user.user_appraisal_list_set.forEach((appraisal) => {
          this.appraisals.push({
            id: appraisal.id,
            name: appraisal.appraisal_name,
          })
        })
      })

      response = await this.$axios.$get('/api/employee/short/list')
      response.forEach((employee) => {
        this.employees.push({
          id: employee.id,
          name: employee.name,
        })
      })
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      e1: 1,
      employees: [],
      appraisals: [],
      peerappraisal: {
        appraisal: 0,
        title1: '',
        title2: '',
        title3: '',
        employee_list: [],
      },
    }
  },
  methods: {
    reset() {
      this.dialog = false

      this.e1 = 1
      this.peerappraisal = {
        appraisal: 0,
        title1: '',
        title2: '',
        title3: '',
        employee_list: [],
      }
    },
    askQuery() {
      this.peerappraisal.employee_list = this.peerappraisal.employee_list.map(
        (i) => i.id
      )

      this.$axios
        .$post('/api/peerappraisal/create', this.peerappraisal)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success asking query',
            color: 'info',
          })

          this.reset()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error asking query',
            color: 'error',
          })

          this.reset()

          console.log(error, this.appraisal)
        })
    },
  },
}
</script>
