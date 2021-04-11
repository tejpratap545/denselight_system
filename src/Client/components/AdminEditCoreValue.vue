<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline">
          Create Core Values Competencies</v-card-title
        >
        <v-card-text>
          <v-select
            v-model="coreValue.competency_category"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Core Values Competency Category"
          ></v-select>
          <v-textarea
            v-model="coreValue.summary"
            outlined
            label="Core Values Competency"
          ></v-textarea>

          <v-textarea
            v-model="coreValue.description"
            label="Description"
            outlined
          ></v-textarea>
          <v-text-field
            v-model="coreValue.weightage"
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
  name: 'AdminEditCoreValue',
  props: { dialog: Boolean, coreValue: Object },
  fetch() {
    this.$axios
      .$get('/api/category/competency/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      categories: [],
    }
  },
  methods: {
    close() {
      this.$emit('close')
      this.$emit('change-tab-data', 1)
    },
    submit() {
      this.$axios
        .patch(`api/competencies/${this.coreValue.id}`, {
          summary: this.coreValue.summary,
          competency_category: this.coreValue.competency_category,
          description: this.coreValue.description,
          weightage: this.coreValue.weightage,
        })
        .then((res) => {
          this.close()
          this.$notifier.showMessage({
            content: 'Successfully updated core value',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error updating competencies',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
