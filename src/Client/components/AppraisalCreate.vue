<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" dark v-bind="attrs" v-on="on">
        Create Appraisal
      </v-btn>
    </template>

    <v-card>
      <v-card-title class="headline py-5"> Create Appraisal </v-card-title>

      <v-card-text>
        <v-stepper v-model="e1">
          <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1">
              Basic Details
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step :complete="e1 > 2" step="2">
              Select Employees / Department
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step step="3">Select Dates</v-stepper-step>
          </v-stepper-header>

          <v-stepper-items>
            <v-stepper-content step="1">
              <div class="mb-12">
                <v-text-field
                  v-model="appraisal.name"
                  label="Enter appraisal name"
                  required
                ></v-text-field>
                <v-select
                  v-model="appraisal.appraisal_category"
                  :items="appraisal_categories"
                  item-text="name"
                  item-value="id"
                  label="Enter appraisal category"
                ></v-select>
                <v-radio-group v-model="appraisal_for">
                  <v-radio label="For Company" value="0"></v-radio>
                  <v-radio label="For Departments" value="1"></v-radio>
                  <v-radio label="For Employees" value="2"></v-radio>
                </v-radio-group>
              </div>

              <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>
              <v-btn text> Cancel </v-btn>
            </v-stepper-content>

            <v-stepper-content step="2">
              <div class="mb-12">
                <v-combobox
                  v-model="appraisal.individual_employees"
                  :items="employees"
                  label="Select Employees"
                  multiple
                  chips
                >
                  <template v-slot:selection="data">
                    <v-chip
                      :key="JSON.stringify(data.item)"
                      v-bind="data.attrs"
                      :input-value="data.selected"
                      :disabled="data.disabled"
                      @click:close="data.parent.selectItem(data.item.id)"
                    >
                      <v-avatar
                        class="accent white--text"
                        left
                        v-text="data.item.name.slice(0, 1).toUpperCase()"
                      ></v-avatar>
                      {{ data.item.name }}
                    </v-chip>
                  </template>
                </v-combobox>
              </div>

              <v-btn color="primary" @click="e1 = 3"> Continue </v-btn>

              <v-btn text> Cancel </v-btn>
            </v-stepper-content>

            <v-stepper-content step="3">
              <v-card
                class="mb-12"
                color="grey lighten-1"
                height="200px"
              ></v-card>

              <v-btn color="primary" @click="e1 = 1"> Continue </v-btn>

              <v-btn @click="dialog = false" text> Cancel </v-btn>
            </v-stepper-content>
          </v-stepper-items>
        </v-stepper>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  async fetch() {
    try {
      const response = await this.$axios.$get('/api/employee/list')
      response.forEach(employee => {
        this.employees.push({
          id: employee.id,
          name: employee.name
        })
      });
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      e1: 1,
      employees: [],
      appraisal_categories: [
        {
          id: 1,
          name: '1st Quarter',
        },
        {
          id: 2,
          name: '2nd Quarter',
        },
        {
          id: 3,
          name: '3rd Quarter',
        },
        {
          id: 4,
          name: '4th Quarter',
        },
        {
          id: 5,
          name: 'Start Of Year',
        },
        {
          id: 6,
          name: 'End Of Year',
        },
      ],
      appraisal_for: 0,
      appraisal: {
        name: '',
        is_company: false,
        individual_employees: [],
        departments: [],
        appraisal_category: 0,
      },
    }
  },
}
</script>
