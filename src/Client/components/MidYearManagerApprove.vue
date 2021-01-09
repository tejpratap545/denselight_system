<template>
  <v-row justify="center">
    <MidyearRejection
      v-if="rejectDialog"
      :dialog="rejectDialog"
      :appraisal-id="appraisalId"
      @close-reject-midyear="rejectDialog = false"
      @reload="$fetch"
    >
    </MidyearRejection>
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline"> Submit Mid Year Review </v-card-title>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
          <v-btn text color="error" @click="rejectDialog = true">
            reject
          </v-btn>
          <v-btn color="green darken-1" text @click="submit"> Submit </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
export default {
  name: 'MidYearManagerApprove',
  props: { dialog: Boolean, appraisalId: Number },
  data() {
    return {
      rejectDialog: false,
    }
  },
  methods: {
    close() {
      this.$emit('close-mid-year-manager-submit-dialog')
    },
    submit() {
      this.$axios
        .post(`api/approve/manager/midyear/${this.appraisalId}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'You  have   Successfully approved mid year review',
            color: 'info',
          })
          this.$emit('reload')
          this.close()
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
