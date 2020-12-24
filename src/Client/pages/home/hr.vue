<template>
    <div>
      <div class="d-flex justify-lg-space-between align-center">
        <v-menu rounded="lg">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="transparent"
              v-bind="attrs"
              v-on="on"
              elevation="0"
            >
              <i class="fas fa-caret-down"></i>
            </v-btn>
          </template>
            <v-list>
              <v-list-item link v-for="(x,y) in appraisalData" :key="y">
                <v-list-item-title @click="appraisalSelected = x">
                  {{x.appraisal_name}}
                </v-list-item-title>
              </v-list-item>
            </v-list>
        </v-menu>
        <h3 class="text-center font-weight-medium">{{appraisalSelected.appraisal_name}} - {{appraisalSelected.appraisal_category}}</h3>
        <p class="ma-0">Status: Mid Year Review</p>
      </div>
      <div class="px-10 my-5">
        <v-tabs background-color="transparent" color="#2952A4" centered grow v-model="tabData">
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
              <v-card-text>
                Second
              </v-card-text>
            </v-card>
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-text>
                Third
              </v-card-text>
            </v-card>
          </v-tab-item>

          <v-tab-item>
            <v-card flat>
              <v-card-text>
                Fourth
              </v-card-text>
            </v-card>
          </v-tab-item>
        </v-tabs-items>
      </div>
    </div>
</template>

<script>
// import * as auth from "../../plugins/axios";
export default {
  name: 'HrVue',
  layout: 'hrDashboard',
  data(){
    return{
      tabData: null,
      departmentTableHeader: [
        {
          text: 'Department',
          align: 'start',
          sortable: true,
          value: 'department'
        },
        {
          text: 'Category',
          align: 'start',
          sortable: true,
          value: 'category'
        },
        {
          text: 'Goal Title',
          align: 'start',
          sortable: true,
          value: 'goal_title'
        },
        {
          text: 'Due',
          align: 'start',
          sortable: false,
          value: 'due'
        },
        {
          text: 'Action',
          align: 'start',
          sortable: false,
          value: 'name'
        }
      ],
      appraisalData: "",
      appraisalSelected: "",

    }
  },
  async fetch(){
    try {
      let response = await this.$axios.$get("api/appraisals/list/me");
      this.appraisalData = response;
      this.appraisalSelected = response[0];
      console.log(this.appraisalData);
    } catch (error) {
      console.log(error)
    }
    
  },
  fetchOnServer: false
}
</script>

<style></style>
