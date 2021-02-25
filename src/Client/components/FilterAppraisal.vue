<template>
  <div>
    <v-dialog v-model="dialog" persistent max-width="700">
      <div v-if="$fetchState.pending">
        <v-skeleton-loader type="article, actions"></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>
      <v-card v-else>
        <v-card-title class="headline">Filter Appraisal</v-card-title>
        <v-card-text>
          <v-row>
            <v-col>Appraisal</v-col>
            <v-col>
              <v-select
                v-model="filter.appraisal"
                :items="appraisals"
                label="Appraisal"
                item-text="name"
                item-value="id"
                outlined
              ></v-select>
            </v-col>
          </v-row>

          <v-row>
            <v-col>Department</v-col>
            <v-col>
              <v-combobox
                v-model="filter.department_list"
                :items="departments"
                label="Department"
                item-text="name"
                item-value="id"
                multiple
                chips
                outlined
              ></v-combobox>
            </v-col>
          </v-row>

          <v-row>
            <v-col>Employees</v-col>
            <v-col>
              <v-combobox
                v-model="filter.employee_list"
                :items="employees"
                label="Employees"
                item-text="name"
                item-value="id"
                multiple
                chips
                outlined
              ></v-combobox>
            </v-col>
          </v-row>

          <v-row>
            <v-col>Managers</v-col>
            <v-col>
              <v-combobox
                v-model="filter.manager_list"
                :items="managers"
                label="Managers"
                item-text="name"
                item-value="id"
                multiple
                chips
                outlined
              ></v-combobox>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text @click="close"> Close </v-btn>
          <v-btn color="green darken-1" text @click="submit"> submit </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: 'FilterAppraisal',
  props: { dialog: Boolean },
  async fetch() {
    try {
      this.employees = await this.$axios.$get('api/employee/list/')
      this.managers = await this.$axios.$get('api/manager/short/list')
      this.departments = await this.$axios.$get('api/department/')
      this.appraisals = await this.$axios.$get('api/overallAppraisal/')
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      employees: [],
      managers: [],
      departments: [],
      appraisals: [],
      filter: {
        employee_list: [],
        manager_list: [],
        appraisal: 0,
        department_list: [],
      },
    }
  },
  methods: {
    close() {
      this.$emit('close-filter-appraisal')
    },
    submit() {
      this.$axios
        .$post(`api/filter/appraisal`, {
          employee_list: this.filter.employee_list.map((i) => i.id),
          manager_list: this.filter.manager_list.map((i) => i.id),
          department_list: this.filter.department_list.map((i) => i.id),
          appraisal: this.filter.appraisal,
        })
        .then((res) => {
          this.$emit('filter-done', res)
          this.close()
        })
        .catch((err) => console.log(err))
    },
  },
}
</script>
