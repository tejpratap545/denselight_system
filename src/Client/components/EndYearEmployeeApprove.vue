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
          <v-card-title class="headline">
            {{ appraisal.appraisal_name }}

            <v-spacer />

            <v-btn icon @click="print">
              <v-icon>mdi-printer</v-icon>
            </v-btn>
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
                    <v-col> tracking status</v-col>
                    <v-col>
                      {{ item.tracking_status }}
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col> Mid year employee comments </v-col>
                    <v-col>
                      {{ item.MID_user_comments }}
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col>User rating</v-col>
                    <v-col>
                      <v-rating
                        v-model="item.user_rating"
                        background-color="grey lighten-2"
                        color="primary"
                        length="5"
                        size="30"
                        value="1"
                        dense
                        hover
                      ></v-rating
                    ></v-col>
                  </v-row>
                  <v-row>
                    <v-col>End Year Employee Comment</v-col>
                    <v-col>
                      {{ item.user_comments }}
                    </v-col>
                  </v-row>
                </td>
              </template>
            </v-data-table>

            <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Core values</th>
                    <th>Employee's Rating</th>
                    <th>Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.competencies_set" :key="item.id">
                    <th>{{ item.summary }}</th>
                    <th>
                      <v-rating
                        dense
                        readonly
                        :value="item.user_rating"
                      ></v-rating>
                    </th>
                    <td>{{ item.user_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

            <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Skills</th>
                    <th>Employee's Rating</th>
                    <th>Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.skills_set" :key="item.id">
                    <th>{{ item.description }}</th>
                    <th>
                      <v-rating
                        dense
                        readonly
                        :value="item.user_rating"
                      ></v-rating>
                      <br />
                      {{ ratingName(item.user_rating) }}
                    </th>
                    <td>{{ item.user_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
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
  name: 'ApproveReviewsVue',
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
      this.$emit('close-approve-dialog')
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
        .post(`api/submit/employee/endyear/${this.appraisalId}`)
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
