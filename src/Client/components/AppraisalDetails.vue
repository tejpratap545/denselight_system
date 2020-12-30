<template>
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
            <h3 class="my-5 text-center">{{name}} Goals</h3>
            <v-data-table
              :headers="myGoalsTableHeader"
              :items="myGoalsTableItems"
              :items-per-page="10"
              :loading="loading"
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
                        <v-btn @click="item.dialog = false" icon>
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
                              class="pa-5"
                              v-for="comment in item.comments"
                              :key="comment.id"
                            >
                              <div class="chat-ui">
                                <div class="chat-container">
                                  <p
                                    class="text-center"
                                    v-if="comment.data == null"
                                  >
                                    No comments yet
                                  </p>
                                  <v-card
                                    flat
                                    :class="
                                      c.created_by == $auth.user.id
                                        ? 'my-4 my-chat'
                                        : 'my-4 manager-chat'
                                    "
                                    raised
                                    v-for="c in comment.data"
                                    :key="c.id"
                                  >
                                    <v-card-title>{{ c.comment }}</v-card-title>
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
                                      @click="item.dialog = false"
                                      color="primary"
                                      fab
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
                </div>
              </template>
            </v-data-table>
          </v-card-text>
        </v-card>
      </v-tab-item>

      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <h3 class="my-5 text-center">{{name}} Core Values</h3>
            <v-data-table
              :headers="myValuesTableHeader"
              :items="myValuesTableItems"
              :items-per-page="5"
              :loading="loading"
            >
              <template v-slot:[`item.actions`]="{}">
                <div>
                  <v-btn color="success" icon
                    ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
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
            <h3 class="my-5 text-center">{{name}} Skills</h3>
            <v-data-table
              :headers="mySkillsTableHeader"
              :items="mySkillsTableItems"
              :items-per-page="5"
              :loading="loading"
            >
              <template v-slot:[`item.actions`]="{}">
                <div>
                  <v-btn color="success" icon
                    ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                  >
                </div>
              </template>
            </v-data-table>
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
</template>

<script>
export default {
  props: ['appraisalID'],
  watch: {
    appraisalID: async function (newVal, _) {
      await this.init()
    },
  },
  async fetch() {
    await this.init()
  },
  data() {
    return {
      loading: true,
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
      name: 'My',
      myValuesTableItems: [],
    }
  },
  methods: {
    async init() {
      this.loading = true

      try {
        const appraisal = await this.$axios.$get(
          `api/appraisals/detail/${this.appraisalID}`
        )

        var data = {
          name: appraisal.appraisal_name,
          category: appraisal.appraisal_category.name,
          status: appraisal.status,
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

        this.myGoalsTableItems = data.goals
        this.myValuesTableItems = data.core_values
        this.mySkillsTableHeader = data.skills

        this.name = `${appraisal.employee.name}'s`
      } catch (error) {
        console.log(error)
      }

      this.loading = false
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
  padding: 0 10px;
  margin-bottom: 10px;
  overflow-y: scroll;
}
.manager-chat {
  background: #00ca48 !important;
  color: #fff !important;
  width: 350px;
  float: left;
  border-radius: 20px !important;
}
</style>
