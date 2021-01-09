<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="70%">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card v-else>
          <MidyearRejection
            v-if="rejectDialog"
            :dialog="rejectDialog"
            :appraisal-id="appraisalId"
            @close-reject-midyear="rejectDialog = false"
            @reload="$fetch"
          >
          </MidyearRejection>
          <v-card-title class="headline">
            Mid-Year Manager Review
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
                    <div><b>Description : </b>{{ item.description }}</div>

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
                      <v-col> Mid year Manager comments </v-col>
                      <v-col>
                        <v-textarea
                          v-model="item.MID_manager_comments"
                          outlined
                        >
                        </v-textarea
                      ></v-col>
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
            <v-btn color="primary" @click="submit"> Submit </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
import MidyearRejection from '~/components/MidyearRejection'
export default {
  name: 'MidYearManagerReviewVue',
  components: { MidyearRejection },
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
      trackingStatus: ['On Track', 'Not On Track'],
      ratingChoice: [
        {
          id: 1,
          name: '1 - Major Improvement Needed',
        },
        {
          id: 2,
          name: '2 - Needs Improvement',
        },
        {
          id: 3,
          name: '3 - Meets Expectations',
        },
        {
          id: 4,
          name: '4 - Exceeds Expectations',
        },
        {
          id: 5,
          name: '5 - Far Exceed Expectations',
        },
      ],
    }
  },
  methods: {
    close() {
      this.$emit('close-mid-year-manager-dialog')
    },
    init(appraisal) {
      appraisal.goals_set.forEach((goal) => {
        this.goals.push({
          id: goal.id,
          goal_title: goal.summary,
          description: goal.description,
          due: goal.due,
          category: 'Organization Effectivness',
          weightage: `${goal.weightage}%`,
          MID_user_comments: goal.MID_user_comments,
          tracking_status: goal.tracking_status,
          MID_manager_comments: goal.MID_manager_comments,
          kpi_set: goal.kpi_set,
        })
      })
    },

    // eslint-disable-next-line require-await
    async patchGoals() {
      this.goals.forEach(async (goal) => {
        await this.$axios.patch(`api/goal/${goal.id}`, {
          MID_manager_comments: goal.MID_manager_comments,
        })
      })
    },
    async submit() {
      await this.patchGoals().then(() => {
        this.$axios
          .post(`api/input/manager/midyear/${this.appraisalId}`)
          .then(() => {
            this.$notifier.showMessage({
              content:
                'Manager Mid Year Successfully submitted . Please confirm review',
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

<style>
.title-topbar {
  color: #fff;
  font-weight: 300;
}
</style>
