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
              <h3 class="my-5 text-center">My Goals</h3>
              <v-data-table
                :headers="myGoalsTableHeader"
                :items="myGoalsTableItems"
                :items-per-page="10"
              >
                <template v-slot:[`item.actions`]="{}">
                  <div>
                    <v-btn color="success" icon
                      ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                    >
                    <v-btn color="error" icon
                      ><v-icon>mdi-delete-outline</v-icon></v-btn
                    >
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
           <v-card flat>
            <v-card-text>
              <h3 class="my-5 text-center">My Core Values</h3>
              <v-data-table
                :headers="myValuesTableHeader"
                :items="myValuesTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{}">
                  <div>
                    <v-btn color="success" icon
                      ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                    >
                    <v-btn color="error" icon
                      ><v-icon>mdi-delete-outline</v-icon></v-btn
                    >
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <h3 class="my-5 text-center">My Skills</h3>
              <v-data-table
                :headers="mySkillsTableHeader"
                :items="mySkillsTableItems"
                :items-per-page="5"
              >
                <template v-slot:[`item.actions`]="{}">
                  <div>
                    <v-btn color="success" icon
                      ><v-icon>mdi-circle-edit-outline</v-icon></v-btn
                    >
                    <v-btn color="error" icon
                      ><v-icon>mdi-delete-outline</v-icon></v-btn
                    >
                  </div>
                </template>
              </v-data-table>
            </v-card-text>
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
      const response = await this.$axios.$get('api/appraisals/list/detail/me')

      response.forEach((appraisal) => {
        var data = {
          name: appraisal.appraisal_name,
          category: appraisal.appraisal_category.name,
          status: appraisal.status,
          completion: appraisal.completion,
          start_date: appraisal.start_date,
          end_date: appraisal.end_date,
          goals: [],
          skills: [],
          core_values: [],
        }

        appraisal.goals_set.forEach((goal) => {
          data.goals.push({
            category: 'Organization Effectivness',
            goal_title: goal.summary,
            due: goal.due,
            weightage: `${goal.weightage}%`,
          })
        })

        appraisal.skills_set.forEach((skill) => {
          data.skills.push({
            skill: skill.skill_category.name,
            description: skill.description,
            weightage: skill.weightage,
          })
        })

        appraisal.competencies_set.forEach((value) => {
          data.core_values.push({
            value: value.summary,
            description: value.description,
            weightage: value.weightage,
          })
        })

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
      myGoalsTableHeader: [
        {
          text: 'Category',
          align: 'start',
          value: 'category',
        },
        {
          text: 'Goal Title',
          align: 'start',
          value: 'goal_title',
        },
        {
          text: 'Due',
          align: 'start',
          value: 'due',
        },
        {
          text: 'Weightage',
          align: 'start',
          value: 'weightage',
        },
        {
          text: 'Action',
          align: 'start',
          value: 'actions',
        },
      ],
      myGoalsTableItems: [],
      mySkillsTableHeader: [
        {
          text: 'Skill',
          align: 'start',
          value: 'skill',
        },
        {
          text: 'Descriptions',
          align: 'start',
          value: 'description',
        },
        {
          text: 'Weightage',
          align: 'start',
          value: 'weightage',
        },
        {
          text: 'Actions',
          align: 'start',
          value: 'actions',
        },
      ],
      mySkillsTableItems: [],
      myValuesTableHeader: [
        {
          text: 'Core Values Competency',
          align: 'start',
          value: 'value',
        },
        {
          text: 'Description',
          align: 'start',
          value: 'description',
        },
        {
          text: 'Weightage',
          align: 'start',
          value: 'weightage',
        },
        {
          text: 'Actions',
          align: 'start',
          value: 'actions',
        },
      ],
      myValuesTableItems: [],
      appraisalData: [],
      appraisalSelected: 0,
    }
  },
  methods: {
    changeAppraisal(i) {
      this.appraisalSelected = i
      this.myGoalsTableItems = this.appraisalData[this.appraisalSelected].goals
      this.mySkillsTableItems = this.appraisalData[this.appraisalSelected].skills
      this.myValuesTableItems = this.appraisalData[this.appraisalSelected].core_values
    },
  },
}
</script>

<style></style>
