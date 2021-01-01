<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="success" dark v-bind="attrs" v-on="on"> Ask Query </v-btn>
    </template>

    <v-card>
      <v-card-title class="headline py-5"> Ask Query </v-card-title>

      <v-card-text>
        <v-stepper v-model="e1">
          <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1">
              Basic Details
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step :complete="e1 > 2" step="2">
              Select Employees
            </v-stepper-step>
          </v-stepper-header>

          <v-stepper-items>
            <v-stepper-content step="1">
              <div class="mb-12" style="height: 400px">
                <v-text-field
                  v-model="peerappraisal.title1"
                  label="Query 1"
                  required
                ></v-text-field>
                 <v-text-field
                  v-model="peerappraisal.title2"
                  label="Query 2"
                  required
                ></v-text-field>
                 <v-text-field
                  v-model="peerappraisal.title3"
                  label="Query 3"
                  required
                ></v-text-field>
              </div>

              <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>
            </v-stepper-content>

            <v-stepper-content step="2">
              <div class="mb-12" style="height: 400px">
                <v-combobox
                  v-model="peerappraisal.employee_list"
                  :items="employees"
                  item-text="name"
                  item-value="id"
                  label="Select Employee(s)"
                  multiple
                  chips
                >
                  <template v-slot:selection="data">
                    <v-chip
                      :key="data.item.id"
                      v-bind="data.attrs"
                      :input-value="data.selected"
                      :disabled="data.disabled"
                      @click:close="data.parent.selectItem(data.item.id)"
                    >
                      <v-avatar
                        v-if="data.item != null"
                        class="accent white--text"
                        left
                        v-text="data.item.name.slice(0, 1).toUpperCase()"
                      ></v-avatar>
                      {{ data.item.name }}
                    </v-chip>
                  </template>
                </v-combobox>
              </div>

              <v-btn color="success" @click="askQuery"> Save query </v-btn>
              <v-btn text @click="e1 = 1"> Back </v-btn>
            </v-stepper-content>
          </v-stepper-items>
        </v-stepper>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  fetch() {
    this.$axios
      .$get('/api/employee/short/list')
      .then((response) => {
        response.forEach((employee) => {
          this.employees.push({
            id: employee.id,
            name: employee.name,
          })
        })
      })
      .catch((error) => console.log(error))
  },
  data() {
    return {
      dialog: false,
      e1: 1,
      employees: [],
      peerappraisal: {
        appraisal: 0,
        title1: '',
        title2: '',
        title3: '',
        employee_list: [],
      },
    }
  },
  methods: {
    askQuery() {
      this.dialog = false

      //
    },
  },
}
</script>
