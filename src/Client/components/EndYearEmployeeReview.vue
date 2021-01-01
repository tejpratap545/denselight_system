<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else>
    <div class="px-10 my-5"></div>
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
