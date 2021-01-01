<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn v-bind="attrs" v-on="on" color="success" icon>
        <v-icon>mdi-circle-edit-outline</v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-card-title class="headline py-5"> Edit Appraisal </v-card-title>

      <v-card-text>
        <div class="mb-12" style="height: 400px; overflow-y: scroll">
          <v-menu
            v-model="menu1"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.start_date"
                label="Start date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.start_date"
              @input="menu1 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu2"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.goals_setting_end_date"
                label="Enter goals setting end date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.goals_setting_end_date"
              @input="menu2 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu3"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.mid_year_start_date"
                label="Mid year start date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.mid_year_start_date"
              @input="menu3 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu4"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.mid_year_end_date"
                label="Mid year end date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.mid_year_end_date"
              @input="menu4 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu5"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.end_year_start_date"
                label="End year start date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.end_year_start_date"
              @input="menu5 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu6"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.appraisal_end_date"
                label="Appraisal start date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.appraisal_end_date"
              @input="menu6 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu7"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.reports_end_date"
                label="Appraisal report end date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.reports_end_date"
              @input="menu7 = false"
            ></v-date-picker>
          </v-menu>
          <v-menu
            v-model="menu8"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="appraisal.calibration_end_date"
                label="Calibration end date"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="appraisal.calibration_end_date"
              @input="menu8 = false"
            ></v-date-picker>
          </v-menu>
        </div>

        <v-btn @click="dialog = false"  text> Close </v-btn>
        <v-btn @click="patchAppraisal" color="primary" text> Save changes </v-btn>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  porps: ['appraisal'],

  data() {
    return {
      dialog: false,

      menu1: false,
      menu2: false,
      menu3: false,
      menu4: false,
      menu5: false,
      menu6: false,
      menu7: false,
      menu8: false,

      appraisal: {
        id: this.$attrs.editMode ? this.$attrs.appraisal.id : 0,

        start_date: this.$attrs.editMode
          ? this.$attrs.appraisal.start_date
          : new Date().toISOString().substr(0, 10),
        goals_setting_end_date: this.$attrs.editMode
          ? this.$attrs.appraisal.goals_setting_end_date
          : new Date().toISOString().substr(0, 10),
        mid_year_start_date: this.$attrs.editMode
          ? this.$attrs.appraisal.mid_year_start_date
          : new Date().toISOString().substr(0, 10),
        mid_year_end_date: this.$attrs.editMode
          ? this.$attrs.appraisal.mid_year_end_date
          : new Date().toISOString().substr(0, 10),
        end_year_start_date: this.$attrs.editMode
          ? this.$attrs.appraisal.end_year_start_date
          : new Date().toISOString().substr(0, 10),
        appraisal_end_date: this.$attrs.editMode
          ? this.$attrs.appraisal.appraisal_end_date
          : new Date().toISOString().substr(0, 10),
        reports_end_date: this.$attrs.editMode
          ? this.$attrs.appraisal.reports_end_date
          : new Date().toISOString().substr(0, 10),
        calibration_end_date: this.$attrs.editMode
          ? this.$attrs.appraisal.calibration_end_date
          : new Date().toISOString().substr(0, 10),
      },
    }
  },
  methods: {
    patchAppraisal() {
      this.dialog = false
      this.$axios
        .patch(`/api/overallAppraisal/${this.appraisal.id}`, this.appraisal)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Appraisal saved',
            color: 'info',
          })
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error saving',
            color: 'error',
          })
          console.log(error, this.appraisal)
        })
    },
  },
}
</script>
