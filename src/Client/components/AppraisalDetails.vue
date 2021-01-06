<template>
  <div>
    <div class="dialogs">
      <AddGoal
        v-if="addGoalsDialog"
        :dialog="addGoalsDialog"
        :appraisal-id="appraisal.id"
        @close-goal-dialog="addGoalsDialog = false"
      />
      <AddCoreValue
        v-if="addCoreValueDialog"
        :dialog="addCoreValueDialog"
        :appraisal-id="appraisal.id"
        @close-core-dialog="addCoreValueDialog = false"
      />
      <AddSkills
        v-if="addSkillsDialog"
        :dialog="addSkillsDialog"
        :appraisal-id="appraisal.id"
        @close-skills-dialog="addSkillsDialog = false"
      />
    </div>
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
          <v-card class="pt-5" flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>Departmental Goals</b>
              <v-spacer></v-spacer>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="departmentGoalsHeader"
                :items="departmentGoalsItems"
                :items-per-page="5"
              ></v-data-table>
            </v-card-text>
          </v-card>
          <v-card flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>{{ name }} Goals</b>
              <v-spacer></v-spacer>

              <v-btn
                v-if="
                  editable &&
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                icon
                @click="addGoalsDialog = true"
              >
                <v-icon>mdi-plus</v-icon>
              </v-btn>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="myGoalsTableHeader"
                :items="myGoalsTableItems"
                :items-per-page="10"
                show-expand
              >
                <template v-slot:[`item.status`]="{ item }">
                  <v-icon v-if="item.status == 'APPROVED'" color="success">
                    mdi-checkbox-marked-circle-outline</v-icon
                  >

                  <v-icon v-else-if="item.status == 'REJECTED'" color="error">
                    mdi-window-close</v-icon
                  >
                  <v-icon v-else indeterminate color="primary"
                    >mdi-account-clock</v-icon
                  >
                </template>
                <template v-slot:[`item.actions`]="{ item }">
                  <div>
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
                                >Progress : <b>{{ kpi.progress }}</b></small
                              >
                            </v-card-text>
                          </v-card>
                        </v-card-text>

                        <v-card-actions>
                          <v-container>
                            <v-row>
                              <v-text-field
                                v-model="kpi"
                                label="KPI description"
                              ></v-text-field>
                            </v-row>

                            <v-row>
                              <v-menu
                                v-model="item.date_menu"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                transition="scale-transition"
                                offset-y
                                min-width="290px"
                              >
                                <template v-slot:activator="{ on, attrs }">
                                  <v-text-field
                                    v-model="kpi_date"
                                    label="KPI due"
                                    prepend-icon="mdi-calendar"
                                    readonly
                                    v-bind="attrs"
                                    v-on="on"
                                  ></v-text-field>
                                </template>
                                <v-date-picker
                                  v-model="kpi_date"
                                  @input="item.date_menu = false"
                                ></v-date-picker>
                              </v-menu>
                              <v-btn color="primary" @click="add_kpi(item)">
                                Add new KPI
                              </v-btn>
                            </v-row>
                          </v-container>
                        </v-card-actions>
                      </v-card>
                    </v-dialog>

                    <span
                      v-if="
                        appraisal.overall_appraisal.status == 'Stage 1' &&
                        appraisal.status == 'Employee'
                      "
                    >
                      <GoalRemove :id="item.id" @close-delete-dialog="reload" />
                    </span>
                  </div>
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
          <v-card class="pt-5" flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>Departmental Core Values</b>
              <v-spacer></v-spacer>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="departmentValuesHeader"
                :items="departmentValuesItems"
                :items-per-page="5"
              ></v-data-table>
            </v-card-text>
          </v-card>
          <v-card flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>{{ name }} Core Values</b>
              <v-spacer></v-spacer>
              <v-btn
                v-if="
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                icon
                @click="addCoreValueDialog = true"
              >
                <v-icon>mdi-plus</v-icon>
              </v-btn>
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

              <v-btn
                v-if="
                  editable &&
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                icon
                @click="addSkillsDialog = true"
              >
                <v-icon>mdi-plus</v-icon>
              </v-btn>
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
  props: ['appraisal'],
  data() {
    return {
      newcomment: {
        comment: '',
        goal: 0,
        created_by: this.$auth.user.id,
      },
      addGoalsDialog: false,
      addSkillsDialog: false,
      addCoreValueDialog: false,
      tabData: null,
      myGoalsTableHeader: [
        {
          text: 'Category',
          value: 'category',
        },
        {
          text: 'Description',
          value: 'description',
        },
        {
          text: 'Goal Title',
          value: 'goal_title',
        },
        {
          text: 'Status',
          value: 'status',
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
      ],
      editable: this.appraisal.employee.email == this.$auth.user.email,
      name: 'My',
      kpi: '',
      kpi_date: '',
      myValuesTableItems: [],

      departmentGoalsHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Due date', value: 'due' },
        { text: 'Category', value: 'goal_category' },
      ],
      departmentGoalsItems: this.appraisal.departmentalgoals_set,
      departmentValuesHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Category', value: 'competency_category' },
      ],
      departmentValuesItems: this.appraisal.departmentalcompetencies_set,
    }
  },
  watch: {
    appraisal(newVal, _) {
      this.init(newVal)
    },
  },
  mounted() {
    this.init(this.appraisal)
  },
  methods: {
    init(appraisal) {
      const data = {
        name: appraisal.appraisal_name,
        category: appraisal.appraisal_category.name,
        status: appraisal.status,
        editable: appraisal.employee.email == this.$auth.user.email,
        completion: appraisal.completion,
        overall_appraisal_status: appraisal.overall_appraisal.status,
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
    async add_kpi(goal) {
      try {
        const data = {
          description: this.kpi,
          goal: goal.id,
          due: this.kpi_date,
        }

        const appraisal = await this.$axios.$post(`api/KPI/create`, data)

        goal.kpi_dialog = false
        await this.init()
      } catch (error) {
        console.log(error)
      }
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
      this.$emit('reload-mainvue')
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
