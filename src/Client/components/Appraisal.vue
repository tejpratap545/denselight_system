<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <v-card v-else class="pa-10">
    <EndyearRejection
      v-if="rejectDialog"
      :dialog="rejectDialog"
      :appraisal-id="appraisalId"
      @close-reject-endyear="rejectDialog = false"
    >
    </EndyearRejection>
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
                            :key="c.id"
                            flat
                            :class="
                              c.created_by == $auth.user.id
                                ? 'my-4 my-chat'
                                : 'my-4 manager-chat'
                            "
                            raised
                          >
                            <v-card-title class="subtitle-2">{{
                              c.comment
                            }}</v-card-title>
                            <v-card-text v-if="c.created_by == $auth.user.id">
                              ~My response
                            </v-card-text>

                            <v-card-text v-else>
                              ~Manager's Comment
                            </v-card-text>
                          </v-card>
                        </v-card-text>
                        <v-card-actions>
                          <v-textarea
                            v-model="newcomment.comment"
                            label="Write your comment here"
                            outlined
                          ></v-textarea>
                        </v-card-actions>
                        <div>
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
              <v-col> Mid year employee comments </v-col>
              <v-col>
                {{ item.MID_manager_comments }}
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
                ></v-rating
              ></v-col>
            </v-row>
            <v-row>
              <v-col>End Year Manager Comment</v-col>
              <v-col>
                {{ item.manager_comments }}
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
                <v-rating dense readonly :value="item.user_rating"></v-rating>
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
                <v-rating dense readonly :value="item.user_rating"></v-rating>
              </th>
              <td>{{ item.user_comments }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-card-text>

    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn text @click="dialog = false"> Close </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: { appraisalId: Number },
  async fetch() {
    await this.$axios
      .$get(`api/appraisals/detail/${this.appraisalId}`)
      .then((res) => {
        this.init(res)
      })
  },
  data() {
    return {
      tabData: null,
      newcomment: {
        comment: '',
        goal: 0,
        created_by: this.$auth.user.id,
      },
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
    print() {
      print()
    },
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
            { id: 0, date: goal.commentbox_set },
            { id: 1, data: goal.midyrcommentbox_set },
            { id: 2, data: goal.endyrcommentbox_set },
          ],
          kpi_set: goal.kpi_set,
          tracking_status: goal.tracking_status,
          MID_user_comments: goal.MID_user_comments,
          user_rating: goal.user_rating,
          user_comments: goal.user_comments,
        })
      })
    },
    postcomment(cid, item) {
      this.newcomment.goal = item.id
      item.dialog = false

      let url = ''
      switch (cid) {
        case 0:
          url = 'api/comment/goals/'
          break

        case 1:
          url = 'api/comment/midyear/'
          break

        case 2:
          url = 'api/comment/endyear/'
          break

        default:
          break
      }

      if (url != '')
        this.$axios
          .$post(url, this.newcomment)
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Success commenting',
              color: 'info',
            })
            this.reload()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error commenting',
              color: 'error',
            })
          })
    },
    reload() {
      this.$fetch()
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
