<template>
  <v-dialog v-model="dialog" persistent max-width="500">
    <v-card>
      <v-card-title class="headline"> Manager rejection Comment </v-card-title>
      <v-card-text>
        <v-textarea v-model="end_yearM_rejection" outlined> </v-textarea>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="error darken-1" text @click="close"> cancel </v-btn>
        <v-btn color="green darken-1" text @click="reject"> Reject </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: 'EndyearRejection',
  props: { dialog: Boolean, appraisalId: Number },
  data() {
    return {
      end_yearM_rejection: '',
    }
  },
  methods: {
    close() {
      this.$emit('close-reject-endyear')
    },
    reject() {
      this.$axios
        .$patch(`api/reject/manager/endyear/${this.appraisalId}`, {
          end_yearM_rejection: this.end_yearM_rejection,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: 'Successfully rejected the goals ',
            color: 'info',
          })
          this.$emit('reload')
          this.close()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error rejection goals',
            color: 'error',
          })
        })
        .finally(() => {
          this.close()
        })
    },
  },
}
</script>

<style scoped></style>
