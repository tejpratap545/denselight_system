<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <v-card v-else class="pa-10">
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
        <template v-slot:[`item.actions`]="{ item }">
          <v-dialog v-model="item.dialog" scrollable max-width="800">
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="primary" icon v-bind="attrs" v-on="on">
                <v-icon>mdi-chat-outline</v-icon>
              </v-btn>
            </template>

            <v-card>
              <v-toolbar color="primary" dark>
                <b>{{ item.goal_title }}</b> : Comments
                <v-spacer></v-spacer>
                <v-btn icon @click="item.dialog = false">
                  <v-icon>mdi-close</v-icon>
                </v-btn>
              </v-toolbar>

              <v-card-text>
                <v-tabs v-model="item.tabs" vertical class="mt-5">
                  <v-tab>GOAL SETTING</v-tab>
                  <v-tab>MID YEAR</v-tab>
                  <v-tab>END YEAR</v-tab>

                  <v-tabs-items v-model="item.tabs">
                    <v-tab-item
                      v-for="comment in item.comments"
                      :key="comment.id"
                      class="pa-5"
                    >
                      <v-card flat class="chat-ui">
                        <v-card-text class="chat-container">
                          <p v-if="comment.data == null" class="text-center">
                            No comments yet
                          </p>
                          <v-card
                            v-for="c in comment.data"
                            :key="c.cid"
                            flat
                            :class="
                              c.cid == 0 ? 'my-4 my-chat' : 'my-4 manager-chat'
                            "
                            raised
                          >
                            <v-card-title class="subtitle-2">{{
                              c.cc
                            }}</v-card-title>
                            <v-card-text v-if="c.cid == 0">
                              ~My response
                            </v-card-text>

                            <v-card-text v-else>
                              ~Manager's Comment
                            </v-card-text>
                          </v-card>
                        </v-card-text>
                        <v-card-actions
                          v-if="checkCommentDisable(comment.id) && isEditable"
                        >
                          <v-textarea
                            v-model="newComment"
                            label="Write your comment here"
                            outlined
                          ></v-textarea>
                        </v-card-actions>
                        <div
                          v-if="checkCommentDisable(comment.id) && isEditable"
                        >
                          <v-btn
                            color="primary"
                            @click="postcomment(comment.id, item)"
                            >Send Message
                          </v-btn>
                        </div>
                      </v-card>
                    </v-tab-item>
                  </v-tabs-items>
                </v-tabs>
              </v-card-text>
            </v-card>
          </v-dialog>
        </template>

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
              <v-col> Goal Settings Stage Employee comment </v-col>
              <v-col>
                {{ item.goal_employees_comment || 'NIL' }}
              </v-col>
            </v-row>
            <v-row>
              <v-col> Goal Settings Stage Manager comment </v-col>
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
              <v-col> Mid year Manager comments </v-col>
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
              <v-col> {{ ratingName(item.manager_rating) }}</v-col>
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
          <v-col>{{ appraisal.competencies_set[0].manager_comments }}</v-col>
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
    </v-card-text>
    <div>
      <v-row>
        <v-col>Moderation commitee Comment </v-col>

        <v-col>
          <div v-if="checkHodComment()">
            <v-textarea
              v-model="appraisal.board_comments"
              outlined
            ></v-textarea>
          </div>
          <div v-else>
            {{ appraisal.board_comments || 'NIL' }}
          </div>
        </v-col>
      </v-row>

      <v-row>
        <v-col>Moderation commitee Rating(Final)</v-col>
        <v-col>
          <v-select
            v-if="checkHodComment()"
            v-model="appraisal.board_rating"
            :items="ratings"
            item-text="name"
            item-value="value"
          ></v-select>
          <div v-else>
            {{ ratingName(appraisal.board_rating || 1) }}
          </div>
        </v-col>
      </v-row>

      <v-card flat>
        <v-card-text class="text-center">
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

          <v-row>
            <v-col>Moderation commitee Rating(Final)</v-col>
            <v-col>
              {{ ratingName(appraisal.board_rating) }}
            </v-col>
          </v-row>
          <v-row>
            <v-col class="body-1">where do you want to be in 5 years?</v-col>
            <v-col>
              {{ careerAspiration.comment }}
            </v-col>
          </v-row>
        </v-card-text>
      </v-card>

      <v-row v-if="checkHodComment()">
        <v-spacer></v-spacer>

        <v-btn color="primary" elevation="0" @click="submitBoardRating">
          Submit
        </v-btn>
      </v-row>
    </div>
  </v-card>
</template>

<script>
import global from '~/mixins/global'
export default {
  name: 'Appraisal',
  mixins: [global],
  props: { appraisalId: Number, isEditable: { default: false } },
  async fetch() {
    this.appraisal = {}
    this.goals = []
    await this.$axios
      .$get(`api/appraisals/detail/${this.appraisalId}`)
      .then((res) => {
        this.init(res)
      })

    await this.$axios
      .$get(`api/career_aspiration/appraisal?id=${this.appraisalId}`)
      .then((res) => {
        this.careerAspiration = res
      })
  },
  data() {
    return {
      tabData: null,
      newComment: '',
      careerAspiration: '',
      goalHeaders: [
        { text: 'Goal', value: 'goal_title' },
        {
          text: 'Description',
          value: 'description',
        },
        { text: 'Tracking', value: 'tracking_status' },

        { text: 'Actions', value: 'actions' },
        { text: '', value: 'data-table-expand' },
      ],
      goals: [],
      appraisal: {},
    }
  },

  methods: {
    init(appraisal) {
      this.appraisal = appraisal

      appraisal.goals_set.forEach((goal) => {
        this.goals.push({
          id: goal.id,
          category: goal.goal_category.name,
          goal_title: goal.summary,
          description: goal.description,
          due: goal.due,
          status: goal.status,
          weightage: `${goal.weightage}%`,
          dialog: false,
          kpi_dialog: false,
          tabs: null,
          date_menu: false,
          comments: [
            {
              id: 0,
              data: [
                { cid: 0, cc: goal.goal_employees_comment },
                { cid: 1, cc: goal.goal_manager_comment },
              ],
            },
            {
              id: 1,
              data: [
                { cid: 0, cc: goal.MID_user_comments },
                { cid: 1, cc: goal.MID_manager_comments },
              ],
            },
            {
              id: 2,
              data: [
                { cid: 0, cc: goal.user_comments },
                { cid: 1, cc: goal.manager_comments },
              ],
            },
          ],
          kpi_set: goal.kpi_set.reverse(),
          goal_employees_comment: goal.goal_employees_comment,
          goal_manager_comment: goal.goal_manager_comment,
          tracking_status: goal.tracking_status,
          MID_user_comments: goal.MID_user_comments,
          user_rating: goal.user_rating,
          user_comments: goal.user_comments,
          manager_rating: goal.manager_rating,
          manager_comments: goal.manager_comments,
        })
      })
    },
    checkCommentDisable(id) {
      if (this.appraisal.overall_appraisal.status === 'Stage 1' && id === 0) {
        return true
      } else if (
        this.appraisal.overall_appraisal.status === 'Stage 1B' &&
        id === 1
      ) {
        return true
      } else if (
        this.appraisal.overall_appraisal.status === 'Stage 2' &&
        id === 2
      ) {
        return true
      } else {
        return false
      }
    },
    postcomment(cid, item) {
      item.dialog = false

      if (cid === 0) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            goal_manager_comment: this.newComment,
          })
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Success commenting',
              color: 'info',
            })
            this.newComment = ''
            this.reload()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error commenting',
              color: 'error',
            })
          })
      }
      if (cid === 1) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            MID_manager_comments: this.newComment,
          })
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Success commenting',
              color: 'info',
            })
            this.newComment = ''
            this.reload()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error commenting',
              color: 'error',
            })
          })
      }
      if (cid === 2) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            manager_comments: this.newComment,
          })
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Success commenting',
              color: 'info',
            })
            this.newComment = ''
            this.reload()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error commenting',
              color: 'error',
            })
          })
      }
    },
    reload() {
      this.$fetch()
    },
    checkHodComment() {
      const result =
        this.appraisal.overall_appraisal.status === 'Stage 2' &&
        this.appraisal.status === 'Approved' &&
        this.appraisal.completion === 'MCompleted' &&
        (this.appraisal.employee.second_Reporting_Manager ===
          this.$auth.user.id ||
          this.$auth.user.user.role === 'Admin')

      return result
    },
    submitBoardRating() {
      this.$axios
        .patch(`api/appraisals/admin/${this.appraisal.id}/`, {
          board_comments: this.appraisal.board_comments,
          board_rating: this.appraisal.board_rating,
        })
        .then(() => {
          this.$axios
            .post(`api/submit/board/endyear/${this.appraisalId}`)
            .then(() => {
              this.$notifier.showMessage({
                content:
                  'You  have   Successfully submitted end year board  review .',
                color: 'info',
              })

              this.$fetch()
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
.my-chat {
  background: #55c4fa !important;
  color: #fff !important;
  width: 350px;
  float: right;
  border-radius: 20px !important;
}
.chat-container {
  height: 350px;
  overflow-y: scroll;
  padding: 0 10px;
  margin-bottom: 10px;
}
.manager-chat {
  background: #00ca48 !important;
  color: #fff !important;
  width: 350px;
  float: left;
  border-radius: 20px !important;
}
</style>
