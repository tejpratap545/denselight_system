<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      transition="dialog-bottom-transition"
      max-width="500"
    >
      <v-card>
        <v-card-title class="headline">
          Create Core Values Competencies</v-card-title
        >
        <v-card-text>
          <v-select
            v-model="competencies.competency_category"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Core Values Competency Category"
          ></v-select>
          <v-text-field
            v-model="competencies.summary"
            label="Core Values Competency"
          ></v-text-field>

          <v-textarea
            v-model="competencies.description"
            label="Description"
          ></v-textarea>

          <v-text-field
            v-model="competencies.weightage"
            label="Weightage (%)"
            type="number"
            :rules="maxWeightage"
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
  name: 'AddCoreValueVue',
  props: { dialog: Boolean, appraisalId: Number },
  fetch() {
    this.$axios
      .$get('/api/category/competency/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      maxWeightageNumber: 100,
      categories: '',
      competencies: {
        appraisal: this.appraisalId,
        summary: '',
        description: '',
        weightage: 0,
        competency_category: 0,
      },
    }
  },
  mounted() {},
  methods: {
    close() {
      this.$emit('close-core-dialog')
    },
    submit() {
      this.$axios
        .$post('api/competencies/create', this.competencies)
        .then((res) => {
          this.close()
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
