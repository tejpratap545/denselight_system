<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="70%">
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
                  color="primary lighten-2"
                >
                  <h3 class="title-topbar">
                    <b>{{ item.goal_title }}</b> <v-spacer />
                    <small>{{ item.category }}</small>
                  </h3>
                </v-expansion-panel-header>

                <v-expansion-panel-content>
                  <v-card class="my-2">
                    <v-card-text><b>Description : </b>{{ item.description }}</v-card-text>
                  </v-card>

                  <v-card
                    v-for="kpi in item.kpi_set"
                    :key="kpi.id"
                    class="my-5"
                  >
                    <v-card-text>
                      <p>{{ kpi.description }}</p>
                      <small
                        >Progress : <b>{{ kpi.progress }}</b></small
                      >
                    </v-card-text>
                  </v-card>

                  <div class="ma-2">
                    <v-select
                      v-model="item.tracking_status"
                      label="trackingStatus"
                      :items="trackingStatus"
                    >
                    </v-select>
                    <v-textarea
                      v-model="item.MID_user_comments"
                      label="Mid Year Employee Comment"
                    >
                    </v-textarea>
                  </div>
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>
          </v-card-text>
          <v-card-actions class="mx-2">
            <v-spacer></v-spacer>
            <v-btn text @click="close"> Close </v-btn>
            <v-btn color="success" text @click="submit"> Submit </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'MidYearEmployeeReviewVue',
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
      this.$emit('close-mid-year-dialog')
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
          kpi_set: goal.kpi_set
        })
      })
    },
    submit() {
      this.goals.forEach((goal) => {
        this.$axios.patch(`api/goal/${goal.id}`, {
          MID_user_comments: goal.MID_user_comments,
          tracking_status: goal.tracking_status,
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
