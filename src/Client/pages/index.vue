<template>
  <div class="pa-5">
    <div class="d-flex justify-lg-space-between align-center">
      <v-menu rounded="lg">
        <template v-slot:activator="{ on, attrs }">
          <v-btn elevation="0" color="primary" v-bind="attrs" v-on="on">
            Change Appraisal
          </v-btn>
        </template>

        <v-list>
          <v-list-item v-for="(x, y) in appraisalData" :key="y" link>
            <v-list-item-title @click="changeAppraisal(y)">
              {{ x.name }}
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>

      <div v-if="appraisalData.length != 0">
        <h3 class="font-weight-medium">
          {{ appraisalData[appraisalSelected].name }} -
          {{ appraisalData[appraisalSelected].category }}
        </h3>
        <p class="ma-0">
          Status:
          {{
            getStatus(
              appraisalData[appraisalSelected].overallAppraisal.status,
              appraisalData[appraisalSelected].status
            )
          }}
        </p>
      </div>
      <div v-else>
        <h3 class="font-weight-medium">No Appraisal selected</h3>
      </div>
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
          <v-card flat>
            <v-card-text>
              <h3 class="my-5 text-center">My Goals</h3>
              <v-data-table
                :headers="myGoalsTableHeader"
                :items="myGoalsTableItems"
                :items-per-page="10"
              >
                <template v-slot:[`item.actions`]="{ item }">
                  <div>
                    <v-dialog v-model="item.dialog" max-width="800">
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn color="primary" icon v-bind="attrs" v-on="on">
                          <v-icon>mdi-chat-outline</v-icon>
                        </v-btn>
                      </template>

                      <v-card>
                        <v-toolbar color="primary" dark>
                          <b>{{ item.goal_title }}</b> : Comments
                          <v-spacer></v-spacer>
                          <v-btn flat icon @click="item.dialog = false">
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
                                <div class="chat-ui">
                                  <div class="chat-container">
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
                                      <v-card-title>{{
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
                                  </div>
                                  <div>
                                    <v-textarea
                                      solo
                                      name="input-7-4"
                                      label="Write your comment here"
                                    ></v-textarea>
                                    <v-card-actions class="justify-end">
                                      <v-btn
                                        color="primary"
                                        fab
                                        @click="item.dialog = false"
                                        ><v-icon>mdi-send-outline</v-icon>
                                      </v-btn>
                                    </v-card-actions>
                                  </div>
                                </div>
                              </v-tab-item>
                            </v-tabs-items>
                          </v-tabs>
                        </v-card-text>
                      </v-card>
                    </v-dialog>

                    <v-btn color="success" icon>
                      <v-icon>mdi-circle-edit-outline</v-icon>
                    </v-btn>
                    <v-btn color="error" icon>
                      <v-icon>mdi-delete-outline</v-icon>
                    </v-btn>
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <h3 class="my-5 text-center">My Core Values</h3>
              <v-data-table
                :headers="myValuesTableHeader"
                :items="myValuesTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{}">
                  <div>
                    <v-btn color="success" icon
                      ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                    >
                    <v-btn color="error" icon
                      ><v-icon>mdi-delete-outline</v-icon></v-btn
                    >
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <h3 class="my-5 text-center">My Skills</h3>
              <v-data-table
                :headers="mySkillsTableHeader"
                :items="mySkillsTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{}">
                  <div>
                    <v-btn color="success" icon
                      ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                    >
                    <v-btn color="error" icon
                      ><v-icon>mdi-delete-outline</v-icon></v-btn
                    >
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text> Fourth </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
</template>

<script>
export default {
  title: 'Dashboard',
  layout: 'dashboard-template',
  async fetch() {
    try {
      const response = await this.$axios.$get('api/appraisals/list/detail/me')

      response.forEach((appraisal) => {
        const data = {
          name: appraisal.appraisal_name,
          category: appraisal.appraisal_category.name,
          status: appraisal.status,
          overallAppraisal: appraisal.overall_appraisal,
          completion: appraisal.completion,
          start_date: appraisal.start_date,
          end_date: appraisal.end_date,
          goals: [],
          skills: [],
          core_values: [],
        }

        appraisal.goals_set.forEach((goal) => {
          data.goals.push({
            category: 'Organization Effectivness',
            goal_title: goal.summary,
            due: goal.due,
            weightage: `${goal.weightage}%`,
            dialog: false,
            tabs: null,
            comments: [
              { id: 0, date: goal.commentbox_set.reverse() },
              { id: 1, data: goal.midyrcommentbox_set.reverse() },
              { id: 2, data: goal.endyrcommentbox_set.reverse() },
            ],
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

        this.appraisalData.push(data)
      })

      this.changeAppraisal(0)
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tabData: null,
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
      myValuesTableItems: [],
      appraisalData: [],
      appraisalSelected: 0,
    }
  },
  computed: {},
  methods: {
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.myGoalsTableItems = this.appraisalData[this.appraisalSelected].goals
      this.mySkillsTableItems = this.appraisalData[
        this.appraisalSelected
      ].skills
      this.myValuesTableItems = this.appraisalData[
        this.appraisalSelected
      ].core_values
    },
    getStatus(overallAppraisalStatus, appraisalStatus) {
      if (overallAppraisalStatus === 'Stage 1') {
        return 'Goals Setting Stage'
      } else if (overallAppraisalStatus === 'Stage 1B') {
        return 'Mid Year Assessment: Pending Manager/Supervisor'
      } else if (
        overallAppraisalStatus === 'Stage 2' &&
        appraisalStatus === 'S2Employee'
      ) {
        return 'End Year Assessment: My Rating Stage'
      } else if (
        overallAppraisalStatus === 'Stage 2' &&
        appraisalStatus === 'S2Manager'
      ) {
        return 'End Year Assessment: Manager/Supervisor Rating Stage'
      } else if (
        overallAppraisalStatus === 'Stage 2' &&
        appraisalStatus === 'Approved'
      ) {
        return 'End Year Assessment: Board Rating Stage'
      } else if (overallAppraisalStatus === 'Stage 3') {
        return 'End Year Assessment: Reports Stage'
      } else if (overallAppraisalStatus === 'Stage 4') {
        return 'End Year Assessment: Calibration Stage'
      } else {
        return 'Unknown Status'
      }
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
  min-height: 300px;
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
