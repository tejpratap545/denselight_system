<template>
  <div>
    <div class="px-10 my-5">
      <v-tabs
        background-color="transparent"
        color="#2952A4"
        centered
        grow
        v-model="tabData"
      >
        <v-tab>Department Details</v-tab>
        <v-tab>Department Goals and Core Values</v-tab>
        <v-tab>Subordinate Appraisals</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tabData">
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>Departmental Details will be shown here</p>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>Departmental Goals and Core Values will be shown here</p>
            </v-card-text>
          </v-card>
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
                          :items-per-page="5"
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
                          :headers="midYearTableHeader"
                          :items="midYearTableItems"
                          :items-per-page="5"
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
                      <v-card-text>
                        <v-data-table
                          :headers="endYearTableHeader"
                          :items="endYearTableItems"
                          :items-per-page="5"
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
  data() {
    return {
      tabData: null,
      tabData2: null,
      departmentData: '',
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
      midYearTableHeader: [
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
          value: 'action',
        },
      ],
      midYearTableItems: [],
      endYearTableHeader: [
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
          value: 'action',
        },
      ],
      endYearTableItems: [],
    }
  },
  async fetch() {
    try {
      let response = await this.$axios.$get('api/appraisals/list/manager')

      var x = 0
      for (x = 0; x < response.length; ++x) {
        let goalCountResponse = await this.$axios.$get(
          'api/appraisals/detail/' + response[x].id
        )
        if (response[x].overall_appraisal.status == 'Stage 1') {
          this.goalsLaunchingTableItems.push({
            appraisal_name: response[x].appraisal_name,
            employee: response[x].employee.name,
            goals_count: goalCountResponse.goals_set.length,
            core_values_count: goalCountResponse.competencies_set.length,
            skills_count: 0,
            end_date: response[x].overall_appraisal.goals_setting_end_date,
            status: 'NIL',
          })
        }
        if (response[x].overall_appraisal.status == 'Stage 1B') {
          this.midYearTableItems.push({
            appraisal_name: response[x].appraisal_name,
            employee: response[x].employee.name,
            goals_count: goalCountResponse.goals_set.length,
            core_values_count: goalCountResponse.competencies_set.length,
            skills_count: 0,
            end_date: response[x].overall_appraisal.goals_setting_end_date,
            status: 'NIL',
          })
        }
        if (response[x].overall_appraisal.status == 'Stage 2') {
          this.endYearTableItems.push({
            appraisal_name: response[x].appraisal_name,
            employee: response[x].employee.name,
            goals_count: goalCountResponse.goals_set.length,
            core_values_count: goalCountResponse.competencies_set.length,
            skills_count: 0,
            end_date: response[x].overall_appraisal.goals_setting_end_date,
            status: 'NIL',
          })
        }
        if (response[x].overall_appraisal.status == 'Stage 3') {
        }
        if (response[x].overall_appraisal.status == 'Stage 4') {
        }
      }
    } catch (error) {
      console.log(error)
    }
  },
}
</script>

<style></style>
