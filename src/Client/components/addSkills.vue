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
            v-model="skills.summary"
            label="Goal Title "
          ></v-text-field>

          <v-textarea
            v-model="skills.description"
            label="Goal Objective "
          ></v-textarea>
          <v-text-field label="Tracking Source/Documents "></v-text-field>
          <v-text-field
            v-model="skills.weightage"
            label="Weightage (%)"
            type="number"
          ></v-text-field>
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
  name: 'AddSkillsVue',
  props: { dialog: Boolean, appraisalId: Number },
  data() {
    return {
      menu: false,
      maxWeightageNumber: 100,
      skills: {
        appraisal: this.appraisalId,
        summary: '',
        description: '',
        weightage: '',
        competency_category: 0,
      },
    }
  },
  mounted() {},
  methods: {
    close() {
      this.$emit('close-skills-dialog')
    },
    submit() {
      this.$axios
        .$post('api/skills/create', this.skills)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating competencies',
            color: 'info',
          })
          this.close()
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating competencies',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
