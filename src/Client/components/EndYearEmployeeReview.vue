<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="600">
        <div v-if="$fetchState.pending">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card v-else>
          <v-card-title class="headline"> End Year Review </v-card-title>
          <v-card-text>
            {{ goals }}
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="green darken-1" text @click="close"> Disagree </v-btn>
            <v-btn color="green darken-1" text @click="close"> Agree </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'EndYearEmployeeReviewVue',
  props: { dialog: Boolean, appraisalId: Number },
  async fetch() {
    await this.$axios
      .$get(`api/appraisals/detail/${this.appraisalId}`)
      .then((res) => {
        this.init(res)
      })
  },
  methods: {
    close() {
      this.$emit('close-end-year-dialog')
    },
  },
}
</script>

<style scoped></style>
