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
    </div>
    <v-card flat class="ma-5">
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :loading="loading"
        :headers="headers"
        :items="employees"
        :search="search"
      >
        <template v-slot:[`item.action`]="{ item }">
          <v-btn color="success" dark icon @click="editEmployee(item.id)">
            <v-icon>mdi-circle-edit-outline</v-icon>
          </v-btn>

          <v-dialog v-model="item.dialog_delete" persistent max-width="400">
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="error" dark v-bind="attrs" icon v-on="on">
                <v-icon>mdi-close</v-icon>
              </v-btn>
            </template>
            <v-card>
              <v-card-title class="headline">
                Permanently delete user ?
              </v-card-title>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn text @click="item.dialog_delete = false"> Cancel </v-btn>
                <v-btn
                  color="green darken-1"
                  text
                  @click="
                    item.dialog_delete = false
                    deleteUser(item.id)
                  "
                >
                  OK
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </template>
      </v-data-table>
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
      const response = await this.$axios.$get('api/employee/list/')

      response.forEach((employee) => {
        this.employees.push({
          id: employee.id,
          name: employee.name,
          department: employee.department.name,
          position: employee.job_Title,
          supervisor: employee.first_Reporting_Manager.name,
          dialog_delete: false,
        })
      })

      this.loading = false
    } catch (error) {
      this.loading = false
      console.log(error)
    }
  },

  data() {
    return {
      search: '',
      loading: true,
      currentEmployeeId: 1,

      editEmployeeDialog: false,
      headers: [
        {
          text: 'Name',
          align: 'start',
          value: 'name',
          sortable: true,
        },
        { text: 'Department', value: 'department', sortable: true },
        { text: 'Position', value: 'position', sortable: true },

        { text: 'Supervisor', value: 'supervisor', sortable: true },
        { text: 'Action', value: 'action' },
      ],
      employees: [],
    }
  },

  methods: {
    deleteUser(id) {
      this.$axios
        .$delete(`api/profile/${id}`)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Successfully deleted user',
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error deleting user',
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
  fetchOnServer: false,
}
</script>
