<template>
  <v-dialog v-model="dialog" width="700">
    <v-card>
      <v-card-title>Update Kpi</v-card-title>

      <v-card-text>
        <v-row>
          <v-textarea
            v-model="kpi.description"
            outlined
            label="KPI description"
          ></v-textarea>
        </v-row>

        <v-row>
          <v-menu
            v-model="kpiDateMenu"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="kpi.due"
                label="KPI due"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="kpi.due"
              @input="kpiDateMenu = false"
            ></v-date-picker>
          </v-menu>
        </v-row>
      </v-card-text>
      <v-divider></v-divider>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="info" text @click="close"> Close </v-btn>
        <v-btn color="success" text @click="update(kpi)"> Update </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: 'EditKpi',
  props: { dialog: Boolean, kpi: Object },
  fetch() {
    this.orignalKpi = { ...this.kpi }
  },

  data() {
    return {
      kpiDateMenu: false,
      orignalKpi: {},
    }
  },

  methods: {
    cancel() {
      this.kpi = this.orignalKpi
      this.close()
    },
    close() {
      this.$emit('close-kpi-dialog')
    },
    update() {
      this.$axios
        .patch(`api/KPI/${this.kpi.id}`, {
          description: this.kpi.description,
          due: this.kpi.due,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully updating  kpi `,
            color: 'info',
          })

          this.close()
        })
        .catch((error) => {
          this.cancel()
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error updating kpi',
            color: 'error',
          })
        })
    },
  },
}
</script>

<style scoped></style>
