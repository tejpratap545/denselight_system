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
            <v-card v-for="item in goals" :key="item.id" class="my-3">
              <v-card-subtitle>Goal</v-card-subtitle>
              <v-card-text>{{ item.goal_title }}</v-card-text>
              <v-card-subtitle>Goal Category</v-card-subtitle>
              <v-card-text>{{ item.category }}</v-card-text>
              <v-card-subtitle>Description</v-card-subtitle>
              <v-card-text>{{ item.description }}</v-card-text>
              <v-select
                v-model="item.tracking_status"
                label="trackingStatus"
                :items="trackingStatus"
              >
              </v-select>
              <v-card-text>
                <v-textarea
                  v-model="item.MID_user_comments"
                  label="Mid Year Employee Comment"
                >
                </v-textarea>
              </v-card-text>
            </v-card>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="green darken-1" text @click="close"> Disagree </v-btn>
            <v-btn color="green darken-1" text @click="submit"> Submit </v-btn>
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

<style scoped></style>
