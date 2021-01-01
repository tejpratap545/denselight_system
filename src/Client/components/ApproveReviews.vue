<template>
  <div>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent fullscreen>
        <div v-if="$fetchState.pending" style="height:100%; background: #fff">
          <v-skeleton-loader type="article, actions"></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error" style="height:100%; background: #fff">An error occurred</div>
        <v-card v-else>
          <v-card-title class="headline">
            {{ appraisal.appraisal_name }}

            <v-spacer />

            <v-btn @click="print" icon>
              <v-icon>mdi-printer</v-icon>
            </v-btn>
          </v-card-title>

          <v-card-text>
            <v-simple-table class="my-5">
              <template v-slot:default>
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
                    <th>Job Title</th>
                    <td>-------</td>
                  </tr>
                  <tr>
                    <th>Manager/Supervisor's Name</th>
                    <td>{{ appraisal.manager.name }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

            <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Goals</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      Employee's Rating
                    </th>
                    <th>Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.goals_set" :key="item.id">
                    <th>{{ item.summary }}</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      <v-rating readonly value="item.user_rating"></v-rating>
                    </th>
                    <td>{{ item.user_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

             <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Core values</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      Employee's Rating
                    </th>
                    <th>Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.competencies_set" :key="item.id">
                    <th>{{ item.summary }}</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      <v-rating readonly value="item.user_rating"></v-rating>
                    </th>
                    <td>{{ item.user_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>

             <v-simple-table class="my-5">
              <template v-slot:default>
                <thead>
                  <tr>
                    <th>Skills</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      Employee's Rating
                    </th>
                    <th>Comments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in appraisal.skills_set" :key="item.id">
                    <th>{{ item.description }}</th>
                    <th v-if="appraisal.overall_appraisal.status === 'Stage 2'">
                      <v-rating readonly value="item.user_rating"></v-rating>
                    </th>
                    <td>{{ item.user_comments }}</td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="close"> Close </v-btn>
            <v-btn color="primary" elevation="0" @click="close"> Submit </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'ApproveReviewsVue',
  props: { dialog: Boolean, appraisalId: Number },
  async fetch() {
    await this.$axios
      .$get(`api/appraisals/detail/${this.appraisalId}`)
      .then((res) => {
        this.init(res)
      })
  },
  data() {
    return {
      goals: [],
      appraisal: {},
    }
  },
  methods: {
    close() {
      this.$emit('close-approve-dialog')
    },
    init(appraisal) {
      this.appraisal = appraisal
    },
    print() {
      print()
    },
    submit() {
      // DO something
    },
  },
}
</script>

<style scoped></style>
