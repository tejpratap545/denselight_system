<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="800">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card v-else>
          <v-card-title class="headline"> Mid-Year Review </v-card-title>
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
                      <v-col>Set tracking status</v-col>
                      <v-col>
                        <v-select
                          v-model="item.tracking_status"
                          :items="trackingStatus"
                        >
                        </v-select
                      ></v-col>
                    </v-row>
                    <v-row>
                      <v-col> Mid year employee comments </v-col>
                      <v-col>
                        <v-textarea v-model="item.MID_user_comments" outlined>
                        </v-textarea
                      ></v-col>
                    </v-row>
                  </div>
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>
          </v-card-text>
          <v-card-actions class="mx-2">
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
export default {
  name: 'MidYearEmployeeReview',
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
      goals: [],
      trackingStatus: ['On Track', 'Not On Track'],
    }
  },
  methods: {
    close() {
      this.$emit('close-mid-year-dialog')
    },
    init(appraisal) {
      appraisal.goals_set.forEach((goal) => {
        this.goals.push({
          id: goal.id,
          goal_title: goal.summary,
          description: goal.description,
          due: goal.due,
          category: goal.goal_category,
          weightage: `${goal.weightage}%`,
          MID_user_comments: goal.MID_user_comments,
          tracking_status: goal.tracking_status,
          // kpi_set: goal.kpi_set
        })
      })
    },
    async patchGoals() {
      this.goals.forEach(async (goal) => {
        await this.$axios.patch(`api/goal/${goal.id}`, {
          MID_user_comments: goal.MID_user_comments,
          tracking_status: goal.tracking_status,
        })
      })
    },
    async submit() {
      await this.patchGoals().then(() => {
        this.$axios
          .post(`api/input/employee/midyear/${this.appraisalId}`)
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
