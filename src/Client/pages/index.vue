<template>
  <div>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else>
      <div class="dialogs">
        <GoalSubmit
          v-if="submitGoalsDialog"
          :dialog="submitGoalsDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-goal-submit-dialog="submitGoalsDialog = false"
          @reload="$fetch"
        />
        <MidYearEmployeeReview
          v-if="midYearEmployeeReviewDialog"
          :dialog="midYearEmployeeReviewDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-mid-year-dialog="midYearEmployeeReviewDialog = false"
          @reload="$fetch"
        >
        </MidYearEmployeeReview>
        <EndYearEmployeeReview
          v-if="endYearEmployeeReviewDialog"
          :dialog="endYearEmployeeReviewDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-end-year-dialog="endYearEmployeeReviewDialog = false"
          @reload="$fetch"
        >
        </EndYearEmployeeReview>
        <EndYearEmployeeApprove
          v-if="endYearApproveDialog"
          :dialog="endYearApproveDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-approve-dialog="endYearApproveDialog = false"
          @reload="$fetch"
        >
        </EndYearEmployeeApprove>
        <MidYearEmployeeApprove
          v-if="midYearApproveDialog"
          :dialog="midYearApproveDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-mid-year-submit="midYearApproveDialog = false"
          @reload="$fetch"
        >
        </MidYearEmployeeApprove>
      </div>

      <div class="ma-5">
        <v-row>
          <v-col cols="3">
            <v-menu rounded="lg">
              <template v-slot:activator="{ on, attrs }">
                <v-btn color="primary" fab v-bind="attrs" v-on="on">
                  <v-icon>mdi-cached</v-icon>
                </v-btn>
              </template>

              <v-list>
                <v-list-item
                  v-for="(x, y) in appraisalData"
                  :key="y"
                  link
                  @click="changeAppraisal(y)"
                >
                  <v-list-item-title>
                    {{ x.appraisal_name }}
                  </v-list-item-title>
                </v-list-item>
              </v-list>
            </v-menu>
          </v-col>

          <v-col cols="9" style="display: flex; justify-content: flex-end">
            <div v-if="appraisalSelectedIndex != 0">
              <h3 class="font-weight-medium">
                {{ appraisalSelected.appraisal_name }} -
                {{ appraisalSelected.appraisal_category.name }}
              </h3>
              <small class="ma-0">
                Status:
                {{
                  getStatus(
                    appraisalSelected.overall_appraisal.status,
                    appraisalSelected.status,
                    appraisalSelected.mid_year_completion,
                    appraisalSelected.completion
                  )
                }}
              </small>
            </div>
            <div v-else>
              <h3 class="font-weight-medium">No Appraisal selected</h3>
            </div>
          </v-col>
        </v-row>
      </div>

      <div
        class="button-group ma-5"
        elevation="0"
        style="display: flex; justify-content: center"
      >
        <!--          goal submit-->

        <v-tooltip right>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                appraisalSelected.overall_appraisal.status === 'Stage 1' &&
                appraisalSelected.status === 'Employee'
              "
              class="success"
              @click="submitGoalsDialog = true"
              v-bind="attrs"
              v-on="on"
              ><v-icon>mdi-check-all</v-icon> Submit</v-btn
            >
          </template>
          <span>Submit Goals To Manager/Supervisor</span>
        </v-tooltip>

        <!--          mid year buttons-->
        <div v-if="(appraisalSelected.mid_year_completion = 'Uncompleted')">
          <v-tooltip>
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                v-if="
                  appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
                  (appraisalSelected.status === 'S1BEmployee' ||
                    appraisalSelected.status === 'S1BManager')
                "
                text
                @click="midYearEmployeeReviewDialog = true"
                v-bind="attrs"
                v-on="on"
                ><v-icon>mdi-message-draw</v-icon>Review</v-btn
              >
            </template>
            <span>Give Mid Year Review</span>
          </v-tooltip>

          <v-tooltip right>
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                v-if="
                  appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
                  appraisalSelected.status === 'S1BManager'
                "
                class="success"
                @click="midYearApproveDialog = true"
                v-bind="attrs"
                v-on="on"
                ><v-icon>mdi-check-all</v-icon> Submit</v-btn
              >
            </template>
            <span>Submit Mid Year Review</span>
          </v-tooltip>
        </div>

        <!--          end year buttons-->
        <v-tooltip right>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                (appraisalSelected.overall_appraisal.status === 'Stage 2' &&
                  appraisalSelected.status === 'S1BManager' &&
                  appraisalSelected.mid_year_completion === 'completed') ||
                (appraisalSelected.status === 'S2Employee' &&
                  appraisalSelected.completion === 'Ecompleted')
              "
              text
              @click="endYearEmployeeReviewDialog = true"
              v-bind="attrs"
              v-on="on"
              ><v-icon>mdi-message-draw</v-icon> Review</v-btn
            >
          </template>
          <span>Give End Year Review</span>
        </v-tooltip>

        <v-tooltip right>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                appraisalSelected.overall_appraisal.status === 'Stage 2' &&
                appraisalSelected.status === 'S2Employee' &&
                appraisalSelected.completion === 'Ecompleted'
              "
              class="success"
              @click="endYearApproveDialog = true"
              v-bind="attrs"
              v-on="on"
              ><v-icon>mdi-check-all</v-icon> Submit</v-btn
            >
          </template>
          <span>Submit End Year Review</span>
        </v-tooltip>
      </div>

      <AppraisalDetails
        v-if="appraisalSelectedIndex != 0"
        :appraisal="appraisalSelected"
        @reload-mainvue="$fetch()"
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

      this.changeAppraisal(0)
    } catch (error) {
      console.log(error)
    }
  },
  mounted() {
    if (window.localStorage.getItem('selected-appraisal') != null)
      this.changeAppraisal(
        parseInt(window.localStorage.getItem('selected-appraisal'))
      )
    else this.changeAppraisal(0)
  },
  data() {
    return {
      tabData: null,
      appraisalData: [],
      appraisalSelected: {},
      appraisalSelectedIndex: 0,
      submitGoalsDialog: false,
      midYearEmployeeReviewDialog: false,
      endYearEmployeeReviewDialog: false,
      endYearApproveDialog: false,
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
      this.appraisalSelected = this.appraisalData[i]
      this.appraisalSelectedIndex = this.appraisalSelected.id

      if(!this.$fetchState.pending)
        window.localStorage.setItem('selected-appraisal', i)
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
