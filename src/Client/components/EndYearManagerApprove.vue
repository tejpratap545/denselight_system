<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="900">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div
          v-else-if="$fetchState.error"
          style="height: 100px; background: #fff"
        >
          An error occurred
        </div>
        <v-card v-else class="pa-10">
          <EndyearRejection
            v-if="rejectDialog"
            :dialog="rejectDialog"
            :appraisal-id="appraisalId"
            @close-reject-endyear="rejectDialog = false"
            @reload="$fetch"
          >
          </EndyearRejection>
          <v-card-title class="headline">
            {{ appraisal.appraisal_name }}

            <v-spacer />

            <a target="_blank" :href="`/print/?id=${appraisal.id}`">
              <v-btn icon>
                <v-icon>mdi-printer</v-icon>
              </v-btn>
            </a>

            <a :href="appraisal.end_year_employee_file" target="_blank">
              <v-btn icon>
                <v-icon>mdi-download-box-outline</v-icon>
              </v-btn>
            </a>
          </v-card-title>

          <v-card-text>
            <v-simple-table class="my-5">
              <template v-slot:default>
                <tbody>
                  <tr>
                    <th>Name</th>
                    <td>{{ appraisal.employee.name }}</td>
                  </tr>
                  <tr>
                    <th>Department</th>
                    <td>{{ appraisal.employee.department.name }}</td>
                  </tr>
                  <tr>
                    <th>Job Title</th>
                    <td>-------</td>
                  </tr>
                  <tr>
                    <th>Manager/Supervisor's Name</th>
                    <td>{{ appraisal.manager.name }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

            <v-data-table
              :headers="goalHeaders"
              :items="goals"
              show-expand
              class="my-5"
              flat
            >
              <template v-slot:expanded-item="{ headers, item }">
                <td :colspan="headers.length">
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
                    <v-col> tracking status</v-col>
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
                    <v-col> Mid year employee comments </v-col>
                    <v-col>
                      {{ item.MID_manager_comments || 'NIL' }}
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col>End Year Employee Comment</v-col>
                    <v-col>
                      {{ item.user_comments || 'NIL' }}
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col>End Year Manager Comment</v-col>
                    <v-col>
                      {{ item.manager_comments || 'NIL' }}
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col>Employee Self rating</v-col>
                    <v-col> {{ ratingName(item.user_rating) }}</v-col>
                  </v-row>
                  <v-row>
                    <v-col>Manager rating</v-col>
                    <v-col>{{ ratingName(item.manager_rating) }}</v-col>
                  </v-row>
                </td>
              </template>
            </v-data-table>

            <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Core values</th>
                    <th>Description</th>
                    <th>Weightage</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.competencies_set" :key="item.id">
                    <td>{{ item.summary }}</td>
                    <td>{{ item.description }}</td>
                    <td>{{ item.weightage }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

            <div v-if="appraisal.competencies_set.length != 0">
              <v-row class="ml-2">
                <v-col><b>Employee's comment</b></v-col>
                <v-col>{{ appraisal.competencies_set[0].user_comments }}</v-col>
              </v-row>
              <v-row class="ml-2">
                <v-col><b>Manager's comment</b></v-col>
                <v-col>{{
                  appraisal.competencies_set[0].manager_comments
                }}</v-col>
              </v-row>
            </div>

            <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Skills</th>
                    <th>Employee's Comments</th>
                    <th>Manager's Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.skills_set" :key="item.id">
                    <td>{{ item.summary }}</td>
                    <td>
                      {{ item.user_comments }}
                    </td>
                    <td>{{ item.manager_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

            <v-row>
              <v-col>Final Emplolyee's Self Rating</v-col>
              <v-col>
                {{ ratingName(appraisal.final_employee_rating) }}
              </v-col>
            </v-row>

            <v-row>
              <v-col>Final Manager Rating</v-col>
              <v-col>
                {{ ratingName(appraisal.final_manager_rating) }}
              </v-col>
            </v-row>
          </v-card-text>

          <v-card-text class="text-center">
            <v-row>
              <v-col class="body-1">Where do you want to be in 2 years?</v-col>

              <v-col>
                {{ appraisal.career_aspiration_employee }}
              </v-col>
              <v-col>
                {{ appraisal.career_aspiration_manager }}
              </v-col>
            </v-row>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="close"> Close </v-btn>
            <v-btn text color="error" @click="rejectDialog = true">
              reject
            </v-btn>
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
  name: 'ApproveReviews',
  mixins: [global],
  props: { dialog: Boolean, appraisalId: Number },
  async fetch() {
    await this.$axios
      .$get(`api/appraisals/detail/${this.appraisalId}`)
      .then((res) => {
        this.init(res)
      })
  },
  data() {
    return {
      rejectDialog: false,
      goalHeaders: [
        { text: 'Goal', value: 'summary' },
        { text: 'Tracking', value: 'tracking_status' },
        { text: 'Comments', value: 'user_comments' },
        { text: '', value: 'data-table-expand' },
      ],
      goals: [],
      appraisal: {},
    }
  },
  methods: {
    close() {
      this.$emit('close-end-year-manager-submit-dialog')
    },
    init(appraisal) {
      this.appraisal = appraisal
      this.goals = appraisal.goals_set
    },
    print() {
      print()
    },

    async submit() {
      await this.$axios
        .post(`api/approve/manager/endyear/${this.appraisalId}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'You  have   Successfully confirmed end year review .',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error found please validate or try again',
            color: 'error',
          })
          this.close()
        })
    },
  },
}
</script>

<style scoped></style>
