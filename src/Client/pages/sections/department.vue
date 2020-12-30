<template>
  <div class="pa-5">
    <div class="d-flex justify-lg-space-between align-center">
      <v-btn color="success"> Create Department goal </v-btn>

      <h3 class="font-weight-medium">Department</h3>
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
            >
            </v-data-table>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p class="text-center">
                Departmental Goals and Core Values will be shown here
              </p>
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
                          :items-per-page="10"
                          :loading="loading"
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
                          :loading="loading"
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
                          :headers="goalsLaunchingTableHeader"
                          :items="endYearTableItems"
                          :items-per-page="10"
                          :loading="loading"
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
  fetch() {
    this.$axios
      .$get('api/appraisals/list/manager')
      .then((response) => {
        this.loading = false
        response.forEach(async (appraisal) => {
          if (!this.employees.includes(appraisal.employee.name)) {
            this.employeesTableItems.push({
              department: appraisal.employee.department.name,
              stage: appraisal.overall_appraisal.status,
              name: appraisal.employee.name,
              date_of_hire: appraisal.employee.date_Of_Hire,
            })

            this.employees.push(appraisal.employee.name)
          }

          const tableData = {
            appraisal_name: appraisal.appraisal_name,
            employee: appraisal.employee.name,

            goals_count: appraisal.goals_count,
            core_values_count: appraisal.core_values_competencies_count,

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
      })
      .catch((error) => {
        this.loading = false
        console.log(error)
      })
  },
  data() {
    return {
      loading: true,
      tabData: null,
      tabData2: null,
      departmentData: '',
      employees: [],
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
    }
  },
}
</script>

<style></style>
