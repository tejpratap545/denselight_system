<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else>
    <v-card>
      <div>
        <AppraisalAdmin
          v-if="showAppraisalDialog"
          :appraisal-id="currentAppraisalId"
          is-editable="true"
          :dialog="showAppraisalDialog"
          @close="showAppraisalDialog = false"
        />
      </div>
      <v-card-title> Employees Appraisals </v-card-title>

      <v-card-text>
        <div class="my-5">
          <v-tabs background-color="transparent" color="#2952A4">
            <v-tab class="justify-start">GOALS LAUNCHING</v-tab>
            <v-tab class="justify-start">MID-YEAR REVIEW</v-tab>
            <v-tab class="justify-start">YEAR-END REVIEW</v-tab>
            <v-tab class="justify-start">REPORTS</v-tab>
            <v-tab class="justify-start">CALIBRATION</v-tab>

            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Goal Setting Stage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="goalsLaunchingTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Employee'"
                        indeterminate
                        color="primary"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon
                        v-if="item.status == 'Manager'"
                        indeterminate
                        color="info"
                      >
                        mdi-account-clock</v-icon
                      >
                      <v-icon
                        v-if="item.status == 'S1BEmployee'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Mid year Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="midYearTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  End Year Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="endYearTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon
                        v-else-if="
                          (item.status === 'S2Manager' ||
                            item.status === 'S2Employee') &&
                          item.completion === 'Ecompleted'
                        "
                        indeterminate
                        color="primary"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon
                        v-else-if="
                          item.status === 'S2Manager' &&
                          item.completion === 'MCompleted'
                        "
                        indeterminate
                        color="info"
                      >
                        mdi-account-clock</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Goal Setting Stage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="reportsTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Goal Setting Stage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="calibrationTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs>
        </div>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  layout: 'dashboard-template',
  name: 'Admin',
  async fetch() {
    this.goalsLaunchingTableItems = []
    this.midYearTableItems = []
    this.endYearTableItems = []
    this.reportsTableItems = []
    this.calibrationTableItems = []
    await this.$axios.$get('/api/appraisals/list/admin').then((res) => {
      res.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,

          employee: appraisal.employee.name,
          employeeDepartment: appraisal.employee.department.name,
          manager: appraisal.manager ? appraisal.manager.name : '---',
          goals_count: appraisal.goals_count,
          core_values_count: appraisal.core_values_competencies_count,
          skills_count: 0,
          end_date: appraisal.overall_appraisal.goals_setting_end_date,
          overallStage: appraisal.overall_appraisal.status,
          status: appraisal.status,
          mid_year_completion: appraisal.mid_year_completion,
          completion: appraisal.completion,
          appraisal_dialog: false,
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

          case 'Stage 3':
            this.reportsTableItems.push(tableData)
            break

          case 'Stage 4':
            this.calibrationTableItems.push(tableData)
            break

          default:
            break
        }
      })
    })
  },
  data() {
    return {
      showAppraisalDialog: false,
      currentAppraisalId: 0,
      goalsLaunchingTableItems: [],
      midYearTableItems: [],
      endYearTableItems: [],
      reportsTableItems: [],
      calibrationTableItems: [],
      appraisalList: '',
      search: '',
      headers: [
        {
          text: 'Appraisals',
          value: 'appraisal_name',
        },
        {
          text: 'Employee',
          value: 'employee',
        },
        {
          text: 'Department',
          value: 'employeeDepartment',
        },
        {
          text: 'Manager',
          value: 'manager',
        },

        {
          text: 'Stage 1',
          value: 'stage_1',
        },
        {
          text: 'Stage 2',
          value: 'stage_2',
        },
        {
          text: 'Stage 3',
          value: 'stage_3',
        },
        {
          text: 'Actions',
          value: 'actions',
        },
      ],
    }
  },
  methods: {
    showAppraisal(id) {
      this.showAppraisalDialog = true

      this.currentAppraisalId = id
    },
  },
}
</script>
