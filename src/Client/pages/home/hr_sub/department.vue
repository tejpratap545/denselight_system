<template>
  <div>
      <div class="px-10 my-5">
        <v-tabs background-color="transparent" color="#2952A4" centered grow v-model="tabData">
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
                  
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>
                          <v-data-table
                            :headers="goalsLaunchingTableHeader"
                            :items="goalsLaunchingTableItems"
                            :items-per-page="5"
                          >

                          </v-data-table>
                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>

                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>

                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>

                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>

                        </v-card-text>
                      </v-card>
                    </v-tab-item>
                    <v-tab-item>
                      <v-card flat>
                        <v-card-text>

                        </v-card-text>
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
    name: 'Department',
    layout: 'hrDashboard',
    data(){
        return{
            tabData: null,
            tabData2: null,
            goalsLaunchingTableHeader: [
              {
                text: 'Appraisal Name',
                align: 'center',
                sortable: true,
                value: 'appraisal_name'
              },
              {
                text: 'Employee',
                align: 'center',
                sortable: true,
                value: 'employee'
              },
              {
                text: 'Goals Count',
                align: 'center',
                sortable: true,
                value: 'goals_count'
              },
              {
                text: 'Core Values Competencies Count',
                align: 'center',
                sortable: true,
                value: 'core_values_count'
              },
              {
                text: 'Skills Count',
                align: 'center',
                sortable: true,
                value: 'skills_count'
              },
              {
                text: 'End Date',
                align: 'center',
                sortable: true,
                value: 'end_date'
              },
              {
                text: 'Status',
                align: 'center',
                sortable: true,
                value: 'status'
              },
              {
                text: 'Actions',
                align: 'center',
                sortable: false,
                value: 'actions'
              },
            ],
            goalsLaunchingTableItems: [
              {
                appraisal_name: '2020 Performance Appraisal',
                employee: 'ROBIAH BTE MOHAMED TAHIR',
                goals_count: '0',
                core_values_count: '0',
                skills_count: '0',
                end_date: '30 Sep 2020',
                status: "Pending Employee's Input",  
              }
            ]
        }
    }
}
</script>

<style>

</style>