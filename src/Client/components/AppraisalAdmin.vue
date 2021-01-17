<template>
  <v-dialog
    v-model="dialog"
    fullscreen
    hide-overlay
    transition="dialog-bottom-transition"
  >
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="px-10 my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-dialog v-model="goalsApprovedDialog" persistent max-width="500">
        <v-card>
          <v-card-title class="subtitle">
            Approved Or Reject {{ currentGoal.goal_title }}
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
              Approved
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-toolbar dark color="primary">
        <v-btn icon dark @click="$emit('close')">
          <v-icon>mdi-close</v-icon>
        </v-btn>
        <v-toolbar-title> {{ appraisal.appraisal_name }}</v-toolbar-title>
        <v-spacer></v-spacer>
      </v-toolbar>

      <v-card-text>
        <v-simple-table dense class="my-5">
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

        <div class="dialogs">
          <AddGoal
            v-if="addGoalsDialog"
            :dialog="addGoalsDialog"
            :appraisal-id="appraisal.id"
            is-admin="true"
            @close-goal-dialog="addGoalsDialog = false"
            @reload="appraisalFetch"
          />
          <AddCoreValue
            v-if="addCoreValueDialog"
            :dialog="addCoreValueDialog"
            :appraisal-id="appraisal.id"
            is-admin="true"
            @close-core-dialog="addCoreValueDialog = false"
            @reload="appraisalFetch"
          />
          <AddSkills
            v-if="addSkillsDialog"
            :dialog="addSkillsDialog"
            :appraisal-id="appraisal.id"
            is-admin="true"
            @close-skills-dialog="addSkillsDialog = false"
            @reload="appraisalFetch"
          />
          <AdminEditGoal
            v-if="updateGoalsDialog"
            :dialog="updateGoalsDialog"
            :goal="currentGoal"
            @close="updateGoalsDialog = false"
            @reload="appraisalFetch"
          />
          <AdminEditCoreValue
            v-if="updateCoreValueDialog"
            :dialog="updateCoreValueDialog"
            :core-value="currentCoreValue"
            @close="updateCoreValueDialog = false"
            @reload="appraisalFetch"
          />
          <AdminEditSkills
            v-if="updateSkillsDialog"
            :dialog="updateSkillsDialog"
            :skill="currentSkill"
            @close="updateSkillsDialog = false"
            @reload="appraisalFetch"
          />
        </div>
        <div class="ma-5">
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
                <v-toolbar
                  elevation="0"
                  class="ma-5"
                  color="primary"
                  rounded
                  dark
                >
                  <b>Departmental Goals</b>
                  <v-spacer></v-spacer>
                </v-toolbar>
                <v-card-text>
                  <v-data-table
                    :headers="departmentGoalsHeader"
                    :items="departmentGoalsItems"
                    :items-per-page="5"
                    dense
                  ></v-data-table>
                </v-card-text>
              </v-card>
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

                  <v-btn icon @click="addGoalsDialog = true">
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </v-toolbar>
                <v-card-text>
                  <v-data-table
                    :headers="myGoalsTableHeader"
                    :items="myGoalsTableItems"
                    :items-per-page="10"
                    show-expand
                    dense
                  >
                    <template v-slot:[`item.status`]="{ item }">
                      <v-icon v-if="item.status == 'APPROVED'" color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >

                      <v-icon
                        v-else-if="item.status == 'REJECTED'"
                        color="error"
                      >
                        mdi-window-close</v-icon
                      >
                      <v-icon v-else indeterminate color="primary"
                        >mdi-account-clock</v-icon
                      >
                      <v-icon color="info" @click="changeStatus(item)">
                        mdi-format-list-checks</v-icon
                      >
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
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
                                <v-spacer></v-spacer>
                                <v-dialog v-model="dialogKpiDelete" width="500">
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      color="red lighten-2"
                                      dark
                                      v-bind="attrs"
                                      text
                                      v-on="on"
                                    >
                                      <v-icon>mdi-close</v-icon>
                                    </v-btn>
                                  </template>

                                  <v-card>
                                    <v-card-title class="subtitle-2">
                                      {{ kpi.description }}
                                    </v-card-title>
                                    <v-divider></v-divider>

                                    <v-card-actions>
                                      <v-spacer></v-spacer>
                                      <v-btn
                                        color="info"
                                        text
                                        @click="dialogKpiDelete = false"
                                      >
                                        Close
                                      </v-btn>
                                      <v-btn
                                        color="error"
                                        text
                                        @click="deleteKpi(kpi)"
                                      >
                                        Delete
                                      </v-btn>
                                    </v-card-actions>
                                  </v-card>
                                </v-dialog>
                                <v-dialog v-model="dialogKpiUpdate" width="500">
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      color="success lighten-2"
                                      dark
                                      v-bind="attrs"
                                      text
                                      v-on="on"
                                    >
                                      <v-icon>mdi-pencil</v-icon>
                                    </v-btn>
                                  </template>

                                  <v-card>
                                    <v-card-title>Update Kpi</v-card-title>
                                    <v-card-text class="ma-3">
                                      <v-row>
                                        <v-textarea
                                          v-model="kpi.description"
                                          outlined
                                          label="KPI description"
                                        ></v-textarea>
                                      </v-row>

                                      <v-row>
                                        <v-menu
                                          v-model="kpiDateMenu"
                                          :close-on-content-click="false"
                                          :nudge-right="40"
                                          transition="scale-transition"
                                          offset-y
                                          min-width="290px"
                                        >
                                          <template
                                            v-slot:activator="{ on, attrs }"
                                          >
                                            <v-text-field
                                              v-model="kpi.due"
                                              label="KPI due"
                                              prepend-icon="mdi-calendar"
                                              readonly
                                              v-bind="attrs"
                                              v-on="on"
                                            ></v-text-field>
                                          </template>
                                          <v-date-picker
                                            v-model="kpi.due"
                                            @input="kpiDateMenu = false"
                                          ></v-date-picker>
                                        </v-menu>
                                      </v-row>
                                    </v-card-text>
                                    <v-divider></v-divider>

                                    <v-card-actions>
                                      <v-spacer></v-spacer>
                                      <v-btn
                                        color="info"
                                        text
                                        @click="dialogKpiUpdate = false"
                                      >
                                        Close
                                      </v-btn>
                                      <v-btn
                                        color="success"
                                        text
                                        @click="updateKpi(kpi)"
                                      >
                                        Update
                                      </v-btn>
                                    </v-card-actions>
                                  </v-card>
                                </v-dialog>
                              </v-card-text>
                            </v-card>
                          </v-card-text>

                          <v-card-actions>
                            <v-container>
                              <v-row>
                                <v-textarea
                                  v-model="kpi"
                                  outlined
                                  label="KPI description"
                                ></v-textarea>
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
                      <v-icon small class="mr-2" @click="editGoal(item)">
                        mdi-pencil
                      </v-icon>

                      <GoalRemove
                        :id="item.id"
                        @close-delete-dialog="appraisalFetch"
                      />
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
                          <v-col> Goal Setting Stage Employee comments </v-col>
                          <v-col>
                            {{ item.goal_employees_comment }}
                          </v-col>
                        </v-row>
                        <v-row>
                          <v-col> Goal Setting Stage Manager comments </v-col>
                          <v-col>
                            {{ item.goal_manager_comment }}
                          </v-col>
                        </v-row>
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
                          <v-col> Mid year manager comments </v-col>
                          <v-col>
                            {{ item.MID_manager_comments }}
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
                            ></v-rating>
                            <br />
                            {{ ratingName(item.user_rating) }}</v-col
                          >
                        </v-row>
                        <v-row>
                          <v-col>End Year Employee Comment</v-col>
                          <v-col>
                            {{ item.user_comments }}
                          </v-col>
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
                </v-card-text>
              </v-card>
            </v-tab-item>

            <v-tab-item>
              <v-card class="pt-5" flat>
                <v-toolbar
                  elevation="0"
                  class="ma-5"
                  color="primary"
                  rounded
                  dark
                >
                  <b>Departmental Core Values</b>
                  <v-spacer></v-spacer>
                </v-toolbar>
                <v-card-text>
                  <v-data-table
                    :headers="departmentValuesHeader"
                    :items="departmentValuesItems"
                    :items-per-page="5"
                    dense
                  ></v-data-table>
                </v-card-text>
              </v-card>
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
                  <v-btn icon @click="addCoreValueDialog = true">
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </v-toolbar>
                <v-card-text>
                  <v-data-table
                    :headers="myValuesTableHeader"
                    :items="myValuesTableItems"
                    :items-per-page="5"
                    dense
                  >
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-icon small class="mr-2" @click="editCoreValue(item)">
                        mdi-pencil
                      </v-icon>
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
                  <b>{{ name }} Skills</b>
                  <v-spacer></v-spacer>

                  <v-btn icon @click="addSkillsDialog = true">
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </v-toolbar>
                <v-card-text>
                  <v-data-table
                    :headers="mySkillsTableHeader"
                    :items="mySkillsTableItems"
                    :items-per-page="5"
                    dense
                  >
                    >
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-icon small class="mr-2" @click="editSkill(item)">
                        mdi-pencil
                      </v-icon>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs-items>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import global from '~/mixins/global'

export default {
  name: 'AppraisalAdminVue',

  mixins: [global],

  props: { appraisalId: Number, dialog: Boolean },
  async fetch() {
    await this.appraisalFetch()
  },
  data() {
    return {
      kpiDateMenu: false,
      goalsApprovedDialog: false,
      dialogKpiDelete: false,
      dialogKpiUpdate: false,
      currentGoal: {},
      currentCoreValue: {},
      currentSkill: {},
      newComment: '',
      appraisal: {},
      changeStatusDialog: false,
      addGoalsDialog: false,
      addSkillsDialog: false,
      addCoreValueDialog: false,
      updateGoalsDialog: false,
      updateCoreValueDialog: false,
      updateSkillsDialog: false,
      tabData: null,
      myGoalsTableHeader: [
        {
          text: 'Category',
          value: 'category.name',
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
      editable: true,
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
      departmentGoalsItems: {},
      departmentValuesHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Category', value: 'competency_category' },
      ],
      departmentValuesItems: {},
      currentAppraisal: '',
    }
  },

  methods: {
    async appraisalFetch() {
      await this.$axios
        .$get(`api/appraisals/detail/${this.appraisalId}`)
        .then((res) => {
          this.init(res)
        })
    },
    init(appraisal) {
      this.appraisal = appraisal

      this.departmentGoalsItems =
        appraisal.overall_appraisal.departmentalgoals_set
      this.departmentValuesItems =
        appraisal.overall_appraisal.departmentalcompetencies_set

      this.editable = appraisal.employee.email == this.$auth.user.email

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
          category: goal.goal_category,
          goal_title: goal.summary,
          description: goal.description,
          due: goal.due,
          status: goal.status,
          weightage: `${goal.weightage}%`,
          weightage1: goal.weightage,
          dialog: false,
          kpi_dialog: false,
          tabs: null,
          date_menu: false,

          kpi_set: goal.kpi_set,
          tracking_status: goal.tracking_status,
          goal_manager_comment: goal.goal_manager_comment,
          goal_employees_comment: goal.goal_employees_comment,
          MID_user_comments: goal.MID_user_comments,
          MID_manager_comments: goal.MID_manager_comments,
          user_rating: goal.user_rating,
          manager_rating: goal.manager_rating,
          user_comments: goal.user_comments,
          manager_comments: goal.manager_comments,
        })
      })

      appraisal.skills_set.forEach((skill) => {
        data.skills.push({
          id: skill.id,
          skill_category: skill.skill_category,
          skill: skill.skill_category.name,
          description: skill.description,
          weightage: skill.weightage,
        })
      })

      appraisal.competencies_set.forEach((value) => {
        data.core_values.push({
          id: value.id,
          value: value.summary,
          competency_category: value.competency_category,
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
        this.kpi = ''
        goal.kpi_dialog = false
        this.$fetch()
      } catch (error) {
        console.log(error)
      }
    },

    editGoal(goal) {
      this.currentGoal = goal
      this.updateGoalsDialog = true
    },
    editCoreValue(coreValue) {
      this.currentCoreValue = coreValue
      this.updateCoreValueDialog = true
    },
    editSkill(skill) {
      this.currentSkill = skill
      this.updateSkillsDialog = true
    },
    changeStatus(goal) {
      this.goalsApprovedDialog = true
      this.currentGoal = goal
    },

    approvedGoal() {
      this.$axios
        .patch(`api/goal/${this.currentGoal.id}`, { status: 'APPROVED' })
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully approved  ${this.currentGoal.goal_title} the goals `,
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
        .patch(`api/goal/${this.currentGoal.id}`, { status: 'REJECTED' })
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully rejected  ${this.currentGoal.goal_title} the goals `,
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
          this.goalsApprovedDialog = false
        })
    },

    deleteKpi(kpi) {
      this.$axios
        .delete(`api/KPI/${kpi.id}`)
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully deleted  kpi `,
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error deleting kpi',
            color: 'error',
          })
        })
        .finally(() => {
          this.dialogKpiDelete = false
        })
    },
    updateKpi(kpi) {
      this.$axios
        .patch(`api/KPI/${kpi.id}`, {
          description: kpi.description,
          due: kpi.due,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully updating  kpi `,
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error updating kpi',
            color: 'error',
          })
        })
        .finally(() => {
          this.dialogKpiUpdate = false
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
