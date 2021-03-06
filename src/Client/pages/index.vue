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
      <div v-if="appraisalSelectedIndex != 0" class="dialogs">
        <GoalSubmit
          v-if="submitGoalsDialog"
          :dialog="submitGoalsDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-goal-submit-dialog="submitGoalsDialog = false"
          @reload="fetchData"
        />
        <MidYearEmployeeReview
          v-if="midYearEmployeeReviewDialog"
          :dialog="midYearEmployeeReviewDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-mid-year-dialog="midYearEmployeeReviewDialog = false"
          @reload="fetchData"
        >
        </MidYearEmployeeReview>
        <EndYearEmployeeReview
          v-if="endYearEmployeeReviewDialog"
          :dialog="endYearEmployeeReviewDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-end-year-dialog="endYearEmployeeReviewDialog = false"
          @reload="fetchData"
        >
        </EndYearEmployeeReview>
        <EndYearEmployeeApprove
          v-if="endYearApproveDialog"
          :dialog="endYearApproveDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-approve-dialog="endYearApproveDialog = false"
          @reload="fetchData"
        >
        </EndYearEmployeeApprove>
        <MidYearEmployeeApprove
          v-if="midYearApproveDialog"
          :dialog="midYearApproveDialog"
          :appraisal-id="appraisalSelectedIndex"
          @close-mid-year-submit="midYearApproveDialog = false"
          @reload="fetchData"
        >
        </MidYearEmployeeApprove>
      </div>

      <div class="ma-5">
        <v-row>
          <v-col v-if="appraisalSelectedIndex != 0" cols="3">
            <v-menu rounded="lg">
              <template v-slot:activator="{ on: dialogon, attrs: dialogattrs }">
                <v-tooltip bottom>
                  <template
                    v-slot:activator="{ on: tooltip, attrs: tooltipattrs }"
                  >
                    <v-btn
                      color="primary"
                      fab
                      v-bind="{ ...dialogattrs, ...tooltipattrs }"
                      v-on="{ ...dialogon, ...tooltip }"
                    >
                      <v-icon>mdi-cached</v-icon>
                    </v-btn>
                  </template>
                  <span>Change To Select Appraisal</span>
                </v-tooltip>
              </template>

              <v-list>
                <v-list-item-group v-model="selectedItem" color="primary">
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
                </v-list-item-group>
              </v-list>
            </v-menu>
          </v-col>

          <v-col
            v-if="appraisalSelectedIndex != 0"
            cols="9"
            style="display: flex; justify-content: flex-end"
          >
            <div>
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

              <a target="_blank" :href="`/print/?id=${appraisalSelected.id}`">
                <v-tooltip bottom>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" icon v-on="on">
                      <v-icon>mdi-printer</v-icon>
                    </v-btn>
                  </template>
                  <span>Print Appraisal</span>
                </v-tooltip>
              </a>
            </div>
          </v-col>
          <div
            v-else
            style="display: flex; justify-content: center; width: 100%"
          >
            <h3 class="font-weight-medium">No Appraisal available</h3>
          </div>
        </v-row>
      </div>

      <div
        v-if="appraisalSelectedIndex != 0"
        class="button-group ma-5"
        elevation="0"
        style="display: flex; justify-content: center"
      >
        <!--          goal submit-->
        <v-tooltip
          v-if="
            appraisalSelected.overall_appraisal.status === 'Stage 1' &&
            appraisalSelected.status === 'Employee'
          "
          bottom
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                appraisalSelected.overall_appraisal.status === 'Stage 1' &&
                appraisalSelected.status === 'Employee'
              "
              class="success"
              v-bind="attrs"
              @click="submitGoalsDialog = true"
              v-on="on"
              ><v-icon>mdi-check-all</v-icon> Submit</v-btn
            >
          </template>
          <span>Submit Goals</span>
        </v-tooltip>

        <!--          mid year buttons-->

        <div v-if="appraisalSelected.mid_year_completion === 'Uncompleted'">
          <v-tooltip
            v-if="
              appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
              (appraisalSelected.status === 'S1BEmployee' ||
                appraisalSelected.status === 'S2BEmployee')
            "
            bottom
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                v-if="
                  appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
                  (appraisalSelected.status === 'S1BEmployee' ||
                    appraisalSelected.status === 'S2BEmployee')
                "
                text
                v-bind="attrs"
                @click="midYearEmployeeReviewDialog = true"
                v-on="on"
                ><v-icon>mdi-message-draw</v-icon>Review</v-btn
              >
            </template>
            <span>Edit Mid Year Review</span>
          </v-tooltip>

          <v-tooltip
            v-if="
              appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
              appraisalSelected.status === 'S2BEmployee'
            "
            bottom
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                v-if="
                  appraisalSelected.overall_appraisal.status === 'Stage 1B' &&
                  appraisalSelected.status === 'S2BEmployee'
                "
                class="success"
                v-bind="attrs"
                @click="midYearApproveDialog = true"
                v-on="on"
                ><v-icon>mdi-check-all</v-icon> Submit</v-btn
              >
            </template>
            <span>Submit Mid Year Review</span>
          </v-tooltip>
        </div>

        <!--          end year buttons-->

        <v-tooltip
          v-if="
            (appraisalSelected.overall_appraisal.status === 'Stage 2' &&
              appraisalSelected.status === 'S1BManager') ||
            ((appraisalSelected.overall_appraisal.status === 'Stage 2' &&
              appraisalSelected.status) === 'S2Employee' &&
              appraisalSelected.completion === 'Ecompleted')
          "
          bottom
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                (appraisalSelected.overall_appraisal.status === 'Stage 2' &&
                  appraisalSelected.status === 'S1BManager') ||
                ((appraisalSelected.overall_appraisal.status === 'Stage 2' &&
                  appraisalSelected.status) === 'S2Employee' &&
                  appraisalSelected.completion === 'Ecompleted')
              "
              text
              v-bind="attrs"
              v-on="on"
              @click="endYearEmployeeReviewDialog = true"
              ><v-icon>mdi-message-draw</v-icon> Review</v-btn
            >
          </template>
          <span>Edit End Year Review</span>
        </v-tooltip>

        <v-tooltip
          v-if="
            appraisalSelected.overall_appraisal.status === 'Stage 2' &&
            appraisalSelected.status === 'S2Employee' &&
            appraisalSelected.completion === 'Ecompleted'
          "
          bottom
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="
                appraisalSelected.overall_appraisal.status === 'Stage 2' &&
                appraisalSelected.status === 'S2Employee' &&
                appraisalSelected.completion === 'Ecompleted'
              "
              class="success"
              v-bind="attrs"
              @click="endYearApproveDialog = true"
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
        @reload-mainvue="fetchData()"
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
    await this.fetchData()
  },

  data() {
    return {
      selectedItem: 0,
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
    if (this.$fetchState.timestamp <= Date.now() - 10000) {
      this.fetchData()
    }
  },
  methods: {
    async fetchData() {
      try {
        this.appraisalData = await this.$axios.$get(
          '/api/appraisals/list/detail/me'
        )

        if (this.appraisalData.length != 0) {
          const i = window.localStorage.getItem('selected-appraisal')
          if (i != null) {
            if (parseInt(i) < this.appraisalData.length)
              this.changeAppraisal(parseInt(i))
            else this.changeAppraisal(0)
          } else this.changeAppraisal(0)
        }
      } catch (error) {
        console.log(error)
      }
    },
    changeAppraisal(i) {
      this.appraisalSelected = this.appraisalData[i]
      this.appraisalSelectedIndex = this.appraisalSelected.id

      window.localStorage.setItem('selected-appraisal', i)

      this.selectedItem = i
    },
  },
  fetchOnServer: false,
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
