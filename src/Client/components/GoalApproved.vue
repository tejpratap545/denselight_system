<template>
  <div>
    <v-dialog v-model="rejectionDialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline">
          Manager rejection Comment
        </v-card-title>
        <v-card-text>
          <v-textarea v-model="goals_settingM_rejection" outlined> </v-textarea>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error darken-1" text @click="rejectionDialog = false">
            cancel
          </v-btn>
          <v-btn color="green darken-1" text @click="finalReject">
            Reject
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="goalsApprovedDialog" persistent max-width="500">
      <v-card>
        <v-card-title class="title">
          Approve Or Reject {{ current_goal.goal_title }}
        </v-card-title>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="info darken-1"
            text
            @click="goalsApprovedDialog = false"
          >
            close
          </v-btn>
          <v-btn color="error darken-1" text @click="rejectGoal">
            Reject
          </v-btn>
          <v-btn color="success darken-1" text @click="approvedGoal">
            Approve
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialog" persistent>
      <div v-if="$fetchState.pending">
        <v-skeleton-loader
          class="px-10 my-5"
          type=" table-thead, card-heading, card"
        ></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>
      <v-card v-else>
        <v-card-title class="headline"> Approved Or Reject Goals </v-card-title>
        <v-card-text>
          <div class="px-10 my-5">
            <v-tabs
              v-model="tabData"
              background-color="transparent"
              color="#2952A4"
              centered
              grow
            >
              <v-tab>Goals</v-tab>
              <v-tab>Core Values</v-tab>
              <v-tab>Skills</v-tab>
            </v-tabs>

            <v-tabs-items v-model="tabData">
              <v-tab-item>
                <v-card flat>
                  <v-toolbar
                    elevation="0"
                    class="ma-5"
                    color="primary"
                    rounded
                    dark
                  >
                    <b>{{ name }} Goals</b>
                    <v-spacer></v-spacer>
                  </v-toolbar>
                  <v-card-text>
                    <v-data-table
                      :headers="myGoalsTableHeader"
                      :items="myGoalsTableItems"
                      :items-per-page="10"
                      show-expand
                    >
                      <template v-slot:[`item.actions`]="{ item }">
                        <div>
                          <v-dialog
                            v-model="item.dialog"
                            scrollable
                            max-width="800"
                          >
                            <template v-slot:activator="{ on, attrs }">
                              <v-btn
                                color="primary"
                                icon
                                v-bind="attrs"
                                v-on="on"
                              >
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
                                <v-tabs
                                  v-model="item.tabs"
                                  vertical
                                  class="mt-5"
                                >
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
                                          <p
                                            v-if="comment.data == null"
                                            class="text-center"
                                          >
                                            No comments yet
                                          </p>
                                          <v-card
                                            v-for="c in comment.data"
                                            :key="c.id"
                                            flat
                                            :class="
                                              c.cid == 0
                                                ? 'my-4 my-chat'
                                                : 'my-4 manager-chat'
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
                                        <v-card-actions>
                                          <v-textarea
                                            v-model="newComment"
                                            label="Write your comment here"
                                            outlined
                                          ></v-textarea>
                                          <div class="justify-end">
                                            <v-btn
                                              color="primary"
                                              fab
                                              @click="sendComment(item)"
                                              ><v-icon>mdi-send-outline</v-icon>
                                            </v-btn>
                                          </div>
                                        </v-card-actions>
                                      </v-card>
                                    </v-tab-item>
                                  </v-tabs-items>
                                </v-tabs>
                              </v-card-text>
                            </v-card>
                          </v-dialog>
                          <v-dialog
                            v-model="item.kpi_dialog"
                            scrollable
                            max-width="800"
                          >
                            <template v-slot:activator="{ on, attrs }">
                              <v-btn icon v-bind="attrs" v-on="on">
                                <v-icon>mdi-information-outline</v-icon>
                              </v-btn>
                            </template>

                            <v-card>
                              <v-toolbar color="primary" dark>
                                <b>{{ item.goal_title }}</b> : KPI
                                <v-spacer></v-spacer>
                                <v-btn icon @click="item.kpi_dialog = false">
                                  <v-icon>mdi-close</v-icon>
                                </v-btn>
                              </v-toolbar>

                              <v-card-text>
                                <v-card
                                  v-for="kpi in item.kpi_set"
                                  :key="kpi.id"
                                  class="my-5"
                                >
                                  <v-card-text>
                                    <p>{{ kpi.description }}</p>
                                    <small
                                      >Progress :
                                      <b>{{ kpi.progress }}</b></small
                                    >
                                  </v-card-text>
                                </v-card>
                              </v-card-text>
                            </v-card>
                          </v-dialog>
                        </div>
                      </template>

                      <template v-slot:[`item.status`]="{ item }">
                        <v-icon
                          v-if="item.status == 'APPROVED'"
                          color="success"
                        >
                          mdi-checkbox-marked-circle-outline</v-icon
                        >
                        <v-icon v-else color="info" @click="approvedGaol(item)">
                          mdi-format-list-checks</v-icon
                        >

                        <v-icon v-if="item.status == 'REJECTED'" color="error">
                          mdi-window-close</v-icon
                        >
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
                                  <th>Due</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr v-for="kpi in item.kpi_set" :key="kpi.id">
                                  <th>{{ kpi.description }}</th>
                                  <th>{{ kpi.progress }}</th>
                                  <td>{{ kpi.date_created }}</td>
                                  <td>{{ kpi.due }}</td>
                                </tr>
                              </tbody>
                            </template>
                          </v-simple-table>
                        </td>
                      </template>
                    </v-data-table>
                  </v-card-text>
                </v-card>
              </v-tab-item>

              <v-tab-item>
                <v-card flat>
                  <v-toolbar
                    elevation="0"
                    class="ma-5"
                    color="primary"
                    rounded
                    dark
                  >
                    <b>{{ name }} Core Values</b>
                    <v-spacer></v-spacer>
                  </v-toolbar>
                  <v-card-text>
                    <v-data-table
                      :headers="myValuesTableHeader"
                      :items="myValuesTableItems"
                      :items-per-page="5"
                    ></v-data-table>
                  </v-card-text>
                </v-card>
              </v-tab-item>

              <v-tab-item>
                <v-card flat>
                  <v-toolbar
                    elevation="0"
                    class="ma-5"
                    color="primary"
                    rounded
                    dark
                  >
                    <b>{{ name }} Skills</b>
                    <v-spacer></v-spacer>
                  </v-toolbar>
                  <v-card-text>
                    <v-data-table
                      :headers="mySkillsTableHeader"
                      :items="mySkillsTableItems"
                      :items-per-page="5"
                    ></v-data-table>
                  </v-card-text>
                </v-card>
              </v-tab-item>
            </v-tabs-items>
          </div>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="info darken-1" text @click="close"> Close </v-btn>
          <v-btn color="error darken-1" text @click="reject"> Reject </v-btn>
          <v-btn color="green darken-1" text @click="approved"> Approve </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: 'GoalApproved',
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
      goalsApprovedDialog: false,
      rejectionDialog: false,
      goals_settingM_rejection: '',
      tabData: null,
      current_goal: {},
      newComment: '',
      myGoalsTableHeader: [
        {
          text: 'Category',
          value: 'category',
        },
        {
          text: 'Goal Title',
          value: 'goal_title',
        },
        {
          text: 'Due',
          value: 'due',
        },
        {
          text: 'Weightage',
          value: 'weightage',
        },
        {
          text: 'Status',
          value: 'status',
        },
        {
          text: 'Action',
          align: 'center',
          value: 'actions',
        },
      ],
      myGoalsTableItems: [],
      mySkillsTableHeader: [
        {
          text: 'Skill',
          value: 'skill',
        },
        {
          text: 'Descriptions',
          value: 'description',
        },
        {
          text: 'Weightage',
          value: 'weightage',
        },
        {
          text: 'Action',
          align: 'center',
          value: 'actions',
        },
      ],
      mySkillsTableItems: [],
      myValuesTableHeader: [
        {
          text: 'Core Values Competency',
          value: 'value',
        },
        {
          text: 'Description',
          value: 'description',
        },
        {
          text: 'Weightage',
          value: 'weightage',
        },
        {
          text: 'Action',
          align: 'center',
          value: 'actions',
        },
      ],
      editable: false,
      name: 'My',

      myValuesTableItems: [],
    }
  },
  methods: {
    approvedGaol(item) {
      this.current_goal = item
      this.goalsApprovedDialog = true
    },
    init(appraisal) {
      const data = {
        name: appraisal.appraisal_name,
        category: appraisal.appraisal_category.name,
        status: appraisal.status,
        editable: false,
        completion: appraisal.completion,
        start_date: appraisal.start_date,
        end_date: appraisal.end_date,
        goals: [],
        skills: [],
        core_values: [],
      }

      appraisal.goals_set.forEach((goal) => {
        data.goals.push({
          id: goal.id,
          category: goal.goal_category.name,
          goal_title: goal.summary,
          due: goal.due,
          weightage: `${goal.weightage}%`,
          dialog: false,
          kpi_dialog: false,
          tabs: null,
          status: goal.status,
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
          kpi_set: goal.kpi_set,
        })
      })

      appraisal.skills_set.forEach((skill) => {
        data.skills.push({
          skill: skill.skill_category.name,
          description: skill.description,
          weightage: skill.weightage,
        })
      })

      appraisal.competencies_set.forEach((value) => {
        data.core_values.push({
          value: value.summary,
          description: value.description,
          weightage: value.weightage,
        })
      })

      this.myGoalsTableItems = data.goals
      this.myValuesTableItems = data.core_values
      this.mySkillsTableItems = data.skills

      this.name = `${appraisal.employee.name}'s`
    },
    close() {
      this.$emit('close-goal-approved-dialog')
    },
    approved() {
      this.$axios
        .$post(`api/approve/manager/goal/${this.appraisalId}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully Approved the goals ',
            color: 'info',
          })

          this.$emit('reload')
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error Approved goals',
            color: 'error',
          })
        })
        .finally(this.close())
    },
    reject() {
      this.rejectionDialog = true
    },
    finalReject() {
      this.$axios
        .$patch(`api/reject/manager/goal/${this.appraisalId}`, {
          goals_settingM_rejection: this.goals_settingM_rejection,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully rejected the goals ',
            color: 'info',
          })
          this.rejectionDialog = false
          this.close()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error rejection goals',
            color: 'error',
          })
        })
    },
    approvedGoal() {
      this.$axios
        .post(`api/approve/goal/${this.current_goal.id}`)
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully approved  ${this.current_goal.goal_title} the goals `,
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error approved goals',
            color: 'error',
          })
        })
        .finally(() => {
          this.goalsApprovedDialog = false
        })
    },
    rejectGoal() {
      this.$axios
        .post(`api/reject/goal/${this.current_goal.id}`)
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully rejected  ${this.current_goal.goal_title} the goals `,
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error rejection goals',
            color: 'error',
          })
        })
        .finally(() => {
          this.rejectionDialog = false
        })
    },
    sendComment(item) {
      this.$axios
        .patch(`api/goal/${item.id}`, {
          goal_manager_comment: this.newComment,
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success commenting',
            color: 'info',
          })
          this.$fetch()
          this.newComment = ''
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error commenting',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
