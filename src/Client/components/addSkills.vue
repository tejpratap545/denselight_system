<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="700">
      <v-card>
        <v-card-title class="headline">Create Skills </v-card-title>
        <v-col cols="10">
          <v-select
            v-model="skills.skill_category"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Enter skills category"
          ></v-select>
        </v-col>
        <v-card-text>
          <v-textarea
            v-model="skills.description"
            label="Skill Description "
            outlined
          ></v-textarea>

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
  name: 'AddSkills',
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
      .$get('/api/category/skill/')
      .then((response) => (this.categories = response))
      .catch((error) => console.log(error))
  },
  data() {
    return {
      menu: false,
      categories: '',
      skills: {
        appraisal: this.appraisalId,
        summary: '',
        description: '',
        weightage: 0,
        skill_category: 0,
      },
    }
  },
  mounted() {},
  methods: {
    close() {
      this.$emit('close-skills-dialog')
    },
    submit() {
      let url = '/api/skill/create'
      if (this.isAdmin) {
        url = '/api/admin/skill/create'
      }
      this.$axios
        .$post(url, this.skills)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating skills',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating skills',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
