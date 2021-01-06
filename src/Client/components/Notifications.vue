<template>
  <v-menu :close-on-content-click="false" offset-y>
    <template v-slot:activator="{ on, attrs }">
      <v-btn v-bind="attrs" v-on="on" icon>
        <v-badge :value="badge" dot>
          <v-icon>mdi-bell-outline</v-icon>
        </v-badge>
      </v-btn>
    </template>

    <div v-if="$fetchState.pending">
      <v-skeleton-loader type="card@3"></v-skeleton-loader>
    </div>
    <div v-else-if="$fetchState.error">An error occurred</div>
    <v-card v-else class="notification-body">
      <div>
        <v-row
          v-for="notification in notifications"
          :key="notification.id"
          class="mx-2"
        >
          <v-col class="mx-2" cols="2">
            <v-btn
              @click="handleNotification(notification)"
              :color="notification.seen ? 'error' : 'primary'"
              icon
              outlined
            >
              <v-icon v-if="!notification.seen">mdi-check-outline</v-icon>
              <v-icon v-else>mdi-delete-outline</v-icon>
            </v-btn>
          </v-col>

          <v-col cols="9">
            <div class="subtitle-1">
              {{ notification.title }}
            </div>
            <small class="caption text--secondary">
              {{ notification.description }}
            </small>
          </v-col>
        </v-row>
      </div>

      <p class="text-center" v-if="notifications.length == 0">No Notifications yet</p>
    </v-card>
  </v-menu>
</template>

<script>
export default {
  async fetch() {
    try {
      this.notifications = await this.$axios.$get('/api/notification/')
      this.notifications.forEach((r) => {
        if (!r.seen) this.badge = true
      })
    } catch (error) {
      console.log(error)
    }
  },
  data() {
    return {
      badge: false,
      notifications: [],
    }
  },
  methods: {
    handleNotification(notification) {
      if (!notification.seen) {
        notification.seen = true

        this.$axios
          .patch(`/api/notification/${notification.id}/`, notification)
          .then((res) => {
            this.$notifier.showMessage({
              content: 'Notification dismissed',
              color: 'info',
            })
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error occured',
              color: 'error',
            })
          })
      } else {
        this.$axios
          .delete(`/api/notification/${notification.id}/`)
          .then((res) => {
            this.notifications = this.notifications.filter((n) => {
              return n.id !== notification.id
            })

            this.$notifier.showMessage({
              content: 'Notification delete',
              color: 'info',
            })
          })
          .catch((error) => {
            this.$notifier.showMessage({
              content: 'Error occured',
              color: 'error',
            })
          })
      }
    },
  },
}
</script>

<style>
.notification-body {
  width: 300px;
  height: 400px;
  overflow-y: scroll;
}
</style>
