<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent>
      <v-card>
        <div v-if="$fetchState.pending">
          <v-skeleton-loader
            class="px-10 my-5"
            type=" table-thead, card-heading, card"
          ></v-skeleton-loader>
        </div>
        <div v-else-if="$fetchState.error">An error occurred</div>
        <v-card-text v-else>
          <v-card-title class="headline">
            {{ appraisal.name }}
          </v-card-title>

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
          <v-row>
            <v-col cols="12" sm="6">
              <v-select
                v-model="currentSupervisor.id"
                item-text="name"
                item-value="id"
                :items="managers"
                label="Change Supervisor"
              ></v-select>
            </v-col>
            <v-col>
              <v-btn color="info" @click="changeManager"> Change Manager</v-btn>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" sm="6">
              <v-select
                v-model="currentStage"
                item-text="name"
                return-object
                :items="appraisalStatus"
                label="Change Appraisal Stage"
              ></v-select>
            </v-col>

            <v-col>
              <v-btn color="info" @click="changeStage"> Change Stage</v-btn>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="info" @click="$emit('close')"> Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
export default {
  name: 'AdminChangeAppraisalStatus',
  props: {
    appraisal: {
      type: Object,
      default() {
        return {
          id: 1,
          name: '',
          manager: 1,
          status: '',
          completion: '',
          mid_year_completion: 'Completed',
          overallAppraisalStatus: '',
          employee: '',
        }
      },
    },
    dialog: {
      type: Boolean,
      default: false,
    },
  },
  async fetch() {
    this.managers = await this.$axios.$get('/api/manager/short/list')
  },
  data() {
    return {
      managers: '',
      currentSupervisor: 1,
      currentStage: '',

      appraisalStatus: [
        {
          id: 0,
          name: 'Goal Settings Employee Stage',
          status: {
            status: 'Employee',
            mid_year_completion: 'Uncompleted',
            completion: 'null',
          },
        },
        {
          id: 1,
          name: 'Goal Settings Manager Stage',
          status: {
            status: 'Manager',
            mid_year_completion: 'Uncompleted',
            completion: 'null',
          },
        },
        {
          id: 2,
          name: 'Goal Settings Stage Approved',
          status: {
            status: 'S1BEmployee',
            mid_year_completion: 'Uncompleted',
            completion: 'null',
          },
        },
        {
          id: 3,
          name: 'Mid Year Employee Stage',
          status: {
            status: 'S2BEmployee',
            mid_year_completion: 'Uncompleted',
            completion: 'null',
          },
        },
        {
          id: 4,
          name: 'Mid Year Manager Stage',
          status: {
            status: 'S1BManager',
            mid_year_completion: 'Uncompleted',
            completion: 'null',
          },
        },
        {
          id: 5,
          name: 'Mid Year Approved',
          status: {
            status: 'S1BManager',
            mid_year_completion: 'Completed',
            completion: 'null',
          },
        },
        {
          id: 6,
          name: 'End Year Employee Stage',
          status: {
            status: 'S1BManager',
            mid_year_completion: 'Completed',
            completion: 'Ecompleted',
          },
        },
        {
          id: 7,
          name: 'End Year Manager Stage',
          status: {
            status: 'S2Manager',
            mid_year_completion: 'Completed',
            completion: 'MCompleted',
          },
        },
        {
          id: 8,
          name: 'End Year Board Rating Stage',
          status: {
            status: 'Approved',
            mid_year_completion: 'Completed',
            completion: 'MCompleted',
          },
        },
        {
          id: 9,
          name: 'End Year Approved',
          status: {
            status: 'Approved',
            mid_year_completion: 'Completed',
            completion: 'BCompleted',
          },
        },
      ],
    }
  },

  mounted() {
    this.currentSupervisor = { ...this.appraisal.manager }
    if (this.appraisal.status === 'Employee') {
      this.currentStage = this.appraisalStatus[0]
    } else if (this.appraisal.status === 'Manager') {
      this.currentStage = this.appraisalStatus[1]
    } else if (
      this.appraisal.mid_year_completion === 'Completed' &&
      this.appraisal.overallAppraisalStatus === 'Stage 1B'
    ) {
      this.currentStage = this.appraisalStatus[5]
    } else if (
      this.appraisal.status === 'S1BEmployee' ||
      this.appraisal.status === 'S2BEmployee'
    ) {
      this.currentStage = this.appraisalStatus[3]
    } else if (
      (this.appraisal.status === 'S1BManager' &&
        this.appraisal.overallAppraisalStatus === 'Stage 1B') ||
      this.appraisal.status === 'S1BReview'
    ) {
      this.currentStage = this.appraisalStatus[4]
    } else if (
      this.appraisal.status === 'Approved' &&
      this.appraisal.completion === 'BCompleted'
    ) {
      this.currentStage = this.appraisalStatus[9]
    } else if (
      this.appraisal.status === 'Approved' &&
      this.appraisal.completion === 'MCompleted'
    ) {
      this.currentStage = this.appraisalStatus[8]
    } else if (
      this.appraisal.status === 'S2Manager' &&
      (this.appraisal.completion === 'MCompleted' ||
        this.appraisal.completion === 'Ecompleted')
    ) {
      this.currentStage = this.appraisalStatus[7]
    } else if (
      (this.appraisal.status === 'S2Employee' &&
        this.appraisal.completion === 'Ecompleted') ||
      (this.appraisal.status === 'S1BManager' &&
        this.appraisal.overallAppraisalStatus === 'Stage 2')
    ) {
      this.currentStage = this.appraisalStatus[6]
    }
  },

  activated() {
    if (this.$fetchState.timestamp <= Date.now() - 5 * 60000) {
      this.$fetch()
    }
  },
  methods: {
    changeStage() {
      this.$axios
        .$patch(
          `api/appraisals/admin/${this.appraisal.id}/`,
          this.currentStage.status
        )
        .then(() => {
          this.$notifier.showMessage({
            content: 'You  have   Successfully shifted appraisal .',
            color: 'info',
          })

          this.$emit('reload')
          this.$emit('close')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error found please validate or try again',
            color: 'error',
          })
        })
        .finally(() => {
          this.$emit('close')
        })
    },

    changeManager() {
      this.$axios
        .$patch(`api/appraisals/admin/${this.appraisal.id}/`, {
          manager: this.currentSupervisor.id,
        })
        .then(() => {
          this.$notifier.showMessage({
            content: 'You  have   Successfully changed  Manager .',
            color: 'info',
          })

          this.$emit('reload')
          this.$emit('close')
        })
        .catch(() => {
          this.$notifier.showMessage({
            content: 'An error found please validate or try again',
            color: 'error',
          })
        })
        .finally(() => {
          this.$emit('close')
        })
    },
  },
}
</script>

<style scoped></style>
