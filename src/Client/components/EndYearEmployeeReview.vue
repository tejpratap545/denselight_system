<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="800">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card v-else>
          <v-card-title class="headline"> End Year Review 

             <v-spacer />
            <v-btn @click="close" icon>
              <v-icon>mdi-close</v-icon>
            </v-btn> 
          </v-card-title>
          <v-card-text>
            <h3 class="font-weight-medium my-2">Goals</h3>

            <v-expansion-panels>
              <v-expansion-panel
                v-for="item in goals"
                :key="item.id"
                class="my-2"
              >
                <v-expansion-panel-header
                  class="pa-2"
                  color="primary lighten-1"
                >
                  <h3 class="title-topbar">
                    <b>{{ item.summary }}</b> <v-spacer />
                    <small>{{ item.description }}</small>
                  </h3>
                </v-expansion-panel-header>

                <v-expansion-panel-content>
                  <div class="ma-2">
                    <v-simple-table class="my-5">
                      <template v-slot:default>
                        <thead>
                          <tr>
                            <th>KPI</th>
                            <th>Progress</th>
                            <th>Date Created</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="kpi in item.kpi_set" :key="kpi.id">
                            <th>{{ kpi.description }}</th>
                            <th>{{ kpi.progress }}</th>
                            <td>{{ kpi.date_created }}</td>
                          </tr>
                        </tbody>
                      </template>
                    </v-simple-table>

                    <v-row>
                      <v-col> Goal Settings Stage Employee comments </v-col>
                      <v-col>
                        {{ item.goal_employees_comment || 'NIL' }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col> Goal Settings Stage Manager comments </v-col>
                      <v-col>
                        {{ item.goal_manager_comment || 'NIL' }}
                      </v-col>
                    </v-row>

                    <v-row>
                      <v-col>Set tracking status</v-col>
                      <v-col>
                        {{ item.tracking_status }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col> Mid year employee comments </v-col>
                      <v-col>
                        {{ item.MID_user_comments || 'NIL' }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col> Mid year Manager comments </v-col>
                      <v-col>
                        {{ item.MID_manager_comments || 'NIL' }}
                      </v-col>
                    </v-row>

                    <v-row>
                      <v-col>End Year Employee Comment</v-col>
                      <v-col>
                        <v-textarea v-model="item.user_comments" outlined>
                        </v-textarea
                      ></v-col>
                    </v-row>
                    <v-row>
                      <v-col>Employee Self rating</v-col>
                      <v-col>
                        <v-select
                          v-model="item.user_rating"
                          :items="ratings"
                          item-text="name"
                          item-value="value"
                        ></v-select>
                      </v-col>
                    </v-row>
                  </div>
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>

            <h3 class="font-weight-medium my-2">Core Values</h3>

            <v-textarea
              v-model="employeeComment"
              label="Core value Comment"
              outlined
            >
            </v-textarea>

            <v-data-table
              :headers="headers"
              :items="core_values"
            ></v-data-table>

            <br/>

            <v-file-input
              v-model="file"
              label="End year review file"
              outlined
              name="file"
              @change="endyearFile"
            ></v-file-input>

            <div v-if="appraisal.end_year_employee_file">
              <v-alert type="success">
                Endyear file uploaded
                <a :href="appraisal.end_year_employee_file" target="_blank"
                  >Download</a
                >
              </v-alert>
            </div>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="close"> Close </v-btn>
            <v-btn color="primary" elevation="0" @click="submit">
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
import global from '~/mixins/global'
export default {
  name: 'EndYearEmployeeReview',
  mixins: [global],
  props: { dialog: Boolean, appraisalId: Number },
  async fetch() {
    this.appraisal = await this.$axios.$get(
      `api/appraisals/detail/${this.appraisalId}`
    )

    this.init()
  },
  data() {
    return {
      goals: [],
      headers: [
        {
          text: 'Summary',
          align: 'start',
          value: 'summary',
          sortable: true,
        },
        {
          text: 'Description',
          align: 'start',
          value: 'description',
          sortable: true,
        },
        {
          text: 'User Comments',
          align: 'start',
          value: 'user_comments',
          sortable: true,
        },
      ],
      core_values: [],
      employeeComment: '',
      file: '',
      appraisal: {},
    }
  },
  methods: {
    close() {
      this.$emit('close-end-year-dialog')
    },
    init() {
      this.goals = this.appraisal.goals_set
      this.core_values = this.appraisal.competencies_set
    },
    async patchGoals() {
      this.goals.forEach(async (goal) => {
        await this.$axios.patch(`api/goal/${goal.id}`, {
          user_comments: goal.user_comments,
          user_rating: goal.user_rating,
        })
      })
    },
    async patchCoreValues() {
      this.core_values.forEach(async (core_value) => {
        await this.$axios.patch(`api/competencies/${core_value.id}`, {
          user_comments: this.employeeComment,
          user_rating: core_value.user_rating
        })
      })
    },
    async submit() {
      try {
        await this.patchGoals()
        await this.patchCoreValues()
        await this.$axios.post(`api/input/employee/endyear/${this.appraisalId}`)

        this.$notifier.showMessage({
          content:
            'You have Successfully submitted end year review. Please confirm review',
          color: 'info',
        })

        this.$emit('reload')
      } catch (error) {
        this.$notifier.showMessage({
          content: 'An error found please validate or try again',
          color: 'error',
        })
      }

      this.close()
    },
    endyearFile() {
      const bodyFormData = new FormData()
      bodyFormData.append('end_year_employee_file', this.file)

      this.$axios
        .$patch(`api/appraisals/admin/${this.appraisalId}/`, bodyFormData)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'EndYear File uploaded success',
            color: 'info',
          })

          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'EndYear File uploaded failed',
            color: 'error',
          })
        })
    },
  },
}
</script>
