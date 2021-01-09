<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>
  <div v-else class="ma-5">
    <div class="my-5">
      <AskQuery @reload-mainvue="$fetch()" />
    </div>
    <v-card flat>
      <v-card-title>
        <h3 class="my-5 text-center">Peer queries</h3>
      </v-card-title>
      <v-data-table :loading="loading" :headers="headers" :items="peerqueries">
        <template v-slot:[`item.actions`]="{ item }">
          <v-btn v-if="item.completion == 'Completed'" color="success" icon
            ><v-icon>mdi-checkbox-marked-circle-outline</v-icon>
          </v-btn>
          <v-btn v-else icon><v-icon>mdi-account-clock-outline</v-icon> </v-btn>
          <PeerQueryResolve :id="item.id" @reload-mainvue="$fetch()" />
        </template>
      </v-data-table>
    </v-card>
    <v-card flat>
      <v-card-title>
        <h3 class="my-5 text-center">My queries</h3>
      </v-card-title>
      <v-data-table :loading="loading" :headers="headers" :items="myqueries">
        <template v-slot:[`item.actions`]="{ item }">
          <v-btn v-if="item.completion == 'Completed'" color="success" icon
            ><v-icon>mdi-checkbox-marked-circle-outline</v-icon>
          </v-btn>
          <v-btn v-else icon><v-icon>mdi-account-clock-outline</v-icon> </v-btn>
          <PeerQueryResolve
            :id="item.id"
            :editMode="true"
            @reload-mainvue="$fetch()"
          />
        </template>
      </v-data-table>
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
          id: query.id,
          appraisal: query.appraisal.appraisal_name,
          employeeName: query.viewer.name,
          status: query.appraisal.status,
          completion: query.appraisal.completion,
          due: query.appraisal.overall_appraisal.calibration_end_date,
          dialog: false,
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
