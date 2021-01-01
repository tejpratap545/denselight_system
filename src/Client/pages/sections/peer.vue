<template>
  <div class="pa-5">
    <div class="d-flex justify-lg-space-between align-center">
      <AskQuery />
      <h3 class="font-weight-medium">Peer Queries</h3>
    </div>
    <v-card flat class="ma-5">
      <v-card-title>
        <h3 class="my-5 text-center">Peer queries</h3>
      </v-card-title>
      <v-data-table
        :loading="loading"
        :headers="headers"
        :items="peerqueries"
      ></v-data-table>
    </v-card>
    <v-card flat class="ma-5">
      <v-card-title>
        <h3 class="my-5 text-center">My queries</h3>
      </v-card-title>
      <v-data-table
        :loading="loading"
        :headers="headers"
        :items="myqueries"
      ></v-data-table>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'Peers',
  layout: 'dashboard-template',

  fetch() {
    this.$axios
      .$get('/api/peerappraisal/me')
      .then((response) => {
        this.loading = false
        response.forEach((query) => {
          this.peerqueries.push({
            appraisal: query.appraisal.name,
            employeeName: query.created_by.name,
            status: query.appraisal.status,
            due: query.appraisal.overall_appraisal.calibration_end_date,
          })
        })
      })
      .catch((error) => console.log(error))

       this.$axios
      .$get('/api/peerappraisal/manager')
      .then((response) => {
        this.loading = false
        response.forEach((query) => {
          this.myqueries.push({
            appraisal: query.appraisal.name,
            employeeName: query.created_by.name,
            status: query.appraisal.status,
            due: query.appraisal.overall_appraisal.calibration_end_date,
          })
        })
      })
      .catch((error) => console.log(error))
  },

  data() {
    return {
      loading: false,
      headers: [
        { text: 'Appraisal Name', value: 'appraisal' },
        { text: 'Employee Name', value: 'employeeName' },
        { text: 'Status', value: 'status' },
        { text: 'Due', value: 'due' },
      ],
      peerqueries: [],
      myqueries:[]
    }
  },
}
</script>
