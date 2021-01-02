<template>
  <div class="pa-5">
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="px-10 my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else>
      <MidYearEmployeeReview
        v-if="midYearEmployeeReviewDialog"
        :dialog="midYearEmployeeReviewDialog"
        :appraisal-id="appraisalSelectedIndex"
        @close-mid-year-dialog="midYearEmployeeReviewDialog = false"
      >
      </MidYearEmployeeReview>
      <EndYearEmployeeReview
        v-if="endYearEmployeeReviewDialog"
        :dialog="endYearEmployeeReviewDialog"
        :appraisal-id="appraisalSelectedIndex"
        @close-end-year-dialog="endYearEmployeeReviewDialog = false"
      >
      </EndYearEmployeeReview>
      <ApproveReviews
        v-if="approveReviewDialog"
        :dialog="approveReviewDialog"
        :appraisal-id="appraisalSelectedIndex"
        @close-approve-dialog="approveReviewDialog = false"
      >
      </ApproveReviews>
      <MidYearEmployeeApprove
        v-if="midYearApproveDialog"
        :dialog="midYearApproveDialog"
        :appraisal-id="appraisalSelectedIndex"
        @close-mid-year-submit="midYearApproveDialog = false"
      >
      </MidYearEmployeeApprove>
      <v-card flat>
        <v-card-title class="d-flex justify-lg-space-between align-center">
          <v-menu rounded="lg">
            <template v-slot:activator="{ on, attrs }">
              <v-btn elevation="0" color="primary" v-bind="attrs" v-on="on">
                Change Appraisal
              </v-btn>
            </template>

            <v-list>
              <v-list-item v-for="(x, y) in appraisalData" :key="y" link>
                <v-list-item-title @click="changeAppraisal(x)">
                  {{ x.appraisal_name }}
                </v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>

          <div v-if="appraisalSelectedIndex != 0">
            <h3 class="font-weight-medium">
              {{ appraisalSelected.appraisal_name }} -
              {{ appraisalSelected.appraisal_category.name }}
            </h3>
            <p class="ma-0">
              Status:
              {{
                getStatus(
                  appraisalSelected.overall_appraisal.status,
                  appraisalSelected.status
                )
              }}
            </p>
          </div>
          <div v-else>
            <h3 class="font-weight-medium">No Appraisal selected</h3>
          </div>
        </v-card-title>

        <v-toolbar class="button-group mx-5" elevation="0" color="#eee" rounded>
          <v-btn
            v-if="appraisalSelected.overall_appraisal.status === 'Stage 1B'"
            text
            @click="midYearEmployeeReviewDialog = true"
            ><v-icon>mdi-message-draw</v-icon> Add Mid Year Review</v-btn
          >
          <v-btn text @click="endYearEmployeeReviewDialog = true"
            ><v-icon>mdi-message-draw</v-icon> Add End Year Review</v-btn
          >
          <v-btn
            v-if="appraisalSelected.overall_appraisal.status === 'Stage 2'"
            class="success"
            @click="approveReviewDialog = true"
            ><v-icon>mdi-check-all</v-icon> Approve Reviews</v-btn
          >
          <v-btn
            v-if="appraisalSelected.overall_appraisal.status === 'Stage 1B'"
            class="success"
            @click="midYearApproveDialog = true"
            ><v-icon>mdi-check-all</v-icon> Submit Mid Year Reviews</v-btn
          >
        </v-toolbar>
      </v-card>

      <AppraisalDetails
        v-if="appraisalSelectedIndex != 0"
        :appraisal="appraisalSelected"
      />
    </div>
  </div>
</template>

<script>
import global from '~/mixins/global'

export default {
  title: 'Dashboard',
  layout: 'dashboard-template',
  mixins: [global],
  async fetch() {
    try {
      this.appraisalData = await this.$axios.$get(
        '/api/appraisals/list/detail/me'
      )
      this.changeAppraisal(this.appraisalData[0])
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tabData: null,
      appraisalData: [],
      appraisalSelected: {},
      appraisalSelectedIndex: 0,
      midYearEmployeeReviewDialog: false,
      endYearEmployeeReviewDialog: false,
      approveReviewDialog: false,
      midYearApproveDialog: false,
    }
  },

  activated() {
    // Call fetch again if last fetch more than 30 sec ago
    if (this.$fetchState.timestamp <= Date.now() - 30000) {
      this.$fetch()
    }
  },
  methods: {
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.appraisalSelectedIndex = this.appraisalSelected.id
    },
  },
}
</script>

<style>
.button-group button {
  margin: 0 10px;
}
.button-group {
  display: flex;
  justify-content: space-evenly;
}
</style>
