<template>
  <div v-if="$fetchState.pending">
    <v-skeleton-loader
      class="my-5"
      type=" table-thead, card-heading, card"
    ></v-skeleton-loader>
  </div>
  <div v-else-if="$fetchState.error">An error occurred</div>
  <div v-else>
    <AdminCreateVideo
      v-if="createVideoDialog"
      :dialog="createVideoDialog"
      @close="createVideoDialog = false"
      @reload="$fetch"
    />
    <v-card>
      <v-card-title primary-title>
        Dashboard Guide

        <v-spacer></v-spacer>
        <v-btn
          v-if="$auth.user.user.role == 'Admin'"
          color="info"
          @click="createVideoDialog = true"
          ><v-icon>mdi-plus</v-icon></v-btn
        >
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col
            v-for="video in guide"
            :key="video.id"
            cols="10"
            sm="6"
            md="4"
            lg="3"
          >
            <div>
              <v-card hover class="mx-auto">
                <v-card-text class="text--primary">
                  <div>
                    <video :src="video.video" style="width: 250px" controls />
                  </div>

                  <div style="font-size: 18px; font-weight: 300" class="mt-5">
                    {{ video.title }}
                  </div>
                </v-card-text>

                <v-expansion-panels focusable>
                  <v-expansion-panel>
                    <v-expansion-panel-header
                      >Description</v-expansion-panel-header
                    >
                    <v-expansion-panel-content>
                      <div
                        style="font-size: 12px; font-weight: 300"
                        class="mt-5"
                      >
                        {{ video.description }}
                      </div>
                    </v-expansion-panel-content>
                  </v-expansion-panel>
                </v-expansion-panels>

                <v-card-actions v-if="$auth.user.user.role == 'Admin'">
                  <v-dialog v-model="deleteDialog" width="500">
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn color="error" text dark v-bind="attrs" v-on="on">
                        Delete
                      </v-btn>
                    </template>

                    <v-card>
                      <v-card-title> Delete {{ video.title }} </v-card-title>

                      <v-divider></v-divider>

                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="info" text @click="deleteDialog = false">
                          Close
                        </v-btn>
                        <v-btn
                          color="primary"
                          text
                          @click="deleteVideo(video.id)"
                        >
                          Delete
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </v-card-actions>
              </v-card>
            </div>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  title: 'Guide',
  layout: 'dashboard-template',
  async fetch() {
    await this.$axios.$get('api/guide/').then((res) => {
      this.guide = res
    })
  },
  data() {
    return {
      createVideoDialog: false,
      showVideo: false,
      guide: [],
      deleteDialog: false,
    }
  },
  methods: {
    deleteVideo(id) {
      this.$axios
        .delete(`api/guide/${id}/`)
        .then(() => {
          this.$notifier.showMessage({
            content: `Successfully deleted Video `,
            color: 'info',
          })

          this.$fetch()
        })
        .catch((error) => {
          console.log(error)
          this.$notifier.showMessage({
            content: 'Error deleting Video',
            color: 'error',
          })
        })
        .finally(() => {
          this.deleteDialog = false
        })
    },
  },
}
</script>
