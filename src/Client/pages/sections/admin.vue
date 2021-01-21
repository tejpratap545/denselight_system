<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else>
    <v-card>
      <div>
        <AppraisalAdmin
          v-if="showAppraisalDialog"
          :appraisal-id="currentAppraisalId"
          is-editable="true"
          :dialog="showAppraisalDialog"
          @close="showAppraisalDialog = false"
        />
        <AdminChangeAppraisalStatus
          v-if="changeStatusDialog"
          :dialog="changeStatusDialog"
          :appraisal="currentAppraisal"
          @close="changeStatusDialog = false"
          @reload="$fetch"
        />
        <AdminCreateAppraisal
          v-if="createAppraisalDialog"
          :dialog="createAppraisalDialog"
          @close="createAppraisalDialog = false"
          @reload="$fetch"
        />
      </div>
      <v-card-title>
        Manage Employees Appraisals
        <v-spacer></v-spacer>
        <v-btn color="primary" @click="createAppraisalDialog = true">
          <v-icon>mdi-plus</v-icon></v-btn
        >
      </v-card-title>

      <v-card-text>
        <div class="my-5">
          <v-tabs background-color="transparent" color="#2952A4">
            <v-tab class="justify-start">GOALS LAUNCHING</v-tab>
            <v-tab class="justify-start">MID-YEAR REVIEW</v-tab>
            <v-tab class="justify-start">YEAR-END REVIEW</v-tab>
            <v-tab class="justify-start">REPORTS</v-tab>
            <v-tab class="justify-start">Training/Competency Summary</v-tab>

            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Goal Setting Stage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="goalsLaunchingTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Employee'"
                        indeterminate
                        color="primary"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon
                        v-if="item.status == 'Manager'"
                        indeterminate
                        color="info"
                      >
                        mdi-account-clock</v-icon
                      >
                      <v-icon
                        v-if="item.status == 'S1BEmployee'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{}">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_3`]="{}">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="changeAppraisalStatus(item)"
                      >
                        <v-icon>mdi-format-list-checks</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Mid year Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="midYearTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon
                        v-else-if="
                          item.status === 'S1BEmployee' ||
                          item.status === 'S2BEmployee'
                        "
                        indeterminate
                        color="primary"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon
                        v-else-if="
                          item.status === 'S1BReview' ||
                          (item.status === 'S1BManager' &&
                            item.mid_year_completion === 'Completed')
                        "
                        indeterminate
                        color="info"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{}">
                      <v-icon indeterminate color="primary">
                        mdi-account-clock</v-icon
                      >
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="changeAppraisalStatus(item)"
                      >
                        <v-icon>mdi-format-list-checks</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  End Year Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="endYearTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon
                        v-else-if="
                          (item.status === 'S2Manager' ||
                            item.status === 'S2Employee') &&
                          item.completion === 'Ecompleted'
                        "
                        indeterminate
                        color="primary"
                      >
                        mdi-account-clock</v-icon
                      >

                      <v-icon
                        v-else-if="
                          item.status === 'S2Manager' &&
                          item.completion === 'MCompleted'
                        "
                        indeterminate
                        color="info"
                      >
                        mdi-account-clock</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="changeAppraisalStatus(item)"
                      >
                        <v-icon>mdi-format-list-checks</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  REPORTSStage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="reportsTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="changeAppraisalStatus(item)"
                      >
                        <v-icon>mdi-format-list-checks</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <v-card-title>
                  Training/Competency Summary Stage Employees Appraisals
                  <v-spacer></v-spacer>
                  <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                  ></v-text-field>
                </v-card-title>
                <v-card-text>
                  <v-data-table
                    :headers="headers"
                    :items="calibrationTableItems"
                    :items-per-page="10"
                    :search="search"
                  >
                    <template v-slot:[`item.stage_1`]="{ item }">
                      <v-icon
                        v-if="
                          item.status === 'Employee' ||
                          item.status === 'Manager'
                        "
                        indeterminate
                        color="error"
                      >
                        mdi-cancel</v-icon
                      >
                      <v-icon v-else indeterminate color="success">
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                    </template>
                    <template v-slot:[`item.stage_2`]="{ item }">
                      <v-icon
                        v-if="item.mid_year_completion === 'Completed'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.stage_3`]="{ item }">
                      <v-icon
                        v-if="item.status == 'Approved'"
                        indeterminate
                        color="success"
                      >
                        mdi-checkbox-marked-circle-outline</v-icon
                      >
                      <v-icon v-else indeterminate color="error">
                        mdi-cancel
                      </v-icon>
                    </template>
                    <template v-slot:[`item.actions`]="{ item }">
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="showAppraisal(item.id)"
                      >
                        <v-icon>mdi-eye-circle</v-icon>
                      </v-btn>
                      <v-btn
                        color="grey lighten-1"
                        icon
                        @click="changeAppraisalStatus(item)"
                      >
                        <v-icon>mdi-format-list-checks</v-icon>
                      </v-btn>
                    </template>
                  </v-data-table>
                </v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs>
        </div>
      </v-card-text>
    </v-card>

    <v-card class="my-5">
      <div>
        <v-dialog
          v-model="editdialog"
          v-if="editdialog"
          persistent
          max-width="500"
        >
          <v-card>
            <v-card-title class="headline"> Category dialog</v-card-title>
            <v-card-text>
              <v-text-field
                v-model="category_text"
                label="Category name"
              ></v-text-field>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
              <v-btn color="green darken-1" text @click="submit">
                Submit
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </div>

      <v-card-title>Manage Categories </v-card-title>
      <v-card-text>
        <div class="my-5">
          <v-tabs background-color="transparent" color="#2952A4">
            <v-tab class="justify-start">GOAL CATEGORIES</v-tab>
            <v-tab class="justify-start">SKILL CATEGORIES</v-tab>
            <v-tab class="justify-start">CORE VALUES CATEGORIES</v-tab>

            <v-tab-item>
              <div style="display: flex; justify-content: flex-end">
                <v-btn @click="editdialogDialog('', 'goal', 0)" icon>
                  <v-icon>mdi-plus</v-icon>
                </v-btn>
              </div>
              <v-data-table
                :headers="categories_header"
                :items="categories_data_goals"
                :items-per-page="10"
              >
                <template v-slot:[`item.edit`]="{ item }">
                  <v-btn
                    @click="editdialogDialog(item.name, 'goal', item.id)"
                    color="green lighten-1"
                    icon
                  >
                    <v-icon>mdi-pencil-circle</v-icon>
                  </v-btn>
                </template>
                <template v-slot:[`item.remove`]="{ item }">
                  <v-btn
                    @click="remove_category('goal', item.id)"
                    color="red lighten-1"
                    icon
                  >
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </template>
              </v-data-table>
            </v-tab-item>
            <v-tab-item>
              <div style="display: flex; justify-content: flex-end">
                <v-btn @click="editdialogDialog('', 'skill', 0)" icon>
                  <v-icon>mdi-plus</v-icon>
                </v-btn>
              </div>
              <v-data-table
                :headers="categories_header"
                :items="categories_data_skills"
                :items-per-page="10"
              >
                <template v-slot:[`item.edit`]="{}">
                  <v-btn
                    @click="editdialogDialog(item.name, 'skill', item.id)"
                    color="green lighten-1"
                    icon
                  >
                    <v-icon>mdi-pencil-circle</v-icon>
                  </v-btn>
                </template>
                <template v-slot:[`item.remove`]="{ item }">
                  <v-btn
                    @click="remove_category('skill', item.id)"
                    color="red lighten-1"
                    icon
                  >
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </template>
              </v-data-table>
            </v-tab-item>
            <v-tab-item>
              <div style="display: flex; justify-content: flex-end">
                <v-btn @click="editdialogDialog('', 'competency', 0)" icon>
                  <v-icon>mdi-plus</v-icon>
                </v-btn>
              </div>
              <v-data-table
                :headers="categories_header"
                :items="categories_data_corevalues"
                :items-per-page="10"
              >
                <template v-slot:[`item.edit`]="{}">
                  <v-btn
                    @click="editdialogDialog(item.name, 'competency', item.id)"
                    color="green lighten-1"
                    icon
                  >
                    <v-icon>mdi-pencil-circle</v-icon>
                  </v-btn>
                </template>
                <template v-slot:[`item.remove`]="{ item }">
                  <v-btn
                    @click="remove_category('competency', item.id)"
                    color="red lighten-1"
                    icon
                  >
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </template>
              </v-data-table>
            </v-tab-item>
          </v-tabs>
        </div>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  layout: 'dashboard-template',
  name: 'Admin',
  async fetch() {
    this.goalsLaunchingTableItems = []
    this.midYearTableItems = []
    this.endYearTableItems = []
    this.reportsTableItems = []
    this.calibrationTableItems = []
    this.categories_data_goals = []
    this.categories_data_skills = []
    this.categories_data_corevalues = []

    await this.$axios.$get('/api/appraisals/list/admin').then((res) => {
      res.forEach((appraisal) => {
        const tableData = {
          id: appraisal.id,
          appraisal_name: appraisal.appraisal_name,

          employee: appraisal.employee,
          manager: appraisal.manager,
          employeeDepartment: appraisal.employee.department.name,
          manager1: appraisal.manager ? appraisal.manager.name : '---',
          goals_count: appraisal.goals_count,
          core_values_count: appraisal.core_values_competencies_count,
          skills_count: 0,
          end_date: appraisal.overall_appraisal.goals_setting_end_date,
          overallStage: appraisal.overall_appraisal.status,
          status: appraisal.status,
          mid_year_completion: appraisal.mid_year_completion,
          completion: appraisal.completion,
          appraisal_dialog: false,
        }

        switch (appraisal.overall_appraisal.status) {
          case 'Stage 1':
            this.goalsLaunchingTableItems.push(tableData)
            break

          case 'Stage 1B':
            this.midYearTableItems.push(tableData)
            break

          case 'Stage 2':
            this.endYearTableItems.push(tableData)
            break

          case 'Stage 3':
            this.reportsTableItems.push(tableData)
            break

          case 'Stage 4':
            this.calibrationTableItems.push(tableData)
            break

          default:
            break
        }
      })
    })

    await this.$axios
      .$get('/api/category/goal/')
      .then((res) => (this.categories_data_goals = res))
    await this.$axios
      .$get('/api/category/skill/')
      .then((res) => (this.categories_data_skills = res))
    await this.$axios
      .$get('/api/category/competency/')
      .then((res) => (this.categories_data_corevalues = res))
  },
  data() {
    return {
      createAppraisalDialog: false,
      showAppraisalDialog: false,
      changeStatusDialog: false,
      editdialog: false,
      currentAppraisalId: 0,

      goalsLaunchingTableItems: [],
      midYearTableItems: [],
      endYearTableItems: [],
      reportsTableItems: [],
      calibrationTableItems: [],
      appraisalList: '',

      search: '',
      current_dialog: '',
      category_text: '',
      category_id: 0,

      currentAppraisal: {},
      headers: [
        {
          text: 'Appraisals',
          value: 'appraisal_name',
        },
        {
          text: 'Employee',
          value: 'employee.name',
        },
        {
          text: 'Department',
          value: 'employeeDepartment',
        },
        {
          text: 'Manager',
          value: 'manager1',
        },

        {
          text: 'Stage 1',
          value: 'stage_1',
        },
        {
          text: 'Stage 2',
          value: 'stage_2',
        },
        {
          text: 'Stage 3',
          value: 'stage_3',
        },
        {
          text: 'Actions',
          value: 'actions',
        },
      ],
      categories_header: [
        {
          text: 'Name',
          value: 'name',
        },
        {
          text: 'Edit',
          value: 'edit',
        },
        {
          text: 'Remove',
          value: 'remove',
        },
      ],
      categories_data_goals: [],
      categories_data_skills: [],
      categories_data_corevalues: [],
    }
  },
  methods: {
    showAppraisal(id) {
      this.showAppraisalDialog = true

      this.currentAppraisalId = id
    },
    changeAppraisalStatus(appraisal) {
      this.currentAppraisal = {
        id: appraisal.id,
        name: appraisal.appraisal_name,
        manager: appraisal.manager,
        status: appraisal.status,
        completion: appraisal.completion,
        mid_year_completion: appraisal.mid_year_completion,
        overallAppraisalStatus: appraisal.overallStage,
        employee: appraisal.employee,
      }
      this.changeStatusDialog = true
    },
    remove_category(type, id) {
      this.$axios
        .$delete(`/api/category/${type}/${id}/`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted category',
            color: 'info',
          })
          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting category',
            color: 'error',
          })
          console.log(error)
        })
    },
    editdialogDialog(text, type, id) {
      this.category_text = text
      this.category_id = id
      this.current_dialog = type
      this.editdialog = true
    },
    close() {
      this.editdialog = false
    },
    submit() {
      if (this.category_id != 0) {
        this.$axios
          .$patch(`/api/category/${this.current_dialog}/${this.category_id}/`, {
            name: this.category_text,
          })
          .then((res) => {
            this.close()
            this.$notifier.showMessage({
              content: 'Success changing category',
              color: 'info',
            })
            this.$fetch()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error changing category',
              color: 'error',
            })
          })
      } else {
        this.$axios
          .$post(`/api/category/${this.current_dialog}/`, {
            name: this.category_text,
          })
          .then((res) => {
            this.close()
            this.$notifier.showMessage({
              content: 'Success creating category',
              color: 'info',
            })
            this.$fetch()
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error creating category',
              color: 'error',
            })
          })
      }
    },
  },
}
</script>
