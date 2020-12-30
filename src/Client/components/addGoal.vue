<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      transition="dialog-bottom-transition"
      persistent
      max-width="500"
    >
      <v-card>
        <v-card-title class="headline"> Add Goal </v-card-title>
        <v-card-text>
          <v-text-field
            v-model="createGoal.summary"
            label="Goal Title "
          ></v-text-field>

          <v-textarea
            v-model="createGoal.description"
            label="Goal Objective "
          ></v-textarea>
          <v-text-field label="Tracking Source/Documents "></v-text-field>
          <v-text-field
            v-model="createGoal.weightage"
            label="Weightage (%)"
            type="number"
            :rules="maxWeightage"
          ></v-text-field>

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
                label="Picker in menu"
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
  name: 'AddGoalVue',
  props: { dialog: Boolean, appraisalId: Number },
  data() {
    return {
      menu: false,
      maxWeightageNumber: 100,
      createGoal: {
        appraisal: this.appraisalId,
        summary: '',
        description: '',
        weightage: '',
        due: new Date().toISOString().substr(0, 10),
      },
    }
  },
  mounted() {},

  methods: {
    maxWeightage: [
      (v) => {
        if (this.createGoal.weightage > this.maxWeightageNumber) {
          return 'Error'
        }
      },
    ],
    close() {
      this.$emit('close-goal-dialog')
    },
    submit() {
      this.$axios
        .$post('/api/goal/create', this.createGoal)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating goal',
            color: 'info',
          })
          this.close()
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
