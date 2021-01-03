<template>
  <v-dialog v-model="dialog" scrollable max-width="800">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" icon v-bind="attrs" v-on="on">
        <v-icon>mdi-chat-outline</v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-toolbar color="primary" dark>
        <b>Peer Queries</b>
        <v-spacer></v-spacer>
        <v-btn icon @click="dialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>

      <v-card-text>
        <v-row>
          <v-col> Query : {{ query.title1 }} </v-col>
          <v-col>
            <v-textarea v-model="query.strength1" outlined></v-textarea>
          </v-col>
        </v-row>
        <v-row>
          <v-col> Query : {{ query.title2 }} </v-col>
          <v-col>
            <v-textarea v-model="query.strength2" outlined></v-textarea>
          </v-col>
        </v-row>
        <v-row>
          <v-col> Query : {{ query.title3 }} </v-col>
          <v-col>
            <v-textarea v-model="query.strength3" outlined></v-textarea>
          </v-col>
        </v-row>
      </v-card-text>

      <v-card-actions>
        <v-btn color="primary" v-if="editMode == null" @click="rQuery()"> Submit Query </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['id', 'editMode'],
  async fetch() {
    try {
      this.query = await this.$axios.$get(`/api/peerappraisal/${this.id}`)
      console.log(this.query)
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      dialog: false,
      query: {},
    }
  },
  methods: {
    rQuery() {
      this.dialog = false
      this.query.completion = 'Completed'

      this.$axios
        .$patch(`/api/peerappraisal/${this.id}`, this.query)
        .then((_) => {
          this.$notifier.showMessage({
            content: 'Success resolving query',
            color: 'info',
          })
        })
        .catch((error) => {
          this.$notifier.showMessage({
            content: 'Error resolving query',
            color: 'error',
          })
          console.log(error, this.appraisal)
        })
    },
  },
}
</script>

<style>
</style>
