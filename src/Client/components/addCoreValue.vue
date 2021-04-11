<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline">
          Create Core Values Competencies</v-card-title
        >
        <v-card-text>
          <v-form>
            <v-select
              v-model="competencies.competency_category"
              :items="categories"
              item-text="name"
              item-value="id"
              label="Core Values Competency Category"
              :rules="[rules.required]"
            ></v-select>
            <v-text-field
              v-model="competencies.summary"
              label="Core Values Competency"
              :rules="[rules.required]"
            ></v-text-field>

            <v-textarea
              v-model="competencies.description"
              label="Description"
              outlined
              :rules="[rules.required]"
            ></v-textarea>

            <v-text-field
              v-model="competencies.weightage"
              label="Weightage (%)"
              type="number"
              :rules="[rules.required]"
            ></v-text-field>
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
  name: 'AddCoreValue',
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
      .$get('/api/category/competency/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      categories: [],
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
      this.$emit('change-tab-data', 1)
    },
    submit() {
      let url = '/api/competencies/create'
      if (this.isAdmin) {
        url = 'api/admin/competencies/create'
      }
      this.$axios
        .$post(url, this.competencies)
        .then((res) => {
          this.close()
          this.$notifier.showMessage({
            content: 'Success creating competencies',
            color: 'info',
          })
          this.$emit('reload')
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
