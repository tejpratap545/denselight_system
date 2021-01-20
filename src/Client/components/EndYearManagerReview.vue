<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="800">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card v-else>
          <EndyearRejection
            v-if="rejectDialog"
            :dialog="rejectDialog"
            :appraisal-id="appraisalId"
            @close-reject-endyear="rejectDialog = false"
            @reload="$fetch"
          >
          </EndyearRejection>
          <v-card-title class="headline">
            End Manager/supervisor Year Review
          </v-card-title>
          <v-card-text>
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
                    <b>{{ item.goal_title }}</b> <v-spacer />
                    <small>{{ item.category.name }}</small>
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
                      <v-col>Employee Self rating</v-col>
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
                          readonly
                        ></v-rating>
                        <br />
                        {{ ratingName(item.user_rating) }}</v-col
                      >
                    </v-row>
                    <v-row>
                      <v-col>End Year Employee Comment</v-col>
                      <v-col>
                        {{ item.user_comments || 'NIL' }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col>Manager rating</v-col>
                      <v-col>
                        <v-rating
                          v-model="item.manager_rating"
                          background-color="grey lighten-2"
                          color="primary"
                          length="5"
                          size="30"
                          value="1"
                          dense
                          hover
                        ></v-rating>
                        <br />
                        {{ ratingName(item.manager_rating) }}</v-col
                      >
                    </v-row>
                    <v-row>
                      <v-col>End Year Manager Comment</v-col>
                      <v-col>
                        <v-textarea
                          v-model="item.manager_comments"
                          outlined
                        ></v-textarea>
                      </v-col>
                    </v-row>
                  </div>
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>
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
import EndyearRejection from '~/components/EndyearRejection'
export default {
  name: 'EndYearManagerReview',
  components: { EndyearRejection },
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
      goals: [],
    }
  },
  methods: {
    close() {
      this.$emit('close-end-year-manager-dialog')
    },
    init(appraisal) {
      appraisal.goals_set.forEach((goal) => {
        this.goals.push({
          id: goal.id,
          goal_title: goal.summary,
          description: goal.description,
          due: goal.due,
          category: goal.goal_category.name,
          user_comments: goal.user_comments,
          MID_user_comments: goal.MID_user_comments,
          MID_manager_comments: goal.MID_manager_comments,
          user_rating: goal.user_rating,
          manager_comments: goal.manager_comments,
          manager_rating: goal.manager_rating,
        })
      })
    },
    async patchGoals() {
      this.goals.forEach(async (goal) => {
        await this.$axios.patch(`api/goal/${goal.id}`, {
          manager_comments: goal.manager_comments,
          manager_rating: goal.manager_rating,
        })
      })
    },
    async submit() {
      await this.patchGoals().then(() => {
        this.$axios
          .post(`api/input/manager/endyear/${this.appraisalId}`)
          .then(() => {
            this.$notifier.showMessage({
              content:
                'You  have   Successfully submitted end year review . Please confirm review',
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
      })
    },
  },
}
</script>
