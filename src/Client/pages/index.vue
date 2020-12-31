<template>
  <div class="pa-5">
    <v-card flat>
      <v-card-title class="d-flex justify-lg-space-between align-center">
        <v-menu rounded="lg">
          <template v-slot:activator="{ on, attrs }">
            <v-btn elevation="0" color="primary" v-bind="attrs" v-on="on">
              Change Appraisal
            </v-btn>
          </template>

          <v-list>
            <v-list-item v-for="(x, y) in appraisalData" :key="y" link>
              <v-list-item-title @click="changeAppraisal(x)">
                {{ x.appraisal_name }}
              </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>

        <div v-if="appraisalSelectedIndex != 0">
          <h3 class="font-weight-medium">
            {{ appraisalSelected.appraisal_name }} -
            {{ appraisalSelected.appraisal_category.name }}
          </h3>
          <p class="ma-0">
            Status:
            {{
              getStatus(
                appraisalSelected.overall_appraisal.status,
                appraisalSelected.status
              )
            }}
          </p>
        </div>
        <div v-else>
          <h3 class="font-weight-medium">No Appraisal selected</h3>
        </div>
      </v-card-title>

      <v-toolbar class="button-group mx-5" elevation="0" color="#eee" rounded>
        <v-btn flat><v-icon>mdi-plus</v-icon> Add Mid Year Review</v-btn>
        <v-btn flat><v-icon>mdi-plus</v-icon> Add End Year Review</v-btn>
        <v-btn flat><v-icon>mdi-plus</v-icon> Add Mid Year Review</v-btn>
      </v-toolbar>
    </v-card>

    <AppraisalDetails
      v-if="appraisalSelectedIndex != 0"
      :appraisal="appraisalSelected"
    />
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
      v-if="appraisalSelectedIndex == 0"
    ></v-skeleton-loader>
  </div>
</template>

<script>
import { AppraisalDetails } from '~/components/AppraisalDetails'
import global from '~/mixins/global'

export default {
  title: 'Dashboard',
  layout: 'dashboard-template',
  mixins: [global],
  async fetch() {
    try {
      this.appraisalData = await this.$axios.$get(
        '/api/appraisals/list/detail/me'
      )
      this.changeAppraisal(this.appraisalData[0])
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tabData: null,
      appraisalData: [],
      appraisalSelected: {},
      appraisalSelectedIndex: 0,
    }
  },
  methods: {
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.appraisalSelectedIndex = this.appraisalSelected.id
    },
  },
}
</script>

<style>
.button-group button{
  margin: 0 10px;
}
.button-group {
  display: flex;
  justify-content: space-evenly;
}
</style>
