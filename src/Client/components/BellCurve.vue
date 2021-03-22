<template>
  <div>
    <v-dialog v-model="dialog" persistent max-width="700">
      <div v-if="$fetchState.pending">
        <v-skeleton-loader type="article, actions"></v-skeleton-loader>
      </div>
      <div v-else-if="$fetchState.error">An error occurred</div>
      <v-card v-else>
        <v-card-title class="headline">Download Bell Curve</v-card-title>
        <v-card-text>
          <v-row>
            <v-col>Appraisal</v-col>
            <v-col>
              <v-combobox
                v-model="filter.appraisal_list"
                :items="appraisals"
                label="Appraisal"
                item-text="name"
                item-value="id"
                multiple
                outlined
              ></v-combobox>
            </v-col>
          </v-row>

          <v-row>
            <v-col>Department</v-col>
            <v-col>
              <v-combobox
                v-model="filter.department_list"
                :items="departments"
                label="Department"
                item-text="name"
                item-value="id"
                multiple
                chips
                outlined
              ></v-combobox>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text @click="close"> Close </v-btn>
          <v-btn color="green darken-1" text @click="submit"> submit </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: 'FilterAppraisal',
  props: { dialog: Boolean },
  async fetch() {
    try {
      this.departments = await this.$axios.$get('api/department/')
      this.appraisals = await this.$axios.$get('api/overallAppraisal/')
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      departments: [],
      appraisals: [],
      filter: {
        appraisal_list: [],
        department_list: [],
      },
    }
  },
  methods: {
    close() {
      this.$emit('close-filter-appraisal')
    },
    submit() {
      this.$axios
        .post(`api/download/bellcurve`, {
          department_list: this.filter.department_list.map((i) => i.id),
          appraisal_list: this.filter.appraisal_list.map((i) => i.id),
          responseType: 'blob',
        })
        .then((res) => {
          console.log(res)
          const url = window.URL.createObjectURL(new Blob([res.data]))
          const link = document.createElement('a')
          link.href = url
          link.setAttribute('download', 'bell-curve.xlsx')
          document.body.appendChild(link)
          link.click()

          this.$notifier.showMessage({
            content: 'Report Downloaded',
            color: 'info',
          })
        })
        .catch((err) => console.log(err))
    },
  },
}
</script>
