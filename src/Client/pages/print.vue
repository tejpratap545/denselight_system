<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="px-10 my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>

  <div v-else-if="$fetchState.error">An error occurred</div>

  <div v-else style="background-color: #eee">
    <div
      class="container shadow mx-auto p-5"
      style="width: 1200px; background-color: #fff"
    >
      <div>
        <v-btn icon @click="print">
          <v-icon>mdi-printer</v-icon>
        </v-btn>

        <a :href="appraisal.end_year_employee_file" target="_blank">
          <v-btn icon>
            <v-icon>mdi-download-box-outline</v-icon>
          </v-btn>
        </a>
      </div>

      <div class="row py-4">
        <h1 class="display-6">{{ appraisal.appraisal_name }}</h1>
      </div>

      <div class="py-4">
        <table class="table table-bordered shadow-sm p-5">
          <tbody>
            <tr>
              <th>Name</th>
              <td>{{ appraisal.employee.name }}</td>
            </tr>
            <tr>
              <th>Department</th>
              <td>{{ appraisal.employee.department.name }}</td>
            </tr>
            <tr>
              <th>Manager/Supervisor's Name</th>
              <td>{{ appraisal.manager.name }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="row py-4">
        <h4 class="display-8">Goals</h4>
      </div>

      <div v-if="appraisal.goals_set != 0">
        <div v-for="goal in appraisal.goals_set" :key="goal.id" class="py-4">
          <table class="table table-bordered shadow-sm p-5">
            <thead>
              <tr>
                <th>Goal</th>
                <th>Description</th>
                <th>Category</th>
                <th>Tracking</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{ goal.summary }}</td>
                <td>{{ goal.description }}</td>
                <td>{{ goal.goal_category.name }}</td>
                <td>{{ goal.tracking_status }}</td>
              </tr>
              <tr>
                <td colspan="4">
                  <table class="table table-bordered p-3 my-2">
                    <tbody>
                      <tr>
                        <th>Stage</th>
                        <th>Employee Comment</th>
                        <th>Manager Comment</th>
                      </tr>
                      <tr>
                        <th>Goal Setting Stage</th>
                        <td>{{ goal.goal_employees_comment || 'NIl' }}</td>
                        <td>{{ goal.goal_manager_comment || 'NIl' }}</td>
                      </tr>
                      <tr>
                        <th>Mid Year</th>
                        <td>{{ goal.MID_user_comments || 'NIl' }}</td>
                        <td>{{ goal.MID_manager_comments || 'NIl' }}</td>
                      </tr>
                      <tr>
                        <th>End Year</th>
                        <td>{{ goal.user_comments || 'NIl' }}</td>
                        <td>{{ goal.manager_comments || 'NIl' }}</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <table class="table table-bordered p-3 my-2">
                    <thead>
                      <tr>
                        <th>KPI</th>
                        <th>Due</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="kpi in goal.kpi_set" :key="kpi.id">
                        <td>
                          {{ kpi.description }}
                        </td>
                        <td>
                          {{ kpi.due }}
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div v-else>
        <p>No Goals set</p>
      </div>

      <div class="row py-4">
        <h4 class="display-8">Competencies</h4>
      </div>

      <div v-if="appraisal.competencies_set != 0" class="py-4">
        <table class="table table-bordered shadow-sm p-5">
          <thead>
            <tr>
              <th>Competency</th>
                <th>Description</th>
              <th>Weightage</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="competency in appraisal.competencies_set"
              :key="competency.id"
            >
              <td>{{ competency.summary }}</td>
              <td>{{ competency.description }}</td>
              <td>{{ competency.weightage }}</td>
            </tr>
          </tbody>
        </table>

        <v-row class="ml-2">
          <v-col><b>Employee's comment</b></v-col>
          <v-col>{{ appraisal.competencies_set[0].user_comments }}</v-col>
        </v-row>
        <v-row class="ml-2">
          <v-col><b>Manager's comment</b></v-col>
          <v-col>{{ appraisal.competencies_set[0].manager_comments }}</v-col>
        </v-row>
      </div>

      <div v-else>
        <p>No competencies set</p>
      </div>

      <div class="row py-4">
        <h4 class="display-8">Skills</h4>
      </div>

      <div v-if="appraisal.skills_set != 0" class="py-4">
        <table class="table table-bordered shadow-sm p-5">
          <thead>
            <tr>
              <th>Skill</th>
              <th>Employee's Comments</th>
              <th>Manager's Comments</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="skill in appraisal.skills_set" :key="skill.id">
              <td>{{ skill.summary }}</td>
              <td>{{ skill.user_comments }}</td>
              <td>{{ skill.manager_comments }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div v-else>
        <p>No skills set</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PrintAppraisal',

  async fetch() {
    const id = this.$route.query.id

    this.appraisal = await this.$axios.$get(`/api/appraisals/detail/${id}`)
  },

  data() {
    return {
      appraisal: {},
    }
  },

  methods: {
    print() {
      print()
    },
    ratingName(rating) {
      switch (rating) {
        case 1:
          return '1. Major Improvement Needed'
        case 2:
          return '2. Needs Improvement'
        case 3:
          return '3. Meet Expectations'
        case 4:
          return '4. Exceed Expectations'
        case 5:
          return '5. Far Exceed Expectations'
        default:
          return ''
      }
    },
  },

  head: {
    title: 'Appraisal',
    link: [
      {
        rel: 'stylesheet',
        href:
          'https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css',
      },
    ],
  },
}
</script>

<style></style>
