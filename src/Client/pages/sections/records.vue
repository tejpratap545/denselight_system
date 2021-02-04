<template>
  <div>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else class="ma-5">
      <v-card flat>
        <v-card-title>
          <h3 class="my-5 text-center">Performance</h3>
        </v-card-title>

        <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
          <b>My Appraisals</b>
        </v-toolbar>

        <v-data-table
          :loading="loading"
          :headers="headers"
          :items="previousApprials"
        >
          <template v-slot:[`item.final_employee_rating`]="{ item }">
            {{ ratingName(item.final_employee_rating) }}
          </template>
          <template v-slot:[`item.final_manager_rating`]="{ item }">
            {{ ratingName(item.final_manager_rating) }}
          </template>
          <template v-slot:[`item.actions`]="{ item }">
            <v-dialog v-model="appraisal_dialog" scrollable max-width="1200">
              <template v-slot:activator="{ on, attrs }">
                <v-btn color="grey lighten-1" icon v-bind="attrs" v-on="on">
                  <v-icon>mdi-eye-circle</v-icon>
                </v-btn>
              </template>
              <v-card>
                <v-toolbar color="primary" dark>
                  <b>{{ item.appraisal_name }}</b>
                  <v-spacer></v-spacer>
                  <v-btn icon @click="appraisal_dialog = false">
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </v-toolbar>
                <Appraisal
                  v-if="appraisal_dialog"
                  :appraisal-id="item.id"
                  is-editable="true"
                />
              </v-card>
            </v-dialog>
          </template>
        </v-data-table>
        <div v-if="$auth.user.user.role != 'Employee'">
          <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
            <b>First Reporting Employees</b>
          </v-toolbar>

          <v-data-table
            :headers="employeesTableHeader"
            :items="myemployeesTableItems"
            :items-per-page="5"
            :loading="loading"
            show-expand
            item-key="id"
          >
            <template v-slot:expanded-item="{ headers, item }">
              <td :colspan="headers.length">
                <v-list dense>
                  <v-list-item
                    v-for="appraisal in item.user_appraisals"
                    :key="appraisal.id"
                  >
                    <v-list-item-content>
                      <v-list-item-title
                        v-html="appraisal.dat.appraisal_name"
                      ></v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                      <v-dialog
                        v-model="appraisal.appraisal_dialog"
                        scrollable
                        max-width="1200"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-btn
                            color="grey lighten-1"
                            icon
                            v-bind="attrs"
                            v-on="on"
                          >
                            <v-icon>mdi-eye-circle</v-icon>
                          </v-btn>
                        </template>
                        <v-card>
                          <v-toolbar color="primary" dark>
                            <b>{{ appraisal.dat.appraisal_name }}</b>
                            <v-spacer></v-spacer>
                            <v-btn
                              icon
                              @click="appraisal.appraisal_dialog = false"
                            >
                              <v-icon>mdi-close</v-icon>
                            </v-btn>
                          </v-toolbar>
                          <Appraisal
                            v-if="appraisal.appraisal_dialog"
                            :appraisal-id="appraisal.dat.id"
                            is-editable="true"
                          />
                        </v-card>
                      </v-dialog>
                    </v-list-item-action>
                  </v-list-item>
                </v-list>
              </td>
            </template>
          </v-data-table>

          <v-toolbar elevation="0" class="ma-5" color="primary" rounded dark>
            <b>Second Reporting Employees</b>
          </v-toolbar>

          <v-data-table
            :headers="employeesTableHeader"
            :items="employeesTableItems"
            :items-per-page="5"
            :loading="loading"
            show-expand
            item-key="id"
          >
            <template v-slot:expanded-item="{ headers, item }">
              <td :colspan="headers.length">
                <v-list dense>
                  <v-list-item
                    v-for="appraisal in item.user_appraisals"
                    :key="appraisal.id"
                  >
                    <v-list-item-content>
                      <v-list-item-title
                        v-html="appraisal.dat.appraisal_name"
                      ></v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                      <v-dialog
                        v-model="appraisal.appraisal_dialog"
                        scrollable
                        max-width="1200"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-btn
                            color="grey lighten-1"
                            icon
                            v-bind="attrs"
                            v-on="on"
                          >
                            <v-icon>mdi-eye-circle</v-icon>
                          </v-btn>
                        </template>
                        <v-card>
                          <v-toolbar color="primary" dark>
                            <b>{{ appraisal.dat.appraisal_name }}</b>
                            <v-spacer></v-spacer>
                            <v-btn
                              icon
                              @click="appraisal.appraisal_dialog = false"
                            >
                              <v-icon>mdi-close</v-icon>
                            </v-btn>
                          </v-toolbar>
                          <Appraisal
                            v-if="appraisal.appraisal_dialog"
                            :appraisal-id="appraisal.dat.id"
                          />
                        </v-card>
                      </v-dialog>
                    </v-list-item-action>
                  </v-list-item>
                </v-list>
              </td>
            </template>
          </v-data-table>
        </div>
      </v-card>
    </div>
  </div>
</template>

<script>
import global from '../../mixins/global'
export default {
  name: 'Records',
  layout: 'dashboard-template',
  mixins: [global],
  async fetch() {
    try {
      this.previousApprials = await this.$axios.$get('/api/appraisals/list/me/completed')

      await this.department()
      this.loading = false
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      appraisal_dialog: false,
      loading: true,
      headers: [
        { text: 'Appraisal Name', value: 'appraisal_name' },
        { text: 'Self Rating', value: 'final_employee_rating' },
        { text: "Manager's Rating", value: 'final_manager_rating' },
        { text: 'Overall Comments', value: 'overall_board_comments' },
        { text: 'Actions', value: 'actions' },
      ],
      employeesTableHeader: [
        {
          text: 'Name',
          value: 'name',
        },
        {
          text: 'Department',
          value: 'department',
        },
        {
          text: 'Email',
          value: 'email',
        },
        { text: '', value: 'data-table-expand' },
      ],
      myemployeesTableItems: [],
      employeesTableItems: [],
      appraisalData: [],
      previousApprials: [],
    }
  },
  methods: {
    async department() {
      let response = await this.$axios.$get(
        'api/appraisals/list/short/hod/completed'
      )
      response.forEach((employee) => {
        const data = {
          id: employee.id,

          name: employee.name,
          department: employee.department.name,
          email: employee.email,
          user_appraisals: [],
        }

        employee.user_appraisal_list_set.forEach((e) => {
          data.user_appraisals.push({
            dat: e,
            appraisal_dialog: false,
          })
        })

        this.employeesTableItems.push(data)
      })

      response = await this.$axios.$get(
        'api/appraisals/list/short/manager/completed'
      )
      response.forEach((employee) => {
        const data = {
          id: employee.id,

          name: employee.name,
          department: employee.department.name,
          email: employee.email,
          user_appraisals: [],
        }

        employee.user_appraisal_list_set.forEach((e) => {
          data.user_appraisals.push({
            dat: e,
            appraisal_dialog: false,
          })
        })

        this.myemployeesTableItems.push(data)
      })
    },
  },
}
</script>
