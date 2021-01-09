<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="my-5"
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
        @reload="subordinateAppraisal"
      />
      <MidYearManagerReview
        v-if="MidYearManagerReviewDialog"
        :dialog="MidYearManagerReviewDialog"
        :appraisal-id="currentAppraisalId"
        @close-mid-year-manager-dialog="MidYearManagerReviewDialog = false"
        @reload="subordinateAppraisal"
      />
      <MidYearManagerApprove
        v-if="MidYearManagerSubmitDialog"
        :dialog="MidYearManagerSubmitDialog"
        :appraisal-id="currentAppraisalId"
        @close-mid-year-manager-submit-dialog="
          MidYearManagerSubmitDialog = false
        "
        @reload="subordinateAppraisal"
      />
      <EndYearManagerReview
        v-if="ENDYearManagerReviewDialog"
        :dialog="ENDYearManagerReviewDialog"
        :appraisal-id="currentAppraisalId"
        @close-end-year-manager-dialog="ENDYearManagerReviewDialog = false"
        @reload="subordinateAppraisal"
      />
      <EndYearManagerApprove
        v-if="ENDYearManagerSubmitDialog"
        :dialog="ENDYearManagerSubmitDialog"
        :appraisal-id="currentAppraisalId"
        @close-end-year-manager-submit-dialog="
          ENDYearManagerSubmitDialog = false
        "
        @reload="subordinateAppraisal"
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
    <div class="my-5">
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
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>First Reporting Employees</b>
            </v-toolbar>

            <v-data-table
              :headers="employeesTableHeader"
              :items="myemployeesTableItems"
              :items-per-page="5"
              :loading="loading"
              show-expand
            >
              <template v-slot:expanded-item="{ headers, item }">
                <td :colspan="headers.length">
                  <v-list dense>
                    <v-list-item
                      v-for="appraisal in item.user_appraisals"
                      :key="appraisal.id"
                    >
                      <v-list-item-content>
                        <v-list-item-title
                          v-html="appraisal.dat.appraisal_name"
                        ></v-list-item-title>
                        <v-list-item-subtitle
                          v-html="
                            getStatus(
                              appraisal.dat.overall_appraisal.status,
                              appraisal.dat.status,
                              'Uncompleted',
                              ''
                            )
                          "
                        ></v-list-item-subtitle>
                      </v-list-item-content>
                      <v-list-item-action>
                        <v-dialog
                          v-model="appraisal.appraisal_dialog"
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
                              <b>{{ appraisal.dat.appraisal_name }}</b>
                              <v-spacer></v-spacer>
                              <v-btn
                                icon
                                @click="appraisal.appraisal_dialog = false"
                              >
                                <v-icon>mdi-close</v-icon>
                              </v-btn>
                            </v-toolbar>
                            <Appraisal
                              v-if="appraisal.appraisal_dialog"
                              :appraisal-id="appraisal.dat.id"
                            />
                          </v-card>
                        </v-dialog>
                      </v-list-item-action>
                    </v-list-item>
                  </v-list>
                </td>
              </template>
            </v-data-table>

            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>Second Reporting Employees</b>
            </v-toolbar>

            <v-data-table
              :headers="employeesTableHeader"
              :items="employeesTableItems"
              :items-per-page="5"
              :loading="loading"
              show-expand
            >
              <template v-slot:expanded-item="{ headers, item }">
                <td :colspan="headers.length">
                  <v-list dense>
                    <v-list-item
                      v-for="appraisal in item.user_appraisals"
                      :key="appraisal.id"
                    >
                      <v-list-item-content>
                        <v-list-item-title
                          v-html="appraisal.dat.appraisal_name"
                        ></v-list-item-title>
                        <v-list-item-subtitle
                          v-html="
                            getStatus(
                              appraisal.dat.overall_appraisal.status,
                              appraisal.dat.status,
                              'Uncompleted',
                              ''
                            )
                          "
                        ></v-list-item-subtitle>
                      </v-list-item-content>
                      <v-list-item-action>
                        <v-dialog
                          v-model="appraisal.appraisal_dialog"
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
                              <b>{{ appraisal.dat.appraisal_name }}</b>
                              <v-spacer></v-spacer>
                              <v-btn
                                icon
                                @click="appraisal.appraisal_dialog = false"
                              >
                                <v-icon>mdi-close</v-icon>
                              </v-btn>
                            </v-toolbar>
                            <Appraisal
                              v-if="appraisal.appraisal_dialog"
                              :appraisal-id="appraisal.dat.id"
                            />
                          </v-card>
                        </v-dialog>
                      </v-list-item-action>
                    </v-list-item>
                  </v-list>
                </td>
              </template>
            </v-data-table>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-card flat>
                <v-card-title>
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
                            @click="changeAppraisal(x)"
                          >
                            <v-list-item-title>
                              {{ x.name }}
                            </v-list-item-title>
                          </v-list-item>
                        </v-list>
                      </v-menu>
                    </v-col>

                    <v-col
                      cols="9"
                      style="display: flex; justify-content: flex-end"
                    >
                      <div v-if="appraisalSelectedIndex != 0">
                        <h3 class="font-weight-medium">
                          {{ appraisalSelected.name }} -
                          {{ appraisalSelected.appraisal_category.name }}
                        </h3>
                        <small style="font-size: 12.8px" class="ma-0">
                          {{ appraisalSelected.status }}
                        </small>
                      </div>
                      <div v-else>
                        <h3 class="font-weight-medium">
                          No Appraisal selected
                        </h3>
                      </div>
                    </v-col>
                  </v-row>
                </v-card-title>
              </v-card>
            </v-card-text>
          </v-card>

          <div>
            <v-card class="pt-5" flat>
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
                  icon
                  @click="addGoalsDialog = true"
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

            <v-card class="pt-5" flat>
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
                  icon
                  @click="addCoreDialog = true"
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
                          :loading="loading"
                        >
                          <template v-slot:[`item.status`]="{ item }">
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
                          <template v-slot:[`item.action`]="{ item }">
                            <v-btn
                              v-if="item.status !== 'Employee'"
                              color="transparent"
                              elevation="0"
                              @click="showGaolApproval(item)"
                            >
                              <v-icon color="info"
                                >mdi-format-list-checks
                              </v-icon>
                            </v-btn>
                            <v-dialog
                              v-model="item.appraisal_dialog"
                              scrollable
                              max-width="800"
                            >
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="primary"
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
                                  <v-btn
                                    icon
                                    @click="item.appraisal_dialog = false"
                                  >
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
                          <template v-slot:[`item.status`]="{ item }">
                            <v-icon
                              v-if="
                                item.status === 'S1BEmployee' ||
                                item.status === 'S1BManager'
                              "
                              indeterminate
                              color="primary"
                            >
                              mdi-account-clock</v-icon
                            >

                            <v-icon
                              v-else-if="
                                item.status === 'S1BReview' ||
                                (item.status === 'S1BManager' &&
                                  item.mid_year_completion === 'Completed')
                              "
                              indeterminate
                              color="info"
                            >
                              mdi-account-clock</v-icon
                            >
                            <v-icon
                              v-else-if="
                                item.mid_year_completion === 'Completed'
                              "
                              indeterminate
                              color="success"
                            >
                              mdi-checkbox-marked-circle-outline</v-icon
                            >
                            <v-icon v-else indeterminate color="error">
                              mdi-cancel
                            </v-icon>
                          </template>
                          <template v-slot:[`item.action`]="{ item }">
                            <!--                            <v-icon-->
                            <!--                              v-if="-->
                            <!--                                item.mid_year_completion == 'Completed' &&-->
                            <!--                                item.status == 'S1BManager'-->
                            <!--                              "-->
                            <!--                              color="success"-->
                            <!--                            >-->
                            <!--                              mdi-checkbox-marked-circle-outline</v-icon-->
                            <!--                            >-->
                            <div v-if="item.mid_year_completion != 'Completed'">
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
                                  >mdi-format-list-checks
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
                            <v-dialog
                              v-model="item.appraisal_dialog"
                              scrollable
                              max-width="800"
                            >
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="primary"
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
                                  <v-btn
                                    icon
                                    @click="item.appraisal_dialog = false"
                                  >
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
                          <template v-slot:[`item.status`]="{ item }">
                            <v-icon
                              v-if="
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
                            <v-icon
                              v-else-if="item.status == 'Approved'"
                              indeterminate
                              color="success"
                            >
                              mdi-checkbox-marked-circle-outline</v-icon
                            >
                            <v-icon v-else indeterminate color="error">
                              mdi-cancel
                            </v-icon>
                          </template>
                          <template v-slot:[`item.action`]="{ item }">
                            <div v-if="item.status != 'Approved'">
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
                                  >mdi-format-list-checks
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
                            <v-dialog
                              v-model="item.appraisal_dialog"
                              scrollable
                              max-width="800"
                            >
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="primary"
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
                                  <v-btn
                                    icon
                                    @click="item.appraisal_dialog = false"
                                  >
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

                  <v-tab-item>
                    <v-card flat>
                      <v-card-text>
                        <v-data-table
                          :headers="goalsLaunchingTableHeader"
                          :items="reportsTableItems"
                          :items-per-page="10"
                          :loading="loading"
                        >
                          <template v-slot:[`item.action`]="{ item }">
                            <v-dialog
                              v-model="item.appraisal_dialog"
                              scrollable
                              max-width="800"
                            >
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="primary"
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
                                  <v-btn
                                    icon
                                    @click="item.appraisal_dialog = false"
                                  >
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

                  <v-tab-item>
                    <v-card flat>
                      <v-card-text>
                        <v-data-table
                          :headers="goalsLaunchingTableHeader"
                          :items="calibrationTableItems"
                          :items-per-page="10"
                          :loading="loading"
                        >
                          <template v-slot:[`item.action`]="{ item }">
                            <v-dialog
                              v-model="item.appraisal_dialog"
                              scrollable
                              max-width="800"
                            >
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="primary"
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
                                  <v-btn
                                    icon
                                    @click="item.appraisal_dialog = false"
                                  >
                                    <v-icon>mdi-close</v-icon>
                                  </v-btn>
                                </v-toolbar>
                                <Appraisal :appraisal-id="item.id" />
                              </v-card>
                            </v-dialog>
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
import Appraisal from '~/components/Appraisal.vue'
import global from '~/mixins/global'

export default {
  name: 'Department',
  components: { Appraisal },
  title: 'Department',
  layout: 'dashboard-template',
  mixins: [global],
  async fetch() {
    try {
      await this.subordinateAppraisal()
      let response = await this.$axios.$get('api/appraisals/list/short/hod')
      response.forEach((employee) => {
        const data = {
          name: employee.name,
          department: employee.department.name,
          email: employee.email,
          user_appraisals: [],
        }

        employee.user_appraisal_list_set.forEach((e) => {
          data.user_appraisals.push({
            dat: e,
            appraisal_dialog: false,
          })
        })

        this.employeesTableItems.push(data)
      })

      response = await this.$axios.$get('api/appraisals/list/short/manager')
      response.forEach((employee) => {
        const data = {
          name: employee.name,
          department: employee.department.name,
          email: employee.email,
          user_appraisals: [],
        }

        employee.user_appraisal_list_set.forEach((e) => {
          data.user_appraisals.push({
            dat: e,
            appraisal_dialog: false,
          })
        })

        this.myemployeesTableItems.push(data)
      })
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      loading: true,
      tabData: null,
      tabData2: null,
      viewAppraisal: false,
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
          value: 'name',
        },
        {
          text: 'Department',
          value: 'department',
        },
        {
          text: 'Email',
          value: 'email',
        },
        { text: '', value: 'data-table-expand' },
      ],
      employeesTableItems: [],
      myemployeesTableItems: [],
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

          value: 'end_date',
        },
        {
          text: 'Status',
          align: 'center',

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
      reportsTableItems: [],
      calibrationTableItems: [],

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
      departmentValuesItems: [],
    }
  },
  methods: {
    async subordinateAppraisal() {
      let response = await this.$axios.$get('api/appraisals/list/manager')

      response.forEach((appraisal) => {
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
      response = await this.$axios.$get('api/overallAppraisal/list')

      this.loading = false
      this.appraisalData = response
      this.changeAppraisal(this.appraisalData[0])
    },
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
