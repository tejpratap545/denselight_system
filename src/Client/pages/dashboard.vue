<template>
  <div class="pa-5">
    <div class="d-flex justify-lg-space-between align-center">
      <v-menu rounded="lg">
        <template v-slot:activator="{ on, attrs }">
          <v-btn color="transparent" v-bind="attrs" elevation="0" v-on="on">
            <i class="fas fa-sync"></i>
          </v-btn>
        </template>

        <v-list>
          <v-list-item v-for="(x, y) in appraisalData" :key="y" link>
            <v-list-item-title @click="appraisalSelected = x">
              {{ x.appraisal_name }}
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
      <h3
        v-if="appraisalSelected != null"
        class="text-center font-weight-medium"
      >
        {{ appraisalSelected.appraisal_name }} -
        {{ appraisalSelected.appraisal_category.name }}
      </h3>
      <p class="ma-0">Status: Mid Year Review</p>
    </div>
    <div class="px-10 my-5">
      <v-tabs
        v-model="tabData"
        background-color="transparent"
        color="#2952A4"
        centered
        grow
      >
        <v-tab>Goals</v-tab>
        <v-tab>Core Values</v-tab>
        <v-tab>Skills</v-tab>
        <v-tab>Rating</v-tab>
      </v-tabs>

      <v-tabs-items v-model="tabData">
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <h3>Departmental Goals</h3>
              <!-- <v-data-table
                  :headers="departmentTableHeader"
                  :items="departmentTableItems"
                  :items-per-page="5"
                >

                </v-data-table> -->
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text> Second </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text> Third </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text> Fourth </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
</template>

<script>
// import * as auth from "../../plugins/axios";
export default {
  title: 'Dashboard',
  layout: 'dashboard-template',
  async fetch() {
    try {
      const response = await this.$axios.$get('api/appraisals/list/me')
      this.appraisalData = response
      this.appraisalSelected = response[0]
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      tabData: null,
      departmentTableHeader: [
        {
          text: 'Department',
          align: 'start',
          sortable: true,
          value: 'department',
        },
        {
          text: 'Category',
          align: 'start',
          sortable: true,
          value: 'category',
        },
        {
          text: 'Goal Title',
          align: 'start',
          sortable: true,
          value: 'goal_title',
        },
        {
          text: 'Due',
          align: 'start',
          sortable: false,
          value: 'due',
        },
        {
          text: 'Action',
          align: 'start',
          sortable: false,
          value: 'name',
        },
      ],
      appraisalData: '',
      appraisalSelected: null,
    }
  },
  fetchOnServer: false,
}
</script>

<style></style>
