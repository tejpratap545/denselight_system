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
            <h3 class="my-5 text-center">{{ name }} Goals</h3>
            <v-data-table
              :headers="myGoalsTableHeader"
              :items="myGoalsTableItems"
              :items-per-page="10"
              :loading="loading"
            >
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
                              <v-card flat class="chat-ui">
                                <v-card-text class="chat-container">
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
                                    <v-card-title class="subtitle-2">{{ c.comment }}</v-card-title>
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
                                    label="Write your comment here"
                                    flat
                                  ></v-textarea>
                                  <div class="justify-end">
                                    <v-btn
                                      @click="item.dialog = false"
                                      color="primary"
                                      fab
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
                        <v-btn @click="item.kpi_dialog = false" icon>
                          <v-icon>mdi-close</v-icon>
                        </v-btn>
                      </v-toolbar>

                      <v-card-text>
                        <v-card
                          class="my-5"
                          v-for="kpi in item.kpi_set"
                          :key="kpi.id"
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
                          <v-btn color="primary" @click="add_kpi(item)"> Add new KPI </v-btn>
                        </v-row>
                        </v-container>
                      </v-card-actions>
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
            <h3 class="my-5 text-center">{{ name }} Core Values</h3>
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
            <h3 class="my-5 text-center">{{ name }} Skills</h3>
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
      kpi: '',
      kpi_date: '',
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
            id: goal.id,
            category: 'Organization Effectivness',
            goal_title: goal.summary,
            due: goal.due,
            weightage: `${goal.weightage}%`,
            dialog: false,
            kpi_dialog: false,
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
        this.mySkillsTableHeader = data.skills

        this.name = `${appraisal.employee.name}'s`
      } catch (error) {
        console.log(error)
      }

      this.loading = false
    },
    async add_kpi(goal) {
       try {
        var data = {
          description: this.description,
          goal: goal.id,
          due: this.kpi_date
        }

        const appraisal = await this.$axios.$post(
          `api/KPI/create`,
          data
        )

        goal.kpi_dialog = false
        await this.init()
      } catch (error) {
        console.log(error)
      }
    }
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
