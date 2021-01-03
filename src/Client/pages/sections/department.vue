<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else class="pa-5">
    <div class="dialogs">
      <GoalApproved
        v-if="goalsApprovedDialog"
        :dialog="goalsApprovedDialog"
        :appraisal-id="currentAppraisalId"
        @close-goal-approved-dialog="goalsApprovedDialog = false"
      />
      <MidYearManagerReview
        v-if="MidYearManagerReviewDialog"
        :dialog="MidYearManagerReviewDialog"
        :appraisal-id="currentAppraisalId"
        @close-mid-year-manager-dialog="MidYearManagerReviewDialog = false"
      />
      <MidYearManagerApprove
        v-if="MidYearManagerSubmitDialog"
        :dialog="MidYearManagerSubmitDialog"
        :appraisal-id="currentAppraisalId"
        @close-mid-year-manager-submit-dialog="
          MidYearManagerSubmitDialog = false
        "
      />
      <EndYearManagerReview
        v-if="ENDYearManagerReviewDialog"
        :dialog="ENDYearManagerReviewDialog"
        :appraisal-id="currentAppraisalId"
        @close-end-year-manager-dialog="ENDYearManagerReviewDialog = false"
      />
      <EndYearManagerApprove
        v-if="ENDYearManagerSubmitDialog"
        :dialog="ENDYearManagerSubmitDialog"
        :appraisal-id="currentAppraisalId"
        @close-end-year-manager-submit-dialog="
          ENDYearManagerSubmitDialog = false
        "
      />
      <AddGoalDepartment
        v-if="addGoalsDialog"
        :dialog="addGoalsDialog"
        :appraisal-id="appraisalSelected.id"
        @close-goal-dialog="addGoalsDialog = false"
      />
       <AddCoreValueDepartment
        v-if="addCoreDialog"
        :dialog="addCoreDialog"
        :appraisal-id="appraisalSelected.id"
        @close-core-dialog="addCoreDialog = false"
      />
    </div>
    <div class="d-flex justify-lg-space-between align-center">
      <span />
      <h3 class="font-weight-medium">
        <b>{{ this.$auth.user.department.name }}</b> Department
      </h3>
    </div>
    <div class="px-10 my-5">
      <v-tabs
        v-model="tabData"
        background-color="transparent"
        color="#2952A4"
        centered
        grow
      >
        <v-tab>Department Details</v-tab>
        <v-tab>Department Goals and Core Values</v-tab>
        <v-tab>Subordinate Appraisals</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tabData">
        <v-tab-item>
          <v-card class="my-5" flat>
            <h3 class="my-5 text-center">Employee Details</h3>
            <v-data-table
              :headers="employeesTableHeader"
              :items="employeesTableItems"
              :items-per-page="10"
              :loading="loading"
              group-by="name"
              show-group-by
            >
            </v-data-table>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-card flat>
                <v-card-title
                  class="d-flex justify-lg-space-between align-center"
                >
                  <v-menu rounded="lg">
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        elevation="0"
                        color="primary"
                        v-bind="attrs"
                        v-on="on"
                      >
                        Change Appraisal
                      </v-btn>
                    </template>

                    <v-list>
                      <v-list-item
                        v-for="(x, y) in appraisalData"
                        :key="y"
                        link
                        @click="changeAppraisal(x)"
                      >
                        <v-list-item-title>
                          {{ x.name }}
                        </v-list-item-title>
                      </v-list-item>
                    </v-list>
                  </v-menu>

                  <div v-if="appraisalSelectedIndex != 0">
                    <h3 class="font-weight-medium">
                      {{ appraisalSelected.name }} -
                      {{ appraisalSelected.appraisal_category.name }}
                    </h3>
                    <p style="font-size: 16px">
                      {{ appraisalSelected.status }}
                    </p>
                  </div>
                  <div v-else>
                    <h3 class="font-weight-medium">No Appraisal selected</h3>
                  </div>
                </v-card-title>
              </v-card>
            </v-card-text>
          </v-card>

          <div>
            <v-card flat>
              <v-toolbar
                elevation="0"
                class="ma-5"
                color="primary"
                rounded
                dark
              >
                <b>Departmental Goals</b>
                <v-spacer></v-spacer>

                <v-btn
                  v-if="appraisalSelected.status == 'Stage 1'"
                  @click="addGoalsDialog = true"
                  icon
                >
                  <v-icon>mdi-plus</v-icon>
                </v-btn>
              </v-toolbar>
              <v-card-text>
                <v-data-table
                  :headers="departmentGoalsHeader"
                  :items="departmentGoalsItems"
                  :items-per-page="5"
                ></v-data-table>
              </v-card-text>
            </v-card>
          </div>

          <div>
            <v-card flat>
              <v-toolbar
                elevation="0"
                class="ma-5"
                color="primary"
                rounded
                dark
              >
                <b>Departmental Core Values</b>
                <v-spacer></v-spacer>

                <v-btn
                  v-if="appraisalSelected.status == 'Stage 1'"
                  @click="addCoreDialog = true"
                  icon
                >
                  <v-icon>mdi-plus</v-icon>
                </v-btn>
              </v-toolbar>
              <v-card-text>
                <v-data-table
                  :headers="departmentValuesHeader"
                  :items="departmentValuesItems"
                  :items-per-page="5"
                ></v-data-table>
              </v-card-text>
            </v-card>
          </div>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <div class="my-5">
                <v-tabs vertical background-color="transparent" color="#2952A4">
                  <v-tab class="justify-start">GOALS LAUNCHING</v-tab>
                  <v-tab class="justify-start">MID-YEAR REVIEW</v-tab>
                  <v-tab class="justify-start">YEAR-END REVIEW</v-tab>
                  <v-tab class="justify-start">REPORTS</v-tab>
                  <v-tab class="justify-start">CALBRATION</v-tab>
                  <v-tab class="justify-start">LOGS</v-tab>

                  <!-- GOALS LAUNCHING -->
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text>
                        <v-data-table
                          :headers="goalsLaunchingTableHeader"
                          :items="goalsLaunchingTableItems"
                          :items-per-page="10"
                          :loading="loading"
                        >
                          <template v-slot:[`item.action`]="{ item }">
                            <v-btn
                              v-model="item.action"
                              color="transparent"
                              elevation="0"
                              @click="showGaolApproval(item)"
                            >
                              <i class="fas fa-ellipsis-h"></i>
                            </v-btn>
                          </template>
                        </v-data-table>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>

                  <!-- MID-YEAR REVIEW -->
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text>
                        <v-data-table
                          :headers="goalsLaunchingTableHeader"
                          :items="midYearTableItems"
                          :items-per-page="10"
                          :loading="loading"
                        >
                          <template v-slot:[`item.action`]="{ item }">
                            <v-icon
                              v-if="
                                item.mid_year_completion == 'Completed' &&
                                item.status == 'S1BManager'
                              "
                              color="success"
                            >
                              mdi-checkbox-marked-circle-outline</v-icon
                            >
                            <div v-else>
                              <v-btn
                                v-if="
                                  item.status == 'S1BReview' ||
                                  item.status == 'S1BManager'
                                "
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                                @click="showMidReview(item)"
                              >
                                <v-icon color="info"
                                  >mdi-calendar-check
                                </v-icon>
                              </v-btn>
                              <v-btn
                                v-if="item.status == 'S1BManager'"
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                                @click="showMidSubmit(item)"
                              >
                                <v-icon color="info"
                                  >mdi-checkbox-marked-circle-outline
                                </v-icon>
                              </v-btn>
                            </div>
                          </template>
                        </v-data-table>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>
                  <!-- END-YEAR REVIEW -->
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text>
                        <v-data-table
                          :headers="goalsLaunchingTableHeader"
                          :items="endYearTableItems"
                          :items-per-page="10"
                          :loading="loading"
                        >
                          <template v-slot:[`item.action`]="{ item }">
                            <v-icon
                              v-if="
                                item.status == 'Approved' &&
                                item.completion == 'MCompleted'
                              "
                              color="success"
                            >
                              mdi-checkbox-marked-circle-outline</v-icon
                            >
                            <div v-else>
                              <v-btn
                                v-if="
                                  (item.status == 'S2Manager' &&
                                    item.completion == 'Ecompleted') ||
                                  (item.status == 'S2Manager' &&
                                    item.completion == 'MCompleted')
                                "
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                                @click="showEndReview(item)"
                              >
                                <v-icon color="info"
                                  >mdi-calendar-check
                                </v-icon>
                              </v-btn>
                              <v-btn
                                v-if="
                                  item.status == 'S2Manager' &&
                                  item.completion == 'MCompleted'
                                "
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                                @click="showEndSubmit(item)"
                              >
                                <v-icon color="info"
                                  >mdi-checkbox-marked-circle-outline
                                </v-icon>
                              </v-btn>
                            </div>
                          </template>
                        </v-data-table>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text> </v-card-text>
                    </v-card>
                  </v-tab-item>
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text> </v-card-text>
                    </v-card>
                  </v-tab-item>
                  <v-tab-item>
                    <v-card flat>
                      <v-card-text> </v-card-text>
                    </v-card>
                  </v-tab-item>
                </v-tabs>
              </div>
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
</template>

<script>
export default {
  title: 'Department',
  name: 'Department',
  layout: 'dashboard-template',
  async fetch() {
    try {
      var response = await this.$axios.$get('api/appraisals/list/manager')

      response.forEach(async (appraisal) => {
        this.employeesTableItems.push({
          id: appraisal.id,
          department: appraisal.employee.department.name,
          stage: appraisal.overall_appraisal.status,
          name: appraisal.employee.name,
          date_of_hire: appraisal.employee.date_Of_Hire,
          appraisal_name: appraisal.appraisal_name,
          appraisal_stage: appraisal.stage,
        })

        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,
          employee: appraisal.employee.name,
          mid_year_completion: appraisal.mid_year_completion,
          goals_count: appraisal.goals_count,
          core_values_count: appraisal.core_values_competencies_count,
          completion: appraisal.completion,
          skills_count: 0,
          end_date: appraisal.overall_appraisal.goals_setting_end_date,
          status: appraisal.status,
        }

        switch (appraisal.overall_appraisal.status) {
          case 'Stage 1':
            this.goalsLaunchingTableItems.push(tableData)
            break

          case 'Stage 1B':
            this.midYearTableItems.push(tableData)
            break

          case 'Stage 2':
            this.endYearTableItems.push(tableData)
            break

          default:
            break
        }
      })
      response = await this.$axios.$get('api/overallAppraisal/list')

      this.loading = false
      this.appraisalData = response
      this.changeAppraisal(this.appraisalData[0])
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      loading: true,
      tabData: null,
      tabData2: null,
      departmentData: '',
      currentAppraisalId: 0,
      addGoalsDialog: false,
      addCoreDialog: false,
      goalsApprovedDialog: false,
      MidYearManagerReviewDialog: false,
      MidYearManagerSubmitDialog: false,
      ENDYearManagerReviewDialog: false,
      ENDYearManagerSubmitDialog: false,

      appraisalData: [],
      appraisalSelected: {},
      appraisalSelectedIndex: 0,

      employeesTableHeader: [
        {
          text: 'Name',
          align: 'center',
          sortable: true,
          value: 'name',
        },
        {
          text: 'Department',
          align: 'center',
          sortable: true,
          value: 'department',
        },
        {
          text: 'Date of hire',
          align: 'center',
          sortable: true,
          value: 'date_of_hire',
        },
        {
          text: 'Appraisal Stage',
          align: 'center',
          sortable: true,
          value: 'stage',
        },
      ],
      employeesTableItems: [],
      goalsLaunchingTableHeader: [
        {
          text: 'Appraisal Name',
          align: 'center',
          sortable: true,
          value: 'appraisal_name',
        },
        {
          text: 'Employee',
          align: 'center',
          sortable: true,
          value: 'employee',
        },
        {
          text: 'Goals Count',
          align: 'center',
          sortable: true,
          value: 'goals_count',
        },
        {
          text: 'Core Values Competencies Count',
          align: 'center',
          sortable: true,
          value: 'core_values_count',
        },
        {
          text: 'Skills Count',
          align: 'center',
          sortable: true,
          value: 'skills_count',
        },
        {
          text: 'End Date',
          align: 'center',
          sortable: true,
          value: 'end_date',
        },
        {
          text: 'Status',
          align: 'center',
          sortable: true,
          value: 'status',
        },
        {
          text: 'Actions',
          align: 'center',
          sortable: false,
          value: 'action',
        },
      ],
      goalsLaunchingTableItems: [],
      midYearTableItems: [],
      endYearTableItems: [],

      departmentGoalsHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Due date', value: 'due' },
        { text: 'Category', value: 'goal_category' },
      ],
      departmentGoalsItems: [],
      departmentValuesHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Category', value: 'competency_category' },
      ],
      departmentValuesItems: []
    }
  },
  methods: {
    showGaolApproval(item) {
      this.currentAppraisalId = item.id
      this.goalsApprovedDialog = true
    },
    showMidReview(item) {
      this.currentAppraisalId = item.id
      this.MidYearManagerReviewDialog = true
    },
    showMidSubmit(item) {
      this.currentAppraisalId = item.id
      this.MidYearManagerSubmitDialog = true //
    },
    showEndReview(item) {
      this.currentAppraisalId = item.id
      this.ENDYearManagerReviewDialog = true
    },
    showEndSubmit(item) {
      this.currentAppraisalId = item.id
      this.ENDYearManagerSubmitDialog = true //
    },
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.appraisalSelectedIndex = this.appraisalSelected.id
      this.departmentGoalsItems = this.appraisalSelected.departmentalgoals_set
      this.departmentValuesItems = this.appraisalSelected.departmentalcompetencies_set
    },
  },
}
</script>

<style></style>
