<template>
  <div>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else class="ma-5">
      <div>
        <AppraisalCreate @reload-appraisals="$fetch()" />
      </div>

      <div class="my-5">
        <v-tabs
          v-model="tabData"
          background-color="transparent"
          color="#2952A4"
          centered
          grow
        >
          <v-tab>Overall Appraisal</v-tab>
          <v-tab>User Appraisal</v-tab>
          <v-tab>Previous Appraisal</v-tab>
          <v-tab>Closed Appraials</v-tab>
        </v-tabs>

        <v-tabs-items v-model="tabData">
          <v-tab-item>
            <v-card flat>
              <v-card-text>
                <div class="my-5">
                  <v-tabs background-color="transparent" color="#2952A4">
                    <v-tab class="justify-start">ONGOING APPRAISALS</v-tab>
                    <v-tab class="justify-start">COMPLETED APPRAISALS</v-tab>

                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>
                          <v-data-table
                            :headers="onGoingTableHeader"
                            :items="onGoingTableItems"
                            :items-per-page="10"
                            :loading="loading"
                          >
                            <template v-slot:[`item.status`]="{ item }">
                              <div v-if="item.status == 'Stage 1'">
                                Goal Setting Stage
                              </div>
                              <div v-else-if="item.status == 'Stage 1B'">
                                Mid Year Stage
                              </div>
                              <div v-else-if="item.status == 'Stage 2'">
                                End Year Stage
                              </div>
                              <div v-else-if="item.status == 'Stage 3'">
                                Report Stage
                              </div>
                              <div v-else-if="item.status == 'Stage 4'">
                                Celebration Stage
                              </div>
                              <div v-else>Unknown Stage</div>
                            </template>
                            <template v-slot:[`item.actions`]="{ item }">
                              <div>
                                <AppraisalEdit
                                  :appraisal="item.overallAppraisal"
                                  @reload-mainvue="$fetch()"
                                />

                                <v-dialog
                                  v-model="item.dialog_delete"
                                  persistent
                                  max-width="400"
                                >
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      color="error"
                                      dark
                                      v-bind="attrs"
                                      icon
                                      v-on="on"
                                    >
                                      <v-icon>mdi-close</v-icon>
                                    </v-btn>
                                  </template>
                                  <v-card>
                                    <v-card-title class="headline">
                                      Permanently delete appraisal ?
                                    </v-card-title>
                                    <v-card-actions>
                                      <v-spacer></v-spacer>
                                      <v-btn
                                        text
                                        @click="item.dialog_delete = false"
                                      >
                                        Cancel
                                      </v-btn>
                                      <v-btn
                                        color="green darken-1"
                                        text
                                        @click="
                                          item.dialog_delete = false
                                          deleteAppraisal(item.id)
                                        "
                                      >
                                        OK
                                      </v-btn>
                                    </v-card-actions>
                                  </v-card>
                                </v-dialog>
                              </div>
                            </template>
                          </v-data-table>
                        </v-card-text>
                      </v-card>
                    </v-tab-item>

                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>
                          <v-data-table
                            :headers="completedTableHeader"
                            :items="completedTableItems"
                            :items-per-page="10"
                          >
                            <template v-slot:[`item.actions`]="{ item }">
                              <div>
                                <v-dialog
                                  v-model="item.dialog_delete"
                                  persistent
                                  max-width="400"
                                >
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      color="error"
                                      dark
                                      v-bind="attrs"
                                      icon
                                      v-on="on"
                                    >
                                      <v-icon>mdi-close</v-icon>
                                    </v-btn>
                                  </template>
                                  <v-card>
                                    <v-card-title class="headline">
                                      Permanently delete appraisal ?
                                    </v-card-title>
                                    <v-card-actions>
                                      <v-spacer></v-spacer>
                                      <v-btn
                                        text
                                        @click="item.dialog_delete = false"
                                      >
                                        Cancel
                                      </v-btn>
                                      <v-btn
                                        color="green darken-1"
                                        text
                                        @click="
                                          item.dialog_delete = false
                                          deleteAppraisal(item.id)
                                        "
                                      >
                                        OK
                                      </v-btn>
                                    </v-card-actions>
                                  </v-card>
                                </v-dialog>
                              </div>
                            </template>
                          </v-data-table>
                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                  </v-tabs>
                </div>
              </v-card-text>
            </v-card>
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-title>
                <v-spacer></v-spacer>
                <v-btn
                  color="green darken-1"
                  elevation="0"
                  dark
                  @click="report()"
                  style="float: right"
                  text
                  :loading="reportLoading"
                >
                  <v-icon>mdi-download-circle-outline</v-icon>
                  <span class="ml-1">Download Report</span>
                </v-btn>
              </v-card-title>

              <v-card-text>
                <div class="my-5">
                  <v-data-table
                    :headers="userTableHeader"
                    :items="userTableData"
                    :loading="loading"
                    group-by="stage"
                    hide-default-footer
                  >
                    <template v-slot:[`item.action`]="{ item }">
                      <v-dialog
                        v-model="item.appraisal_dialog"
                        scrollable
                        max-width="1200"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-btn
                            color="grey lighten-1"
                            icon
                            v-bind="attrs"
                            v-on="on"
                          >
                            <v-icon>mdi-eye-circle</v-icon>
                          </v-btn>
                        </template>
                        <v-card>
                          <v-toolbar color="primary" dark>
                            <b>{{ item.appraisal_name }}</b>
                            <v-spacer></v-spacer>
                            <v-btn icon @click="item.appraisal_dialog = false">
                              <v-icon>mdi-close</v-icon>
                            </v-btn>
                          </v-toolbar>
                          <Appraisal
                            v-if="item.appraisal_dialog"
                            :appraisal-id="item.id"
                          />
                        </v-card>
                      </v-dialog>
                    </template>
                  </v-data-table>
                </div>

                <div class="text-center">
                  <v-pagination
                    v-model="page_user"
                    :length="count_user"
                  ></v-pagination>
                </div>
              </v-card-text>
            </v-card>
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-text>
                <v-data-table
                  :headers="previousAppraisalsHeader"
                  :items="previousAppraisals"
                  :loading="loading"
                >
                  <template v-slot:[`item.action`]="{ item }">
                    <v-dialog
                      v-model="item.appraisal_dialog"
                      scrollable
                      max-width="1200"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="grey lighten-1"
                          icon
                          v-bind="attrs"
                          v-on="on"
                        >
                          <v-icon>mdi-eye-circle</v-icon>
                        </v-btn>
                      </template>
                      <v-card>
                        <v-toolbar color="primary" dark>
                          <b>{{ item.appraisal_name }}</b>
                          <v-spacer></v-spacer>
                          <v-btn icon @click="item.appraisal_dialog = false">
                            <v-icon>mdi-close</v-icon>
                          </v-btn>
                        </v-toolbar>
                        <Appraisal
                          v-if="item.appraisal_dialog"
                          :appraisal-id="item.id"
                        />
                      </v-card>
                    </v-dialog>
                  </template>
                </v-data-table>

                <div class="text-center">
                  <v-pagination
                    v-model="page_previous"
                    :length="count_previous"
                  ></v-pagination>
                </div>
              </v-card-text>
            </v-card>
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-text>
                <v-data-table
                  :headers="previousAppraisalsHeader"
                  :items="closedAppraisals"
                  :items-per-page="10"
                  :loading="loading"
                >
                  <template v-slot:[`item.action`]="{ item }">
                    <v-dialog
                      v-model="item.appraisal_dialog"
                      scrollable
                      max-width="1200"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="grey lighten-1"
                          icon
                          v-bind="attrs"
                          v-on="on"
                        >
                          <v-icon>mdi-eye-circle</v-icon>
                        </v-btn>
                      </template>
                      <v-card>
                        <v-toolbar color="primary" dark>
                          <b>{{ item.appraisal_name }}</b>
                          <v-spacer></v-spacer>
                          <v-btn icon @click="item.appraisal_dialog = false">
                            <v-icon>mdi-close</v-icon>
                          </v-btn>
                        </v-toolbar>
                        <Appraisal
                          v-if="item.appraisal_dialog"
                          :appraisal-id="item.id"
                        />
                      </v-card>
                    </v-dialog>
                  </template>
                </v-data-table>
              </v-card-text>
            </v-card>
          </v-tab-item>
        </v-tabs-items>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  title: 'Appraisal Status',
  name: 'AppraisalStatus',
  layout: 'dashboard-template',

  async fetch() {
    await this.init()
  },
  data() {
    return {
      loading: true,
      tabData: null,
      tabData2: null,
      departmentData: '',
      onGoingTableHeader: [
        {
          text: 'Appraisal Name',
          sortable: true,
          value: 'appraisal_name',
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
          value: 'actions',
        },
      ],
      onGoingTableItems: [],
      completedTableHeader: [
        {
          text: 'Appraisal Name',
          sortable: true,
          value: 'appraisal_name',
        },
        {
          text: 'Start Date',
          align: 'center',
          sortable: true,
          value: 'start_date',
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
          value: 'actions',
        },
      ],
      completedTableItems: [],
      userTableHeader: [
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
          text: 'Stage',
          align: 'center',
          sortable: true,
          value: 'stage',
        },
        {
          text: 'Actions',
          align: 'center',
          sortable: false,
          value: 'action',
        },
      ],
      page_user: 1,
      userTableData: [],
      previousAppraisalsHeader: [
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
          text: 'End Date',
          align: 'center',
          sortable: true,
          value: 'end_date',
        },
        {
          text: 'Manager',
          align: 'center',
          sortable: true,
          value: 'manager',
        },
        {
          text: 'Actions',
          align: 'center',
          sortable: false,
          value: 'action',
        },
      ],
      page_previous: 1,
      previousAppraisals: [],
      closedAppraisals: [],
      reportLoading: false,
      count_user: 1,
      count_previous: 1,
    }
  },
  methods: {
    async init() {
      try {
        this.loading = true

        await this.fetchpreviousAppraisals()
        await this.fetchclosedAppraisals()
        await this.fetchoverallAppraisals()
        await this.fetchuserAppraisals()

        this.loading = false
      } catch (error) {
        this.loading = false
        console.log(error)
      }
    },
    async fetchpreviousAppraisals() {
      // TODO : TEJPRATAP replace this line with new api
      // like this `api/appraisals/list/admin?page=${this.page_previous}`
      const response = await this.$axios.$get(
        'api/resign/employee/list/appraisals'
      )

      // TODO : TEJPRATAP UNCOMMENT THIS
      //  this.count_previous = parseInt(response.count / 10) + 1

      // TODO : TEJPRATAP replace response with response.results THIS
      response.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,
          employee: appraisal.employee.name,
          manager: appraisal.manager.name,
          mid_year_completion: appraisal.mid_year_completion,
          completion: appraisal.completion,
          end_date: appraisal.overall_appraisal.calibration_end_date,
          status: appraisal.status,
          appraisal_dialog: false,
        }

        this.previousAppraisals.push(tableData)
      })
    },
    async fetchclosedAppraisals() {
      const response = await this.$axios.$get(
        'api/resign/employee/list/appraisals'
      )

      response.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,
          employee: appraisal.employee.name,
          manager: appraisal.manager.name,
          mid_year_completion: appraisal.mid_year_completion,
          completion: appraisal.completion,
          end_date: appraisal.overall_appraisal.calibration_end_date,
          status: appraisal.status,
          appraisal_dialog: false,
        }

        this.closedAppraisals.push(tableData)
      })
    },
    async fetchoverallAppraisals() {
      this.completedTableItems = []
      this.onGoingTableItems = []
      const response = await this.$axios.$get('api/overallAppraisal/')

      response.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.name,

          end_date: appraisal.goals_setting_end_date,
          status: appraisal.status,
          dialog_delete: false,

          overallAppraisal: appraisal || {},
        }

        switch (appraisal.status) {
          case 'Completed':
            this.completedTableItems.push(tableData)
            break

          default:
            this.onGoingTableItems.push(tableData)
            break
        }
      })
    },
    async fetchuserAppraisals() {
      this.userTableData = []

      const response = await this.$axios.$get(
        `api/appraisals/list/admin?page=${this.page_user}`
      )

      this.count_user = parseInt(response.count / 10) + 1

      response.results.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,
          employee: appraisal.employee.name,
          manager: appraisal.manager.name,
          mid_year_completion: appraisal.mid_year_completion,
          goals_count: appraisal.goals_count,
          core_values_count: appraisal.core_values_competencies_count,
          completion: appraisal.completion,
          stage: appraisal.overall_appraisal.status,
          skills_count: appraisal.skills_count,
          end_date: appraisal.overall_appraisal.calibration_end_date,
          appraisal_dialog: false,
        }

        this.userTableData.push(tableData)
      })
    },
    deleteAppraisal(id) {
      this.$axios
        .$delete(`api/overallAppraisal/${id}/`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted appraisal',
            color: 'info',
          })
          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting appraisal',
            color: 'error',
          })
          console.log(error)
        })
    },
    async report() {
      this.reportLoading = true
      await this.$axios
        .get('api/download/report', {
          responseType: 'blob',
        })
        .then((res) => {
          const url = window.URL.createObjectURL(new Blob([res.data]))
          const link = document.createElement('a')
          link.href = url
          link.setAttribute('download', 'report.xlsx')
          document.body.appendChild(link)
          link.click()

          console.log(res)
          this.$notifier.showMessage({
            content: 'Report Downloaded',
            color: 'info',
          })
        })
      this.reportLoading = false
    },
  },
  watch: {
    async page_user(_newval, _oldval) {
      this.loading = true
      await this.fetchuserAppraisals()
      this.loading = false
    },
    async page_previous(_newval, _oldval) {
      this.loading = true
      await this.fetchpreviousAppraisals()
      this.loading = false
    },
  },
}
</script>

<style></style>
