<template>
  <div>
      <div class="px-10 my-5">
        <v-tabs background-color="transparent" color="#2952A4" centered grow v-model="tabData">
          <v-tab>Department Details</v-tab>
          <v-tab>Department Goals and Core Values</v-tab>
          <v-tab>Subordinate Appraisal</v-tab>
        </v-tabs>
      </div>
  </div>
</template>

<script>
export default {
    name: 'Department',
    layout: 'hrDashboard',
    data(){
        return{
            tabData: null,
        }
    }
}
</script>

<style>

</style>