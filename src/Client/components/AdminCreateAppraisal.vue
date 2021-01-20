<template>
  <v-dialog
    v-model="dialog"
    persistent
    transition="dialog-bottom-transition"
    max-width="700"
  >
    <v-card>
      <v-card-title class="subtitle"> Create Employee Appraisal </v-card-title>
      <div v-if="$fetchState.pending">
        <v-skeleton-loader
          class="px-10 my-5"
          type=" table-thead, card-heading, card"
        ></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>
      <div v-else>
        <v-card-text>
          <v-row justify="space-around">
            <v-col cols="3">Select Appraisals</v-col>
            <v-col>
              <v-combobox
                v-model="appraisal"
                :items="appraisals"
                item-text="name"
                item-value="id"
                label="Select Appraisals"
                chips
                return-object
              >
              </v-combobox
            ></v-col>
          </v-row>
          <v-row>
            <v-col cols="3">Select Employee</v-col>
            <v-col>
              <v-combobox
                v-model="employee"
                :items="employees"
                item-text="name"
                item-value="id"
                label="Select Employee"
                chips
                return-object
              >
              </v-combobox>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text color="info" @click="close">Close</v-btn>
          <v-btn text color="success" @click="create">Create</v-btn>
        </v-card-actions>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['dialog'],
  async fetch() {
    this.appraisals = await this.$axios.$get('api/overallAppraisal/')
    this.employees = await this.$axios.$get('/api/employee/list/')
  },
  data() {
    return {
      appraisals: {},
      employees: {},
      employee: '',
      appraisal: '',
    }
  },
  activated() {
    // Call fetch again if last fetch more than a minute ago
    if (this.$fetchState.timestamp <= Date.now() - 60000) {
      this.$fetch()
    }
  },
  methods: {
    close() {
      this.$emit('close')
    },
    async create() {
      await this.$axios
        .$post('api/appraisals/admin/', {
          employee: this.employee.id,
          overall_appraisal: this.appraisal.id,
          manager: this.employee.first_Reporting_Manager.id,
          status: 'Employee',
          appraisal_name: this.appraisal.name,
          appraisal_category: this.appraisal.appraisal_category,
          start_date: this.appraisal.start_date,
          end_date: this.appraisal.calibration_end_date,
          completion: 'null',
        })
        .then(() => {
          this.$notifier.showMessage({
            content: `You  have Successfully created ${this.appraisal.name} for ${this.employee.name} .`,
            color: 'info',
          })

          this.$emit('reload')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error found please validate or try again',
            color: 'error',
          })
          this.close()
        })
    },
  },
}
</script>

<style></style>
