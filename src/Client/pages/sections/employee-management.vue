<template>
  <div>
    <v-card class="ma-5">
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
          <v-btn v-model="item.action" color="transparent" elevation="3">
            <v-icon>mdi-dots-horizontal</v-icon>
          </v-btn>
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
      this.loading = false

      response.forEach((employee) => {
        this.employees.push({
          name: employee.name,
          department: employee.department.name,
          position: employee.job_Title,
          supervisor: employee.first_Reporting_Manager.name,
        })
      })
    } catch (error) {
      this.loading = false
      console.log(error)
    }
  },

  data() {
    return {
      search: '',
      loading: true,
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
      ],
      employees: [],
    }
  },
}
</script>
