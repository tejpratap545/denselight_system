<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="700">
      <div v-if="$fetchState.pending">
        <v-skeleton-loader type="article, actions"></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>

      <v-card v-else>
        <v-card-title class="headline">
          <span v-if="goal.cascaded_goal == null"> Add Cascaded Goal</span>
          <span v-else> Update Cascaded Goal </span>
        </v-card-title>
        <v-card-text>
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
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
          <v-btn
            v-if="goal.cascaded_goal == null"
            color="green darken-1"
            text
            @click="submit"
          >
            Submit
          </v-btn>
          <v-btn v-else color="green darken-1" text @click="update">
            Update
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
export default {
  name: 'AddGoalDepartmentVue',
  props: { dialog: Boolean, appraisalId: Number, goal: Object },
  async fetch() {
    this.employees = await this.$axios.$get('api/employee/list/')
    this.categories = await this.$axios.$get('/api/category/goal/')

    if (this.goal.cascaded_goal != null) {
      this.$axios
        .$get(`api/cascadedgoal/${this.goal.cascaded_goal}/`)
        .then((res) => {
          console.log(res)
          this.employee_list = res.emaployees
        })
    }
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

  methods: {
    close() {
      this.$emit('close-cascaded-dialog')
    },
    update() {
      this.$axios
        .$patch(`/api/cascadedgoal/${this.goal.cascaded_goal}/`, {
          emaployees: this.employee_list.map((x) => x.id),
        })
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success updating goal',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'Error updating goal',
            color: 'error',
          })
        })
    },
    submit() {
      this.$axios
        .$post('/api/cascadedgoal/', {
          ...{
            goal_category: this.goal.category.id,
            summary: this.goal.goal_title,
            description: this.goal.description,
            due: this.goal.due,
            appraisal: this.appraisalId,
          },
          ...{
            emaployees: this.employee_list.map((x) => x.id),
            manager: this.$auth.user.id,
          },
        })
        .then(async (res) => {
          this.$notifier.showMessage({
            content: 'Success creating goal',
            color: 'info',
          })

          await this.$axios.patch(`api/goal/${this.goal.id}`, {
            cascaded_goal: res.id,
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
