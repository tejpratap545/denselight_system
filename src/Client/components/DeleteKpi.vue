<template>
  <v-dialog v-model="dialog" width="500">
    <v-card>
      <v-card-title class="subtitle-2">
        {{ kpi.description }}
      </v-card-title>

      <v-divider></v-divider>
      {{ kpi }}

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="info" text @click="$emit('close-kpi-dialog')">
          Close
        </v-btn>
        <v-btn color="error" text @click="deleteKpi"> Delete </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: { dialog: Boolean, kpi: Object },
  methods: {
    deleteKpi() {
      this.$axios
        .delete(`api/KPI/${this.kpi.id}`)
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully deleted  kpi `,
            color: 'info',
          })
          this.$emit('reload')
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error deleting kpi',
            color: 'error',
          })
        })
    },
  },
}
</script>
