<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" elevation="0" dark v-bind="attrs" v-on="on">
        Create Appraisal
      </v-btn>
    </template>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Create Appraisal </v-card-title>

      <v-card-text>
        <v-stepper v-model="e1">
          <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1">
              Basic Details
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step :complete="e1 > 2" step="2">
              Select Employees / Department
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step :complete="e1 > 3" step="3"
              >Select Dates</v-stepper-step
            >
            <v-divider></v-divider>

            <v-stepper-step step="4">Select Weightage</v-stepper-step>
          </v-stepper-header>

          <v-stepper-items>
            <v-stepper-content step="1">
              <div class="mb-12" style="height: 400px">
                <v-text-field
                  v-model="appraisal.name"
                  label="Enter appraisal name"
                  required
                ></v-text-field>
                <v-select
                  v-model="appraisal.appraisal_category"
                  :items="categories"
                  item-text="name"
                  item-value="id"
                  label="Enter appraisal category"
                ></v-select>
                <v-radio-group v-model="appraisal_for">
                  <v-radio label="For Company" :value="0"></v-radio>
                  <v-radio label="For Departments" :value="1"></v-radio>
                  <v-radio label="For Employees" :value="2"></v-radio>
                </v-radio-group>
              </div>

              <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>
              <v-btn text @click="close"> Close </v-btn>
            </v-stepper-content>

            <v-stepper-content step="2">
              <div class="mb-12" style="height: 400px">
                <div v-if="appraisal_for == 0">
                  <p class="text-center">Entire company is selected</p>
                </div>
                <div v-else>
                  <v-combobox
                    v-model="selected_data"
                    :items="appraisal_for == 1 ? departments : employees"
                    item-text="name"
                    item-value="id"
                    :label="
                      appraisal_for == 1
                        ? 'Select Department(s)'
                        : 'Select Employee(s)'
                    "
                    multiple
                    chips
                  >
                    <template v-slot:selection="data">
                      <v-chip
                        :key="data.item.id"
                        v-bind="data.attrs"
                        :input-value="data.selected"
                        :disabled="data.disabled"
                        @click:close="data.parent.selectItem(data.item.id)"
                      >
                        {{ data.item.name }}
                      </v-chip>
                    </template>
                  </v-combobox>
                </div>
              </div>

              <v-btn color="primary" @click="e1 = 3"> Continue </v-btn>
              <v-btn text @click="e1 = 1"> Back </v-btn>
            </v-stepper-content>

            <v-stepper-content step="3">
              <div class="mb-12" style="height: 400px; overflow-y: scroll">
                <v-menu
                  v-model="menu1"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.start_date"
                      label="Start date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.start_date"
                    @input="menu1 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu2"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.goals_setting_end_date"
                      label="Enter goals setting end date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.goals_setting_end_date"
                    @input="menu2 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu3"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.mid_year_start_date"
                      label="Mid year start date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.mid_year_start_date"
                    @input="menu3 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu4"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.mid_year_end_date"
                      label="Mid year end date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.mid_year_end_date"
                    @input="menu4 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu5"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.end_year_start_date"
                      label="End year start date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.end_year_start_date"
                    @input="menu5 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu6"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.appraisal_end_date"
                      label="Appraisal start date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.appraisal_end_date"
                    @input="menu6 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu7"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.reports_end_date"
                      label="Appraisal report end date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.reports_end_date"
                    @input="menu7 = false"
                  ></v-date-picker>
                </v-menu>
                <v-menu
                  v-model="menu8"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="appraisal.calibration_end_date"
                      label="Calibration end date"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="appraisal.calibration_end_date"
                    @input="menu8 = false"
                  ></v-date-picker>
                </v-menu>
              </div>

              <v-btn color="primary" @click="e1 = 4"> Continue </v-btn>
              <v-btn text @click="e1 = 2"> Back </v-btn>
            </v-stepper-content>

            <v-stepper-content step="4">
              <div class="mb-12" style="height: 400px">
                <v-text-field
                  v-model="appraisal.goal_weightage"
                  label="Goal Weightage"
                  placeholder="25"
                ></v-text-field>
                <v-text-field
                  v-model="appraisal.competency_weightage"
                  label="Competency Weightage"
                  placeholder="25"
                ></v-text-field>
                <v-text-field
                  v-model="appraisal.skill_weightage"
                  label="Skill Weightage"
                  placeholder="50"
                ></v-text-field>

                <small>Sum of all weightage should be 100</small>
              </div>

              <v-btn color="primary" @click="createAppraisal"> Submit </v-btn>
              <v-btn text @click="e1 = 3"> Back </v-btn>
            </v-stepper-content>
          </v-stepper-items>
        </v-stepper>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  porps: ['appraisal'],
  async fetch() {
    try {
      this.employees = await this.$axios.$get('/api/employee/short/list')

      this.departments = await this.$axios.$get('/api/department/')

      this.categories = await this.$axios.$get('/api/category/appraisal/')
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      e1: 1,
      employees: [],
      categories: [],
      departments: [],
      appraisal_for: '',
      selected_data: [],

      menu1: false,
      menu2: false,
      menu3: false,
      menu4: false,
      menu5: false,
      menu6: false,
      menu7: false,
      menu8: false,

      appraisal: {
        name: '',
        is_company: false,

        goal_weightage: 0,
        competency_weightage: 0,
        skill_weightage: 0,

        start_date: new Date().toISOString().substr(0, 10),
        goals_setting_end_date: new Date().toISOString().substr(0, 10),
        mid_year_start_date: new Date().toISOString().substr(0, 10),
        mid_year_end_date: new Date().toISOString().substr(0, 10),
        end_year_start_date: new Date().toISOString().substr(0, 10),
        appraisal_end_date: new Date().toISOString().substr(0, 10),
        reports_end_date: new Date().toISOString().substr(0, 10),
        calibration_end_date: new Date().toISOString().substr(0, 10),

        individual_employees: [],
        departments: [],

        appraisal_category: 0,
      },
    }
  },
  methods: {
    close() {
      this.dialog = false
      this.reset()
    },
    reset() {
      this.appraisal = {
        name: '',
        is_company: false,

        goal_weightage: 0,
        competency_weightage: 0,
        skill_weightage: 0,

        start_date: new Date().toISOString().substr(0, 10),
        goals_setting_end_date: new Date().toISOString().substr(0, 10),
        mid_year_start_date: new Date().toISOString().substr(0, 10),
        mid_year_end_date: new Date().toISOString().substr(0, 10),
        end_year_start_date: new Date().toISOString().substr(0, 10),
        appraisal_end_date: new Date().toISOString().substr(0, 10),
        reports_end_date: new Date().toISOString().substr(0, 10),
        calibration_end_date: new Date().toISOString().substr(0, 10),

        individual_employees: [],
        departments: [],

        appraisal_category: 0,
      }
    },
    async createAppraisal() {
      this.dialog = false

      this.selected_data = this.selected_data.filter((x) => x != null)

      switch (this.appraisal_for) {
        case 0 || '0':
          this.appraisal.is_company = true
          break
        case 1 || '1':
          this.appraisal.departments = this.selected_data.map((x) => x.id)
          break
        case 2 || '2':
          this.appraisal.individual_employees = this.selected_data.map(
            (x) => x.id
          )
          break

        default:
          break
      }

      await this.$axios
        .$post('/api/overallAppraisal/', this.appraisal)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating appraisal',
            color: 'info',
          })

          this.close()
          this.$emit('reload-appraisals')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating appraisal',
            color: 'error',
          })
          console.log(error, this.appraisal)
        })
    },
  },
}
</script>
