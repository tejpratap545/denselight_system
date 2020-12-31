<template>
  <v-row justify="center">
    <v-dialog v-model="rejectionDialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline">
          Manager rejection Comment
        </v-card-title>
        <v-card-text>
          <v-textarea v-model="goals_settingM_rejection"> </v-textarea>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error darken-1" text @click="rejectionDialog = false">
            cancel
          </v-btn>
          <v-btn color="green darken-1" text @click="finalReject">
            Reject
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialog" persistent>
      <v-card>
        <v-card-title class="headline"> Approved Or Reject Goals </v-card-title>
        <v-card-text>
          <Appraisal :appraisal-id="appraisalId"></Appraisal>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="info darken-1" text @click="close"> Close </v-btn>
          <v-btn color="error darken-1" text @click="reject"> Reject </v-btn>
          <v-btn color="green darken-1" text @click="approved">
            Approved
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
export default {
  name: 'GoalApprovedVue',
  props: { dialog: Boolean, appraisalId: Number },
  data() {
    return {
      rejectionDialog: false,
      goals_settingM_rejection: '',
    }
  },
  methods: {
    close() {
      this.$emit('close-goal-approved-dialog')
    },
    approved() {
      this.$axios
        .$post(`api/approve/manager/goal/${this.appraisalId}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully Approved the goals ',
            color: 'info',
          })
          this.close()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error Approved goals',
            color: 'error',
          })
        })
        .finally(this.close())
    },
    reject() {
      this.rejectionDialog = true
    },
    finalReject() {
      this.$axios
        .$patch(`api/reject/manager/goal/${this.appraisalId}`, {
          goals_settingM_rejection: this.goals_settingM_rejection,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully rejected the goals ',
            color: 'info',
          })
          this.rejectionDialog = false
          this.close()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error rejection goals',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
