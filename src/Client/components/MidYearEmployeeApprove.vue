<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline"> Submit Mid Year Review </v-card-title>

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
  name: 'MidYearEmployeeApprove',
  props: { dialog: Boolean, appraisalId: Number },
  methods: {
    close() {
      this.$emit('close-mid-year-submit')
    },
    submit() {
      this.$axios
        .post(`api/submit/employee/midyear/${this.appraisalId}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'You  have   Successfully submitted mid year review',
            color: 'info',
          })
          this.close()
          this.$emit('reload')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error found please validate or try again',
            color: 'error',
          })
          this.close()
        })

      this.close()
    },
  },
}
</script>
