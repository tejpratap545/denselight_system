<template>
  <v-dialog v-model="dialog" width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        color="success"
        outlined
        elevation="0"
        dark
        v-bind="attrs"
        v-on="on"
      >
        Bulk Upload Employees
      </v-btn>
    </template>
    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="article, actions"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else>
      <v-card-title class="headline py-5"> Bulk Upload Employees </v-card-title>

      <v-card-text>
        <v-form>
          <v-file-input
            v-model="file"
            label="Employees file"
            outlined
            :rules="[rules.required]"
          ></v-file-input>
          <v-text-field
            v-model="password"
            label="Common password"
            placeholder="Placeholder"
            outlined
          ></v-text-field>
        </v-form>

        <v-card v-if="errors.length != 0">
          <v-card-title class="headline py-5">Errors</v-card-title>
          >
          <v-card-text>
            <v-list dense>
              <v-list-item v-for="(error, i) in errors" :key="i">
                <v-list-item-content>
                  {{ error }}
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green darken-1" text @click="close"> Cancel </v-btn>
        <v-btn color="green darken-1" text @click="submit"> Submit </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import global from '~/mixins/global'

export default {
  mixins: [global],
  async fetch() {
    try {
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      file: null,
      password: '',
      errors: [],
    }
  },
  methods: {
    close() {
      this.dialog = false
    },
    submit() {
      const bodyFormData = new FormData()
      bodyFormData.append('file', this.file)
      bodyFormData.append('password', this.password)

      // TODO : Replace URL
      this.$axios
        .$post('url', bodyFormData)
        .then((res) => {
          this.$notifier.showMessage({
            content: 'Data uploaded',
            color: 'info',
          })
          this.errors = res.errors
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Data upload failed',
            color: 'error',
          })
        })
    },
  },
}
</script>
