<template>
  <v-dialog v-model="dialog" persistent max-width="500">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="error" icon dark v-bind="attrs" v-on="on">
        <v-icon>mdi-delete-outline</v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-card-title class="headline">Delete Goal </v-card-title>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
        <v-btn color="green darken-1" text @click="submit"> Submit </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>
<script>
export default {
  name: 'GoalRemove',
  props: { id: Number },
  data() {
    return {
      dialog: false,
    }
  },
  methods: {
    close() {
      this.dialog = false
      this.$emit('close-delete-dialog')
    },
    submit() {
      this.$axios
        .delete(`api/goal/${this.id}`)
        .then(() => {
          this.$notifier.showMessage({
            content: 'You have successfully deleted a goal',
            color: 'info',
          })
          this.close()
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error occured',
            color: 'error',
          })
          this.close()
        })

      this.close()
    },
  },
}
</script>
