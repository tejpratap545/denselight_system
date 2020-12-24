<template>
  <v-app>
    <v-app-bar class="header" color="#fff" app>
      <v-app-bar-nav-icon></v-app-bar-nav-icon>
    </v-app-bar>
    <v-navigation-drawer permanent app>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title> Application </v-list-item-title>
          <v-list-item-subtitle> subtext </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list>
        <v-list-item
          link
          @click="
            navManagerTest = true
            navPeer = false
            navDepartment = false
            navAppraisalStatus = false
            navEmployeeManagement = false
            navRecords = false
          "
        >
          <v-list-item-icon>
            <i class="fas fa-user-ninja"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Manager Test </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          link
          @click="
            navManagerTest = false
            navPeer = true
            navDepartment = false
            navAppraisalStatus = false
            navEmployeeManagement = false
            navRecords = false
          "
        >
          <v-list-item-icon>
            <i class="fas fa-people-arrows"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Peer </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          link
          @click="
            navManagerTest = false
            navPeer = false
            navDepartment = true
            navAppraisalStatus = false
            navEmployeeManagement = false
            navRecords = false
          "
        >
          <v-list-item-icon>
            <i class="far fa-building"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Department </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          link
          @click="
            navManagerTest = false
            navPeer = false
            navDepartment = false
            navAppraisalStatus = true
            navEmployeeManagement = false
            navRecords = false
          "
        >
          <v-list-item-icon>
            <i class="fas fa-user-plus"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Appraisal Status </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          link
          @click="
            navManagerTest = false
            navPeer = false
            navDepartment = false
            navAppraisalStatus = false
            navEmployeeManagement = true
            navRecords = false
          "
        >
          <v-list-item-icon>
            <i class="fas fa-user-friends"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Employee Management </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          link
          @click="
            navManagerTest = false
            navPeer = false
            navDepartment = false
            navAppraisalStatus = false
            navEmployeeManagement = false
            navRecords = true
          "
        >
          <v-list-item-icon>
            <i class="far fa-file-alt"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title> Records </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-main class="main-div">
      <div class="pa-10">
        <v-row>
          <v-col
            v-for="(x, y) in countContent"
            :key="y"
            cols="3"
            class="count-div"
          >
            <div class="outer-border px-5 py-3">
              <p class="">{{ x.text }}</p>
              <h1 class="d-flex justify-lg-space-between">
                <i :class="x.icon"></i>
                <span>{{ x.count }}</span>
              </h1>
            </div>
          </v-col>
        </v-row>

        <v-container fluid>
          <div v-show="navManagerTest" class="navDivContent pa-5">
            <p>No Data to show</p>
          </div>
          <div v-show="navPeer" class="navDivContent pa-5">
            <h1>Second Div</h1>
          </div>
          <div v-show="navDepartment">
            <h1>Third Div</h1>
          </div>
          <div v-show="navAppraisalStatus">
            <h1>Fourth Div</h1>
          </div>
          <div v-show="navEmployeeManagement">
            <h1>Fifth Div</h1>
          </div>
          <div v-show="navRecords">
            <h1>Sixth Div</h1>
          </div>
        </v-container>
      </div>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'HrVue',
  data() {
    return {
      countContent: [
        {
          text: 'Appraisal in Goals Launching',
          icon: 'fas fa-rocket',
          count: '0',
        },
        {
          text: 'Appraisals in Mid-Year Review',
          icon: 'fas fa-calendar',
          count: '0',
        },
        {
          text: 'Appraisals in End-Year Review',
          icon: 'fas fa-calendar',
          count: '0',
        },
        {
          text: 'Pending Peer Reviews',
          icon: 'fas fa-list',
          count: '0',
        },
      ],
      navManagerTest: true,
      navPeer: false,
      navDepartment: false,
      navAppraisalStatus: false,
      navEmployeeManagement: false,
      navRecords: false,
    }
  },
  methods: {
    toggleVal() {
      console.log(this.navDivFirst, this.navDivSecond, this.navDivThird)
    },
  },
}
</script>

<style>
.header {
  box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16) !important;
}
.main-div {
  background-color: #f9fafb;
}
.count-div .outer-border {
  box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
  border-radius: 5px;
  border-left: 3.5px solid #2952a4;
  background: #fff;
  color: #555;
}
.navDivContent {
  border: 1px solid rgba(0, 0, 0, 0.0625);
  background: #fff;
}
</style>
