<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline"> Add Goal </v-card-title>
        <v-card-text>
          <v-form>
            <v-select
              v-model="createGoal.goal_category"
              :items="categories"
              item-text="name"
              item-value="id"
              label="Enter goal category"
              :rules="[rules.required]"
            ></v-select>
            <v-text-field
              v-model="createGoal.summary"
              label="Goal Title "
              :rules="[rules.required]"
            ></v-text-field>

            <v-textarea
              v-model="createGoal.description"
              label="Goal Objective "
              :rules="[rules.required]"
              outlined
            ></v-textarea>
            <v-text-field
              label="Tracking Source/Documents "
              :rules="[rules.required]"
              outlined
            ></v-text-field>
            <v-text-field
              v-model="createGoal.weightage"
              label="Weightage (%)"
              type="number"
              :rules="[rules.required]"
              outlined
            ></v-text-field>

            <v-menu
              ref="menu"
              v-model="menu"
              :close-on-content-click="false"
              :return-value.sync="createGoal.due"
              transition="scale-transition"
              offset-y
              :rules="[rules.required]"
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
                <v-btn text color="primary" @click="menu = false">
                  Cancel
                </v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu.save(createGoal.due)"
                >
                  OK
                </v-btn>
              </v-date-picker>
            </v-menu>
          </v-form>
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
import global from '~/mixins/global'

export default {
  name: 'AddGoal',
  mixins: [global],

  props: {
    dialog: Boolean,
    appraisalId: Number,
    isAdmin: {
      type: Boolean,
      default: false,
    },
  },
  fetch() {
    this.$axios
      .$get('/api/category/goal/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      categories: '',
      createGoal: {
        appraisal: this.appraisalId,
        goal_category: 0,
        summary: '',
        description: '',
        weightage: 0,
        due: new Date().toISOString().substr(0, 10),
      },
    }
  },
  mounted() {},

  methods: {
    close() {
      this.$emit('close-goal-dialog')
      this.$emit('change-tab-data', 1)
    },

    submit() {
      let url = '/api/goal/create'
      if (this.isAdmin) {
        url = 'api/admin/goal/create'
      }
      this.$axios
        .$post(url, this.createGoal)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating goal',
            color: 'info',
          })

          this.close()
          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating goal',
            color: 'error',
          })
        })
    },
  },
}
</script>
