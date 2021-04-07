<template>
  <div>
    <div class="dialogs">
      <AddGoal
        v-if="addGoalsDialog"
        :dialog="addGoalsDialog"
        :appraisal-id="appraisal.id"
        @close-goal-dialog="addGoalsDialog = false"
        @reload="reload"
      />
      <AddCoreValue
        v-if="addCoreValueDialog"
        :dialog="addCoreValueDialog"
        :appraisal-id="appraisal.id"
        @close-core-dialog="addCoreValueDialog = false"
        @reload="reload"
      />
      <AddSkills
        v-if="addSkillsDialog"
        :dialog="addSkillsDialog"
        :appraisal-id="appraisal.id"
        @close-skills-dialog="addSkillsDialog = false"
        @reload="reload"
      />
      <AdminEditGoal
        v-if="updateGoalsDialog"
        :dialog="updateGoalsDialog"
        :goal="currentGoal"
        @close="updateGoalsDialog = false"
        @reload="reload"
      />
      <AdminEditCoreValue
        v-if="updateCoreValueDialog"
        :dialog="updateCoreValueDialog"
        :core-value="currentCoreValue"
        @close="updateCoreValueDialog = false"
        @reload="reload"
      />
      <AdminEditSkills
        v-if="updateSkillsDialog"
        :dialog="updateSkillsDialog"
        :skill="currentSkill"
        @close="updateSkillsDialog = false"
        @reload="reload"
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
        <v-tab>Overall Rating</v-tab>
        <v-tab>Career Aspirations</v-tab>
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

              <v-tooltip
                v-if="
                  editable &&
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                bottom
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    v-if="
                      editable &&
                      appraisal.overall_appraisal.status == 'Stage 1' &&
                      appraisal.status == 'Employee'
                    "
                    icon
                    v-bind="attrs"
                    @click="addGoalsDialog = true"
                    v-on="on"
                  >
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </template>
                <span>Add Goals</span>
              </v-tooltip>
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
                      <template
                        v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                      >
                        <v-tooltip bottom>
                          <template
                            v-slot:activator="{
                              on: tooltip,
                              attrs: tooltipattrs,
                            }"
                          >
                            <v-btn
                              color="primary"
                              icon
                              v-bind="{ ...dialogattrs, ...tooltipattrs }"
                              v-on="{ ...dialogon, ...tooltip }"
                            >
                              <v-icon>mdi-chat-outline</v-icon>
                            </v-btn>
                          </template>
                          <span>Edit Comments</span>
                        </v-tooltip>
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
                                    <v-card
                                      v-for="c in comment.data"
                                      :key="c.cid"
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

                                  <v-card-actions
                                    v-if="checkCommentDisable(comment.id)"
                                  >
                                    <v-textarea
                                      v-model="newComment"
                                      label="Write your comment here"
                                      outlined
                                    ></v-textarea>
                                  </v-card-actions>
                                  <div>
                                    <v-btn
                                      v-if="checkCommentDisable(comment.id)"
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
                        <v-btn color="success" text v-bind="attrs" v-on="on">
                          <span
                            v-if="
                              appraisal.overall_appraisal.status == 'Stage 1' &&
                              appraisal.status == 'Employee'
                            "
                          >
                            Add KPI</span
                          >
                          <span v-else> View KPI </span>
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
                              <p>
                                {{ kpi.description }}
                              </p>

                              <v-select
                                v-model="kpi.progress"
                                :items="['Working', 'Completed']"
                                label="Progress"
                                outlined
                                @change="update_kpi(kpi.id, kpi.progress)"
                              ></v-select>

                              <small
                                >Due : <b>{{ kpi.due }}</b></small
                              >
                            </v-card-text>
                          </v-card>
                        </v-card-text>

                        <v-card-actions
                          v-if="
                            appraisal.overall_appraisal.status == 'Stage 1' &&
                            appraisal.status == 'Employee'
                          "
                        >
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
                                Save KPI
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
                      <v-tooltip bottom>
                        <template v-slot:activator="{ on, attrs }">
                          <v-icon
                            small
                            v-bind="attrs"
                            class="mr-2"
                            v-on="on"
                            @click="editGoal(item)"
                          >
                            mdi-pencil
                          </v-icon>
                        </template>
                        <span>Edit Goal</span>
                      </v-tooltip>

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
                            <th>Due</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="kpi in item.kpi_set" :key="kpi.id">
                            <th>{{ kpi.description }}</th>
                            <th>{{ kpi.progress }}</th>
                            <th>{{ kpi.date_created }}</th>
                            <td>{{ kpi.due }}</td>
                          </tr>
                        </tbody>
                      </template>
                    </v-simple-table>
                    <v-row>
                      <v-col> Goal Settings Stage Employee comments </v-col>
                      <v-col>
                        {{ item.goal_employees_comment || 'NIL' }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col> Goal Settings Stage Manager comments </v-col>
                      <v-col>
                        {{ item.goal_manager_comment || 'NIL' }}
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
                        {{ item.MID_user_comments || 'NIL' }}
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col> Mid year manager comments </v-col>
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
              <div>
                <v-row>
                  <v-col>Moderation commitee Comment</v-col>
                  <v-col>
                    {{ appraisal.board_comments }}
                  </v-col>
                </v-row>

                <v-row>
                  <v-col>Moderation commitee Rating(Final)</v-col>
                  <v-col>
                    {{ ratingName(appraisal.board_rating) }}
                  </v-col>
                </v-row>
              </div>
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

              <v-tooltip
                v-if="
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                bottom
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    v-if="
                      appraisal.overall_appraisal.status == 'Stage 1' &&
                      appraisal.status == 'Employee'
                    "
                    icon
                    v-bind="attrs"
                    @click="addCoreValueDialog = true"
                    v-on="on"
                  >
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </template>
                <span>Add Core Value</span>
              </v-tooltip>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="myValuesTableHeader"
                :items="myValuesTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{ item }">
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-icon
                        small
                        v-bind="attrs"
                        class="mr-2"
                        v-on="on"
                        @click="editCoreValue(item)"
                      >
                        mdi-pencil
                      </v-icon>
                    </template>
                    <span>Edit Core Value</span>
                  </v-tooltip>

                  <v-dialog
                    v-model="skillDeleteDialog"
                    persistent
                    max-width="400"
                  >
                    <template
                      v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                    >
                      <v-tooltip bottom>
                        <template
                          v-slot:activator="{
                            on: tooltip,
                            attrs: tooltipattrs,
                          }"
                        >
                          <v-btn
                            color="error"
                            dark
                            icon
                            v-bind="{ ...dialogattrs, ...tooltipattrs }"
                            v-on="{ ...dialogon, ...tooltip }"
                          >
                            <v-icon>mdi-close</v-icon>
                          </v-btn>
                        </template>
                        <span>Delete Core Value </span>
                      </v-tooltip>
                    </template>
                    <v-card>
                      <v-card-title class="headline">
                        <span class="subtitle"> Do You want to delete </span>
                        {{ item.summary }} ?
                      </v-card-title>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn text @click="skillDeleteDialog = false">
                          Cancel
                        </v-btn>
                        <v-btn
                          color="green darken-1"
                          text
                          @click="
                            skillDeleteDialog = false
                            deleteCoreValue(item.id)
                          "
                        >
                          OK
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </template>
              </v-data-table>

              <div v-if="myValuesTableItems.length != 0">
                <v-row class="ml-2">
                  <v-col><b>Employee's comment</b></v-col>
                  <v-col>{{ myValuesTableItems[0].user_comments }}</v-col>
                </v-row>
                <v-row class="ml-2">
                  <v-col><b>Manager's comment</b></v-col>
                  <v-col>{{ myValuesTableItems[0].manager_comments }}</v-col>
                </v-row>
              </div>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
              <b>{{ name }} Skills</b>
              <v-spacer></v-spacer>

              <v-tooltip
                v-if="
                  editable &&
                  appraisal.overall_appraisal.status == 'Stage 1' &&
                  appraisal.status == 'Employee'
                "
                bottom
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    v-if="
                      editable &&
                      appraisal.overall_appraisal.status == 'Stage 1' &&
                      appraisal.status == 'Employee'
                    "
                    icon
                    v-bind="attrs"
                    v-on="on"
                    @click="addSkillsDialog = true"
                  >
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
                </template>
                <span>Add Skills</span>
              </v-tooltip>
            </v-toolbar>
            <v-card-text>
              <v-data-table
                :headers="mySkillsTableHeader"
                :items="mySkillsTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{ item }">
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-icon
                        small
                        v-bind="attrs"
                        class="mr-2"
                        v-on="on"
                        @click="editSkill(item)"
                      >
                        mdi-pencil
                      </v-icon>
                    </template>
                    <span>Edit Skill</span>
                  </v-tooltip>

                  <v-dialog
                    v-model="skillDeleteDialog"
                    persistent
                    max-width="500"
                  >
                    <template
                      v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                    >
                      <v-tooltip bottom>
                        <template
                          v-slot:activator="{
                            on: tooltip,
                            attrs: tooltipattrs,
                          }"
                        >
                          <v-btn
                            color="error"
                            dark
                            icon
                            v-bind="{ ...dialogattrs, ...tooltipattrs }"
                            v-on="{ ...dialogon, ...tooltip }"
                          >
                            <v-icon>mdi-close</v-icon>
                          </v-btn>
                        </template>
                        <span>Delete Skills </span>
                      </v-tooltip>
                    </template>
                    <v-card>
                      <v-card-title class="headline">
                        <span class="subtitle"> Do You want to delete </span>
                        {{ item.skill }} ?
                      </v-card-title>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn text @click="skillDeleteDialog = false">
                          Cancel
                        </v-btn>
                        <v-btn
                          color="green darken-1"
                          text
                          @click="
                            skillDeleteDialog = false
                            deleteSkill(item.id)
                          "
                        >
                          OK
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
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
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text class="text-center">
              <v-row>
                <v-col class="body-1"
                  >Where do you want to be in 2 years?</v-col
                >
                <v-col>
                  <v-textarea
                    v-model="appraisal.career_aspiration_employee"
                    label="  Comment"
                    outlined
                  >
                  </v-textarea>
                </v-col>
                <v-col>
                  {{ appraisal.career_aspiration_manager }}
                </v-col>
              </v-row>
            </v-card-text>
            <v-card-actions
              ><v-spacer></v-spacer>

              <v-btn text color="success" @click="submitCareerAspiration">
                Submit
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
</template>

<script>
import global from '~/mixins/global'
export default {
  mixins: [global],
  props: ['appraisal'],
  data() {
    return {
      careerAspiration: '',
      newComment: '',

      addGoalsDialog: false,
      addSkillsDialog: false,
      addCoreValueDialog: false,
      skillDeleteDialog: false,
      updateGoalsDialog: false,
      updateCoreValueDialog: false,
      updateSkillsDialog: false,
      currentGoal: {},
      currentCoreValue: {},
      currentSkill: {},
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
          value: 'summary',
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
      departmentGoalsItems: '',
      departmentValuesHeader: [
        { text: 'Summary', value: 'summary' },
        { text: 'Description', value: 'description' },
        { text: 'Category', value: 'competency_category' },
      ],
      departmentValuesItems: '',
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
        core_values: appraisal.competencies_set,
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
          tracking_status: goal.tracking_status,
          goal_manager_comment: goal.goal_manager_comment,

          goal_employees_comment: goal.goal_employees_comment,
          MID_user_comments: goal.MID_user_comments,
          MID_manager_comments: goal.MID_manager_comments,
          user_rating: goal.user_rating,
          user_comments: goal.user_comments,
          manager_comments: goal.manager_comments,
          board_comments: goal.board_comments,
          board_rating: goal.board_rating,
        })
      })

      appraisal.skills_set.forEach((skill) => {
        data.skills.push({
          skill: skill.skill_category.name,
          id: skill.id,
          description: skill.description,
          weightage: skill.weightage,
          category: skill.skill_category,
        })
      })

      this.myGoalsTableItems = data.goals
      this.myValuesTableItems = data.core_values
      this.mySkillsTableItems = data.skills

      this.departmentGoalsItems = this.appraisal.overall_appraisal.departmentalgoals_set

      this.departmentValuesItems = this.appraisal.overall_appraisal.departmentalcompetencies_set

      this.name = `${appraisal.employee.name}'s`
    },

    submitCareerAspiration() {
      this.$axios
        .patch(`api/appraisals/admin/${this.appraisal.id}/`, {
          career_aspiration_employee: this.appraisal.career_aspiration_employee,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully Submit Career Aspiration',
            color: 'success',
          })
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'Error Submitting Career Aspiration',
            color: 'error',
          })
        })
    },
    async add_kpi(goal) {
      const data = {
        description: this.kpi,
        goal: goal.id,
        due: this.kpi_date,
      }

      await this.$axios
        .$post(`api/KPI/create`, data)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully added KPI',
            color: 'info',
          })
          goal.kpi_set.push({
            description: this.kpi,
            due: this.kpi_date,
            progress: 'Working',
          })
          this.kpi = ''
          this.kpi_date = ''
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'Error  adding kpi',
            color: 'error',
          })
        })
    },
    async update_kpi(id, progress) {
      const data = {
        progress,
      }

      await this.$axios
        .$patch(`api/KPI/${id}`, data)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully updated KPI',
            color: 'info',
          })
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'Error updating kpi',
            color: 'error',
          })
        })
    },
    postcomment(cid, item) {
      item.dialog = false

      if (cid === 0) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            goal_employees_comment: this.newComment,
          })
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
      }
      if (cid === 1) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            MID_user_comments: this.newComment,
          })
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
      }
      if (cid === 2) {
        this.$axios
          .patch(`api/goal/${item.id}`, {
            user_comments: this.newComment,
          })
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
      }
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

    deleteSkill(id) {
      this.$axios
        .$delete(`api/skill/${id}`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted Skill',
            color: 'info',
          })

          this.reload()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting Skill',
            color: 'error',
          })
          console.log(error)
        })
    },
    deleteCoreValue(id) {
      this.$axios
        .$delete(`api/competencies/${id}`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted Core Value',
            color: 'info',
          })

          this.reload()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting Core Value',
            color: 'error',
          })
          console.log(error)
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
