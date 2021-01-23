<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="800">
      <v-card>
        <v-card-title class="headline"> Add Goal </v-card-title>
        <v-card-text>
          <v-select
            v-model="goal.category.id"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Enter goal category"
          ></v-select>
          <v-text-field
            v-model="goal.goal_title"
            label="Goal Title "
          ></v-text-field>

          <v-textarea
            v-model="goal.description"
            label="Goal Objective "
            outlined
          ></v-textarea>
          <v-text-field label="Tracking Source/Documents "></v-text-field>
          <v-text-field
            v-model="goal.weightage1"
            label="Weightage (%)"
            type="number"
          ></v-text-field>

          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="goal.due"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="goal.due"
                label="Due Date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker v-model="goal.due" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false"> Cancel </v-btn>
              <v-btn text color="primary" @click="$refs.menu.save(goal.due)">
                OK
              </v-btn>
            </v-date-picker>
          </v-menu>
          <v-row>
            <v-col> Goal Settings Stage Employee Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.goal_employees_comment" outlined>
              </v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col> Goal Settings Stage Manager Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.goal_manager_comment" outlined>
              </v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col>Set tracking status</v-col>
            <v-col>
              <v-select v-model="goal.tracking_status" :items="trackingStatus">
              </v-select
            ></v-col>
          </v-row>
          <v-row>
            <v-col> Mid Year Employee Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.MID_user_comments" outlined>
              </v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col>Mid Year Manager Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.MID_manager_comments" outlined>
              </v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col>Employee Self rating</v-col>
            <v-col>
               <v-select v-model="goal.user_rating"
                :items="ratings"
                item-text="name"
                item-value="value"
               >
              </v-select>
              <br />
              {{ ratingName(goal.user_rating) }}</v-col
            >
          </v-row>
          <v-row>
            <v-col> End Year Employee Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.user_comments" outlined> </v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col>Manager rating</v-col>
            <v-col>
              <v-select v-model="goal.manager_rating"
                :items="ratings"
                item-text="name"
                item-value="value"
               ></v-select>
              <br />
              {{ ratingName(goal.manager_rating) }}</v-col
            >
          </v-row>
          <v-row>
            <v-col>End Year Manager Comment </v-col>
            <v-col>
              <v-textarea v-model="goal.manager_comments" outlined>
              </v-textarea>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="info darken-1" text @click="$emit('close')">
            Cancel
          </v-btn>
          <v-btn color="green darken-1" text @click="goalUpdate">
            Update
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import global from '~/mixins/global'

export default {
  name: 'AdminEditGoal',
  mixins: [global],
  props: { dialog: Boolean, goal: Object },
  fetch() {
    this.$axios
      .$get('/api/category/goal/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      categories: '',
      trackingStatus: ['On Track', 'Not On Track'],
      ratings: [
        {
          name: '1',
          value: 'Major Improvement Needed'
        },
        {
          name: '2',
          value: 'Needs Improvement'
        },
        {
          name: '3',
          value: 'Meet Expectations'
        },
        {
          name: '4',
          value: 'Exceed Expectations'
        },
        ,
        {
          name: '5',
          value: 'Far Exceed Expectations'
        }
      ]
    }
  },
  methods: {
    goalUpdate() {
      this.$axios
        .patch(
          `api/goal/${this.goal.id}`,

          {
            // basic info
            goal_category: this.goal.category.id,
            summary: this.goal.title,
            description: this.goal.description,
            weightage: this.goal.weightage1,

            goal_manager_comment: this.goal.goal_manager_comment,
            goal_employees_comment: this.goal.goal_employees_comment,
            // mid year

            MID_user_comments: this.goal.MID_user_comments,
            tracking_status: this.goal.tracking_status,
            MID_manager_comments: this.goal.MID_manager_comments,

            // end year
            user_comments: this.goal.user_comments,
            user_rating: this.goal.user_rating,
            manager_comments: this.goal.manager_comments,
            manager_rating: this.goal.manager_rating,
          }
        )
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully update goal ',
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

    close() {
      this.$emit('close')
    },
  },
}
</script>

<style scoped></style>
