<template>
  <div>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader
        class="my-5"
        type=" table-thead, card-heading, card"
      ></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <div v-else class="ma-5">
      <v-card flat>
        <v-card-title>
          <h3 class="my-5 text-center">Performance</h3>
        </v-card-title>

        <div class="mx-5 py-5">
          <v-row>
            <v-col cols="3">Select Appraisals</v-col>
            <v-col>
              <v-combobox
                v-model="selected_data.appraisals"
                :items="appraisals"
                item-text="name"
                item-value="id"
                label="Select Appraisals"
                chips
                multiple
              ></v-combobox>
            </v-col>
          </v-row>

          <v-row>
            <v-col cols="3">Select Department</v-col>
            <v-col>
              <v-combobox
                v-model="selected_data.departments"
                :items="departments"
                item-text="name"
                item-value="id"
                label="Select Department"
                chips
                multiple
              ></v-combobox>
            </v-col>
          </v-row>

          <v-btn color="primary" @click="filter">
            <v-icon>mdi-filter</v-icon> Filter
          </v-btn>
        </div>

        <div v-if="performance_data != null" class="ma-5">
          <h3 class="my-2 text-center">Manager ratings</h3>

          <v-row>
            <v-col>
              <v-row>
                <v-col>Performance rating</v-col>
                <v-col>Employees</v-col>
                <v-col>% of Pop</v-col>
              </v-row>

              <v-row>
                <v-col>CM</v-col>
                <v-col>{{ performance_data.a1 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.a1 /
                        (performance_data.a1 +
                          performance_data.a2 +
                          performance_data.a3 +
                          performance_data.a4 +
                          performance_data.a5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT+</v-col>
                <v-col>{{ performance_data.a2 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.a2 /
                        (performance_data.a1 +
                          performance_data.a2 +
                          performance_data.a3 +
                          performance_data.a4 +
                          performance_data.a5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT</v-col>
                <v-col>{{ performance_data.a3 }}</v-col>
                <v-col
                  >{{
                    parseInt(
                      (performance_data.a3 /
                        (performance_data.a1 +
                          performance_data.a2 +
                          performance_data.a3 +
                          performance_data.a4 +
                          performance_data.a5)) *
                        100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT-</v-col>
                <v-col>{{ performance_data.a4 }}</v-col>
                <v-col
                  >{{
                    parseInt(
                      (performance_data.a4 /
                        (performance_data.a1 +
                          performance_data.a2 +
                          performance_data.a3 +
                          performance_data.a4 +
                          performance_data.a5)) *
                        100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>RI</v-col>
                <v-col>{{ performance_data.a5 }}</v-col>
                <v-col
                  >{{
                    parseInt(
                      (performance_data.a5 /
                        (performance_data.a1 +
                          performance_data.a2 +
                          performance_data.a3 +
                          performance_data.a4 +
                          performance_data.a5)) *
                        100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>Grand total</v-col>
                <v-col>{{
                  performance_data.a1 +
                  performance_data.a2 +
                  performance_data.a3 +
                  performance_data.a4 +
                  performance_data.a5
                }}</v-col>
              </v-row>
            </v-col>
            <v-col>
              <BarChart
                v-if="loaded"
                :height="300"
                :chartdata="chartdata_manager"
              />
            </v-col>
            <v-col>
              <LineChart
                v-if="loaded"
                :height="300"
                :chartdata="chartdata_manager_bell"
              />
            </v-col>
          </v-row>

          <h3 class="my-2 text-center">HOD ratings</h3>

          <v-row>
            <v-col>
              <v-row>
                <v-col>Performance rating</v-col>
                <v-col>Employees</v-col>
                <v-col>% of Pop</v-col>
              </v-row>

              <v-row>
                <v-col>CM</v-col>
                <v-col>{{ performance_data.b1 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.b1 /
                        (performance_data.b1 +
                          performance_data.b2 +
                          performance_data.b3 +
                          performance_data.b4 +
                          performance_data.b5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT+</v-col>
                <v-col>{{ performance_data.b2 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.b2 /
                        (performance_data.b1 +
                          performance_data.b2 +
                          performance_data.b3 +
                          performance_data.b4 +
                          performance_data.b5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT</v-col>
                <v-col>{{ performance_data.b3 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.b3 /
                        (performance_data.b1 +
                          performance_data.b2 +
                          performance_data.b3 +
                          performance_data.b4 +
                          performance_data.b5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>CT-</v-col>
                <v-col>{{ performance_data.b4 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.b4 /
                        (performance_data.b1 +
                          performance_data.b2 +
                          performance_data.b3 +
                          performance_data.b4 +
                          performance_data.b5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>RI</v-col>
                <v-col>{{ performance_data.b5 }}</v-col>
                <v-col
                  >{{
                    (
                      (performance_data.b5 /
                        (performance_data.b1 +
                          performance_data.b2 +
                          performance_data.b3 +
                          performance_data.b4 +
                          performance_data.b5)) *
                      100
                    ).toFixed(2)
                  }}
                  %</v-col
                >
              </v-row>

              <v-row>
                <v-col>Grand total</v-col>
                <v-col>{{
                  performance_data.b1 +
                  performance_data.b2 +
                  performance_data.b3 +
                  performance_data.b4 +
                  performance_data.b5
                }}</v-col>
              </v-row>
            </v-col>
            <v-col>
              <BarChart
                v-if="loaded"
                :height="300"
                :chartdata="chartdata_hod"
              />
            </v-col>
            <v-col>
              <LineChart
                v-if="loaded"
                :height="300"
                :chartdata="chartdata_hod_bell"
              />
            </v-col>
          </v-row>
        </div>
      </v-card>
    </div>
  </div>
</template>

<script>
import BarChart from '../../components/BarChart'
import LineChart from '../../components/LineChart'

export default {
  name: 'Performance',
  layout: 'dashboard-template',
  components: { BarChart, LineChart },

  async fetch() {
    this.appraisals = await this.$axios.$get('api/overallAppraisal/')
    this.departments = await this.$axios.$get('api/department/')
  },
  data() {
    return {
      appraisals: [],
      departments: [],

      selected_data: {
        appraisals: [],
        departments: [],
      },

      performance_data: null,
      loaded: false,

      chartdata_manager: {
        datasets: [],
      },

      chartdata_manager_bell: {
        datasets: [],
      },

      chartdata_hod: {
        datasets: [],
      },

      chartdata_hod_bell: {
        datasets: [],
      },
    }
  },
  methods: {
    async filter() {
      this.performance_data = await this.$axios.$post('api/bellcurve/data', {
        appraisal_list: this.selected_data.appraisals.map((x) => x.id),
        department_list: this.selected_data.departments.map((x) => x.id),
      })

      this.chartdata_manager = {
        datasets: [
          {
            label: 'CM',
            backgroundColor: '#f87979',
            data: [this.performance_data.a1],
          },
          {
            label: 'CT+',
            backgroundColor: '#f87979',
            data: [this.performance_data.a2],
          },
          {
            label: 'CT',
            backgroundColor: '#f87979',
            data: [this.performance_data.a3],
          },
          {
            label: 'CT-',
            backgroundColor: '#f87979',
            data: [this.performance_data.a4],
          },
          {
            label: 'RI',
            backgroundColor: '#f87979',
            data: [this.performance_data.a5],
          },
        ],
      }

      this.chartdata_hod = {
        datasets: [
          {
            label: 'CM',
            backgroundColor: '#4c99e6',
            data: [this.performance_data.b1],
          },
          {
            label: 'CT+',
            backgroundColor: '#4c99e6',
            data: [this.performance_data.b2],
          },
          {
            label: 'CT',
            backgroundColor: '#4c99e6',
            data: [this.performance_data.b3],
          },
          {
            label: 'CT-',
            backgroundColor: '#4c99e6',
            data: [this.performance_data.b4],
          },
          {
            label: 'RI',
            backgroundColor: '#4c99e6',
            data: [this.performance_data.b5],
          },
        ],
      }

      const u1 =
        (this.performance_data.a1 +
          this.performance_data.a2 +
          this.performance_data.a3 +
          this.performance_data.a4 +
          this.performance_data.a5) /
        5

      const sd1 = Math.sqrt(
        ((this.performance_data.a1 - u1) ** 2 +
          (this.performance_data.a2 - u1) ** 2 +
          (this.performance_data.a3 - u1) ** 2 +
          (this.performance_data.a4 - u1) ** 2 +
          (this.performance_data.a5 - u1) ** 2) /
          5
      )

      const bell1 = []
      for (var i = -3 * sd1; i < 3 * sd1; i += 0.5) {
        bell1.push(
          Math.E ** ((-1 / 2) * (i - u1 / sd1) ** 2) /
            (sd1 * Math.sqrt(2 * Math.PI))
        )
      }

      this.chartdata_manager_bell = {
        datasets: [
          {
            label: 'bell curve',
            backgroundColor: '#f87979',
            data: bell1,
          },
        ],
      }

      const u2 =
        (this.performance_data.b1 +
          this.performance_data.b2 +
          this.performance_data.b3 +
          this.performance_data.b4 +
          this.performance_data.b5) /
        5

      const sd2 = Math.sqrt(
        ((this.performance_data.b1 - u2) ** 2 +
          (this.performance_data.b2 - u2) ** 2 +
          (this.performance_data.b3 - u2) ** 2 +
          (this.performance_data.b4 - u2) ** 2 +
          (this.performance_data.b5 - u2) ** 2) /
          5
      )

      const bell2 = []
      for (var i = -3 * sd2; i < 3 * sd2; i += 0.5) {
        bell2.push(
          Math.E ** ((-1 / 2) * (i - u2 / sd2) ** 2) /
            (sd2 * Math.sqrt(2 * Math.PI))
        )
      }

      this.chartdata_hod_bell = {
        datasets: [
          {
            label: 'bell curve',
            backgroundColor: '#4c99e6',
            data: bell2,
          },
        ],
      }

      this.loaded = true
    },
  },
}
</script>

<style></style>
