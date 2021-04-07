<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="700">
      <div v-if="$fetchState.pending">
        <v-skeleton-loader type="article, actions"></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>

      <v-card v-else>
        <v-card-title class="headline">Add Cascaded Goal </v-card-title>
        <v-card-text>
          <v-select
            v-model="createGoal.goal_category"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Enter goal category"
          ></v-select>
          <v-text-field
            v-model="createGoal.summary"
            label="Goal Title "
          ></v-text-field>

          <v-textarea
            v-model="createGoal.description"
            label="Goal Objective "
            outlined
          ></v-textarea>

          <v-row>
            <v-col cols="4">Employees</v-col>
            <v-col>
              <v-combobox
                v-model="employee_list"
                :items="employees"
                label="Employees"
                item-text="name"
                multiple
                chips
                outlined
                return-object
              ></v-combobox>
            </v-col>
          </v-row>
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="createGoal.due"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="createGoal.due"
                label="Due Date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker v-model="createGoal.due" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false"> Cancel </v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.menu.save(createGoal.due)"
              >
                OK
              </v-btn>
            </v-date-picker>
          </v-menu>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
          <v-btn color="green darken-1" text @click="submit"> Submit </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
export default {
  name: 'AddGoalDepartmentVue',
  props: { dialog: Boolean, appraisalId: Number },
  async fetch() {
    this.employees = await this.$axios.$get('api/employee/list/')
    this.categories = await this.$axios.$get('/api/category/goal/')
  },
  data() {
    return {
      menu: false,
      categories: '',
      employee_list: [],
      createGoal: {
        appraisal: this.appraisalId,
        goal_category: 0,
        summary: '',
        description: '',
        due: new Date().toISOString().substr(0, 10),
      },
    }
  },
  mounted() {},

  methods: {
    close() {
      this.$emit('close-cascaded-dialog')
    },
    submit() {
      this.$axios
        .$post('/api/cascadedgoal/', {
          ...this.createGoal,
          ...{
            emaployees: this.employee_list.map((x) => x.id),
            manager: this.$auth.user.id,
          },
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating goal',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'Error creating goal',
            color: 'error',
          })
        })
    },
  },
}
</script>
