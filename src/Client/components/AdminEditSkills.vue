<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="700">
      <v-card>
        <v-card-title class="headline">Create Skills </v-card-title>
        <v-col cols="10">
          <v-select
            v-model="skill.skill_category"
            :items="categories"
            item-text="name"
            item-value="id"
            label="Enter skills category"
          ></v-select>
        </v-col>
        <v-card-text>
          <v-textarea
            v-model="skill.description"
            label="Skill Description "
            outlined
          ></v-textarea>

          <v-text-field
            v-model="skill.weightage"
            label="Weightage (%)"
            type="number"
          ></v-text-field>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="info darken-1" text @click="close"> Cancel </v-btn>
          <v-btn color="green darken-1" text @click="submit"> Update </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
export default {
  name: 'AdminEditSkills',
  props: { dialog: Boolean, skill: Object },
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
    }
  },

  methods: {
    close() {
      this.$emit('close')
    },
    submit() {
      this.$axios
        .$patch(`api/skill/${this.skill.id}`, this.skills)
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
          this.close()
        })
    },
  },
}
</script>

<style scoped></style>
