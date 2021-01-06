<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else>
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
        <v-tab>Rating</v-tab>
      </v-tabs>

      <v-tabs-items v-model="tabData">
        <v-tab-item>
          <v-card flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>{{ name }} Goals</b>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="myGoalsTableHeader"
                :items="myGoalsTableItems"
                :items-per-page="10"
                show-expand
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
                                      c.created_by == $auth.user.id
                                        ? 'my-4 my-chat'
                                        : 'my-4 manager-chat'
                                    "
                                    raised
                                  >
                                    <v-card-title class="subtitle-2">{{
                                      c.comment
                                    }}</v-card-title>
                                    <v-card-text
                                      v-if="c.created_by == $auth.user.id"
                                    >
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
                      <v-col>Tracking status</v-col>
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
                          background-color="grey lighten-2"
                          color="primary"
                          length="5"
                          size="30"
                          :value="item.user_rating"
                          dense
                          readonly
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
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>{{ name }} Core Values</b>
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
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
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

        <v-tab-item>
          <v-card flat>
            <v-card-text class="text-center">
              Ratings implementation coming soon
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
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
          text: 'Action',
          align: 'center',
          value: 'actions',
        },
        { text: '', value: 'data-table-expand' },
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
          category: 'Organization Effectivness',
          goal_title: goal.summary,
          due: goal.due,
          weightage: `${goal.weightage}%`,
          dialog: false,
          tabs: null,
          date_menu: false,
          comments: [
            { id: 0, date: goal.commentbox_set.reverse() },
            { id: 1, data: goal.midyrcommentbox_set.reverse() },
            { id: 2, data: goal.endyrcommentbox_set.reverse() },
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
