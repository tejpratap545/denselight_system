<template>
  <div class="pa-5">
    <div class="d-flex justify-lg-space-between align-center">
      <v-menu rounded="lg">
        <template v-slot:activator="{ on, attrs }">
          <v-btn elevation="0" color="primary" v-bind="attrs" v-on="on">
            Change Appraisal
          </v-btn>
        </template>

        <v-list>
          <v-list-item v-for="(x, y) in appraisalData" :key="y" link>
            <v-list-item-title @click="changeAppraisal(y)">
              {{ x.name }}
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>

      <div v-if="appraisalData.length != 0">
        <h3 class="font-weight-medium">
          {{ appraisalData[appraisalSelected].name }} -
          {{ appraisalData[appraisalSelected].category }}
        </h3>
        <p class="ma-0">
          Status: {{ appraisalData[appraisalSelected].status }}
        </p>
      </div>
      <div v-else>
        <h3 class="font-weight-medium">No Appraisal selected</h3>
      </div>
    </div>

    <AppraisalDetails v-if="appraisalSelectedIndex != 0" :appraisalID="appraisalSelectedIndex"/>
  </div>
</template>

<script>
import { AppraisalDetails } from '~/components/AppraisalDetails'

export default {
  title: 'Dashboard',
  layout: 'dashboard-template',

  async fetch() {
    try {
      const response = await this.$axios.$get('/api/appraisals/list/me')

      response.forEach((appraisal) => {
        var data = {
          id: appraisal.id,
          name: appraisal.appraisal_name,
          category: appraisal.appraisal_category.name,
          status: appraisal.status,
          completion: appraisal.completion,
          start_date: appraisal.start_date,
          end_date: appraisal.end_date,
        }

        this.appraisalData.push(data)
      })

      this.changeAppraisal(0)
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tabData: null,
      appraisalData: [],
      appraisalSelected: 0,
      appraisalSelectedIndex: 0
    }
  },
  methods: {
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.appraisalSelectedIndex = this.appraisalData[this.appraisalSelected].id
    },
  }
}
</script>
