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
      <v-data-table :loading="loading" :headers="headers" :items="peerqueries">
        <template v-slot:[`item.actions`]="{ item }">
          <PeerQueryResolve :id="item.id" />
        </template>
      </v-data-table>
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

  async fetch() {
    try {
      var response = await this.$axios.$get('/api/peerappraisal/me')

      response.forEach((query) => {
        this.peerqueries.push({
          id: query.id,
          appraisal: query.appraisal.appraisal_name,
          employeeName: query.created_by.name,
          status: query.appraisal.status,
          due: query.appraisal.overall_appraisal.calibration_end_date,
          dialog: false,
        })
      })

      response = await this.$axios.$get('/api/peerappraisal/manager')

      response.forEach((query) => {
        this.myqueries.push({
          appraisal: query.appraisal.appraisal_name,
          employeeName: query.created_by.name,
          status: query.appraisal.status,
          due: query.appraisal.overall_appraisal.calibration_end_date,
        })
      })

      this.loading = false
    } catch (error) {
      this.loading = false

      console.log(error)
    }
  },

  data() {
    return {
      loading: false,
      headers: [
        { text: 'Appraisal Name', value: 'appraisal' },
        { text: 'Employee Name', value: 'employeeName' },
        { text: 'Status', value: 'status' },
        { text: 'Due', value: 'due' },
        { text: 'Actions', value: 'actions' },
      ],
      peerqueries: [],
      myqueries: [],
    }
  },
}
</script>
