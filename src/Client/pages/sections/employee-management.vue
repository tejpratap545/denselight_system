<template>
  <div>
    <div class="ma-5">
      <EditEmployee
        v-if="editEmployeeDialog"
        :id="currentEmployeeId"
        :dialog="editEmployeeDialog"
        :employees="employees"
        @reload-mainvue="$fetch"
        @close="editEmployeeDialog = false"
      />
      <AddEmployee />
      <BulkUpload />
    </div>
    <v-card flat class="ma-5">
      <v-card-title>
        <v-card-title primary-title> Employee Management </v-card-title>
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-tabs
        v-model="tabData"
        background-color="transparent"
        color="#2952A4"
        centered
        grow
      >
        <v-tab>Employees</v-tab>
        <v-tab>Resigned Employee</v-tab>
        <v-tab>Departments</v-tab>
        <v-tab>Managers</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tabData">
        <v-tab-item>
          <v-data-table
            :loading="loading"
            :headers="headers"
            :items="employees"
            :search="search"
          >
            <template v-slot:[`item.action`]="{ item }">
              <v-tooltip bottom>
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    color="success"
                    dark
                    icon
                    v-bind="attrs"
                    @click="editEmployee(item.id)"
                    v-on="on"
                  >
                    <v-icon>mdi-circle-edit-outline</v-icon>
                  </v-btn>
                </template>
                <span>Edit Employee Detail</span>
              </v-tooltip>

              <v-dialog v-model="item.resign_dialog" persistent max-width="400">
                <template
                  v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                >
                  <v-tooltip bottom>
                    <template
                      v-slot:activator="{ on: tooltip, attrs: tooltipattrs }"
                    >
                      <v-btn
                        color="error"
                        dark
                        icon
                        v-bind="{ ...dialogattrs, ...tooltipattrs }"
                        v-on="{ ...dialogon, ...tooltip }"
                      >
                        <v-icon>mdi-account-remove-outline</v-icon>
                      </v-btn>
                    </template>
                    <span>Resign Employee</span>
                  </v-tooltip>
                </template>
                <v-card>
                  <v-card-title class="headline">
                    <span class="subtitle"> Do You want to resign </span>
                    {{ item.name }} ?
                  </v-card-title>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn text @click="item.resign_dialog = false">
                      Cancel
                    </v-btn>
                    <v-btn
                      color="green darken-1"
                      text
                      @click="
                        item.resign_dialog = false
                        resginEmployee(item.id)
                      "
                    >
                      OK
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </template>
          </v-data-table>
        </v-tab-item>

        <!-- resigned employee  -->
        <v-tab-item>
          <v-data-table
            :headers="resginedEmployeeHeader"
            :items="resginedEmployee"
            class="elevation-1"
            :search="search"
            :loading="loading"
          >
            <template v-slot:[`item.action`]="{ item }">
              <v-dialog v-model="item.revive_dialog" persistent max-width="600">
                <template
                  v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                >
                  <v-tooltip bottom>
                    <template
                      v-slot:activator="{ on: tooltip, attrs: tooltipattrs }"
                    >
                      <v-btn
                        color="success"
                        dark
                        v-bind="{ ...dialogattrs, ...tooltipattrs }"
                        icon
                        v-on="{ ...dialogon, ...tooltip }"
                      >
                        <v-icon>mdi-account-convert</v-icon>
                      </v-btn>
                    </template>
                    <span>Revive Employee</span>
                  </v-tooltip>
                </template>
                <v-card>
                  <v-card-title class="headline">
                    <span class="subtitle"
                      >Do You want to revive employee
                    </span>
                    {{ item.name }} ?
                  </v-card-title>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn text @click="item.revive_dialog = false">
                      Cancel
                    </v-btn>
                    <v-btn
                      color="green darken-1"
                      text
                      @click="
                        item.revive_dialog = false
                        reviveEmployee(item.id)
                      "
                    >
                      OK
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <v-dialog v-model="item.delete_dialog" persistent max-width="600">
                <template
                  v-slot:activator="{ on: dialogon, attrs: dialogattrs }"
                >
                  <v-tooltip bottom>
                    <template
                      v-slot:activator="{ on: tooltip, attrs: tooltipattrs }"
                    >
                      <v-btn
                        color="error"
                        dark
                        v-bind="{ ...dialogattrs, ...tooltipattrs }"
                        icon
                        v-on="{ ...dialogon, ...tooltip }"
                      >
                        <v-icon>mdi-close</v-icon>
                      </v-btn>
                    </template>
                    <span>Delete Employee</span>
                  </v-tooltip>
                </template>
                <v-card>
                  <v-card-title class="headline">
                    <span class="subtitle"
                      >Do You want to permanently delete
                    </span>
                    {{ item.name }} ?
                  </v-card-title>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn text @click="item.delete_dialog = false">
                      Cancel
                    </v-btn>
                    <v-btn
                      color="green darken-1"
                      text
                      @click="
                        item.delete_dialog = false
                        deleteEmployee(item.id)
                      "
                    >
                      OK
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </template>
          </v-data-table>
        </v-tab-item>

        <v-tab-item>
          <v-data-table
            :headers="departmentTableHeader"
            :items="departments"
            class="elevation-1"
            :search="search"
            :loading="loading"
          ></v-data-table>
        </v-tab-item>

        <v-tab-item>
          <v-data-table
            :headers="managerTableHeader"
            :items="managers"
            class="elevation-1"
            :search="search"
            :loading="loading"
          ></v-data-table>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
  </div>
</template>

<script>
export default {
  title: 'Employee Mangment',
  name: 'EmployeeManagment',
  layout: 'dashboard-template',

  async fetch() {
    try {
      this.employees = []
      this.resginedEmployee = []
      this.departments = await this.$axios.$get('api/department/')
      this.managers = await this.$axios.$get('/api/manager/short/list')

      await this.$axios.$get('api/resign/employee/list').then((response) => {
        response.forEach((employee) => {
          this.resginedEmployee.push({
            id: employee.id,
            name: employee.name,
            user: employee.user,
            department: employee.department ? employee.department.name : 'NIL',
            position: employee.job_Title,
            supervisor: employee.first_Reporting_Manager
              ? employee.first_Reporting_Manager.name
              : 'NIL',
            delete_dialog: false,
            revive_dialog: false,

            dateOfHire: employee.date_Of_Hire,
            resignDate: employee.resign_date,

            email: employee.email,
          })
        })
      })

      const response = await this.$axios.$get('api/employee/list/')
      response.forEach((employee) => {
        this.employees.push({
          id: employee.id,
          name: employee.name,
          user: employee.user,
          department: employee.department ? employee.department.name : 'NIL',
          position: employee.job_Title,
          supervisor: employee.first_Reporting_Manager
            ? employee.first_Reporting_Manager.name
            : 'NIL',
          resign_dialog: false,
          dateOfHire: employee.date_Of_Hire,
          username: employee.username,

          email: employee.email,
        })
      })

      this.loading = false
    } catch (error) {
      this.loading = false
      console.log(error)
    }
  },
  fetchOnServer: false,

  data() {
    return {
      search: '',
      loading: true,
      currentEmployeeId: 1,
      tabData: 0,
      resginedEmployee: [],
      departmentTableHeader: [
        {
          text: 'Id',
          align: 'start',
          value: 'id',
          sortable: true,
        },
        {
          text: 'Name',
          align: 'start',
          value: 'name',
          sortable: true,
        },
      ],
      managerTableHeader: [
        {
          text: 'Id',
          align: 'start',
          value: 'id',
          sortable: true,
        },
        {
          text: 'Name',
          align: 'start',
          value: 'name',
          sortable: true,
        },
        { text: 'Email', value: 'email' },
      ],
      managers: [],
      departments: [],
      resginedEmployeeHeader: [
        {
          text: 'Name',
          align: 'start',
          value: 'name',
          sortable: true,
        },
        {
          text: 'Username',
          value: 'user.username',
        },

        { text: 'Email', value: 'email' },
        {
          text: 'Date Of Hire',
          value: 'dateOfHire',
        },
        {
          text: 'Date Of Resign',
          value: 'resignDate',
        },
        { text: 'Department', value: 'department', sortable: true },
        { text: 'Position', value: 'position', sortable: true },

        { text: 'Supervisor', value: 'supervisor', sortable: true },
        { text: 'Action', value: 'action' },
      ],

      editEmployeeDialog: false,
      headers: [
        {
          text: 'Name',
          align: 'start',
          value: 'name',
          sortable: true,
        },
        {
          text: 'Username',
          value: 'user.username',
        },
        {
          text: 'Date Of Hire',
          value: 'dateOfHire',
        },
        { text: 'Email', value: 'email' },
        { text: 'Department', value: 'department', sortable: true },
        { text: 'Position', value: 'position', sortable: true },

        { text: 'Supervisor', value: 'supervisor', sortable: true },
        { text: 'Action', value: 'action' },
      ],
      employees: [],
    }
  },

  methods: {
    resginEmployee(id) {
      this.$axios
        .$post(`api/resign/employee`, {
          id,
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully resigend employee',
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error resiging employee',
            color: 'error',
          })
          console.log(error)
        })
    },
    deleteEmployee(id) {
      this.$axios
        .$post(`api/profile/${id}`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted employee',
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting employee',
            color: 'error',
          })
          console.log(error)
        })
    },
    reviveEmployee(id) {
      this.$axios
        .$post(`api/revive/employee`, {
          id,
        })
        .then((res) => {
          this.$notifier.showMessage({
            content:
              'Successfully revived employee. Now employee can login and continue with previous appraisal',
            color: 'success',
          })

          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting employee',
            color: 'error',
          })
          console.log(error)
        })
    },
    editEmployee(id) {
      this.currentEmployeeId = id
      this.editEmployeeDialog = true
    },
  },
}
</script>
