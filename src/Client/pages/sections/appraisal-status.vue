<template>
  <div>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div class="ma-5" v-else>
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
          <v-tab>Reports</v-tab>
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
                                      v-on="on"
                                      icon
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
                            <template v-slot:[`item.action`]="{ item }">
                              <v-btn
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                              >
                                <i class="fas fa-ellipsis-h"></i>
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
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-text>
                <div class="my-5">
                  <v-tabs background-color="transparent" color="#2952A4">
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
                          >
                            <template v-slot:[`item.action`]="{ item }">
                              <v-btn
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
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
                          >
                            <template v-slot:[`item.action`]="{ item }">
                              <v-btn
                                v-model="item.action"
                                color="transparent"
                                elevation="0"
                              >
                                <i class="fas fa-ellipsis-h"></i>
                              </v-btn>
                            </template>
                          </v-data-table>
                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <!-- END-YEAR REVIEW -->

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

          <v-tab-item> </v-tab-item>
        </v-tabs-items>
      </div>
    </div>
  </div>
</template>

<script>
import { AppraisalCreate } from '~/components/AppraisalCreate'

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
          value: 'actions',
        },
      ],
      goalsLaunchingTableItems: [],
      midYearTableItems: [],
      endYearTableItems: [],
    }
  },
  methods: {
    async init() {
      try {
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
            case 'ReviewCompleted':
              this.completedTableItems.push(tableData)
              break

            default:
              this.onGoingTableItems.push(tableData)
              break
          }
        })
        this.loading = false
      } catch (error) {
        this.loading = false
        console.log(error)
      }
    },
    deleteAppraisal(id) {
      this.$axios
        .$delete(`api/overallAppraisal/${id}/`)
        .then((res) => {
          this.$fetch()
        })
        .catch((error) => console.log(error))
    },
  },
}
</script>

<style></style>
