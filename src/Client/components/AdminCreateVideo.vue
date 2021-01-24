<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <v-card-title class="headline"> Create Video </v-card-title>
        <v-card-text>
          <v-text-field
            v-model="createVideo.title"
            label="Video Title "
          ></v-text-field>

          <v-textarea
            v-model="createVideo.description"
            label="Video Objective "
            outlined
          ></v-textarea>

          <v-file-input
            v-model="createVideo.thumbnail"
            show-size
            label="Choose thumbnail"
          ></v-file-input>
          <v-file-input
            v-model="createVideo.video"
            show-size
            label="Choose video"
          ></v-file-input>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
          <v-btn :loading="loading" color="green darken-1" text @click="submit">
            Create
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
export default {
  props: {
    dialog: Boolean,
  },
  data() {
    return {
      loading: false,
      createVideo: {
        title: '',
        description: '',
        thumbnail: '',
        video: '',
      },
    }
  },
  mounted() {},

  methods: {
    close() {
      this.$emit('close')
    },

    submit() {
      this.loading = true
      const bodyFormData = new FormData()
      bodyFormData.append('video', this.createVideo.video)
      bodyFormData.append('thumbnail', this.createVideo.thumbnail)
      bodyFormData.append('title', this.createVideo.title)
      bodyFormData.append('description', this.createVideo.description)

      const url = '/api/guide/'
      this.$axios
        .$post(url, bodyFormData)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Success creating video',
            color: 'info',
          })

          this.close()
          this.$emit('reload')
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error creating video',
            color: 'error',
          })
        })
        .finally(() => {
          this.loading = false
        })
    },
  },
}
</script>
