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
        <v-btn color="info" @click="createVideoDialog = true"
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
                  <div
                    v-video-player:myVideoPlayer="playerOptions(video)"
                    class="video-player-box"
                  ></div>

                  <v-card-title> {{ video.title }} </v-card-title>
                </v-card-text>

                <v-expansion-panels focusable>
                  <v-expansion-panel>
                    <v-expansion-panel-header>Description</v-expansion-panel-header>
                    <v-expansion-panel-content>
                      {{ video.description }}
                    </v-expansion-panel-content>
                  </v-expansion-panel>
                </v-expansion-panels>
              </v-card>
            </div>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import Vue from 'vue'
import 'video.js/dist/video-js.css'
if (process.browser) {
  const VueVideoPlayer = require('vue-video-player/dist/ssr')
  Vue.use(VueVideoPlayer)
}
export default {
  title: 'Guide',
  layout: 'dashboard-template',
  fetch() {
    this.$axios.$get('api/guide/').then((res) => {
      this.guide = res
    })
  },
  data() {
    return {
      createVideoDialog: false,
      showVideo: false,
      guide: [],
    }
  },
  methods: {
    playerOptions(video) {
      return {
        muted: true,
        width: 250,
        language: 'en',
        liveui: true,
        playbackRates: [0.7, 1.0, 1.5, 2.0],
        sources: [
          {
            type: 'video/mp4',
            src: video.video,
          },
        ],
        poster: video.thumbnail,
        fullscreen: {
          options: {
            navigationUI: 'show',
          },
        },
      }
    },
  },
}
</script>

<style>
#des {
  height: 100px;
  overflow-y: scroll;
}
</style>
