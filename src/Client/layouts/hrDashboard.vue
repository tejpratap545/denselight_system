<template>
  <v-app>
    <v-app-bar class="header" color="#fff" app >
      <v-app-bar-nav-icon></v-app-bar-nav-icon>
    </v-app-bar>
    <v-navigation-drawer permanent app expand-on-hover>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>
            Application
          </v-list-item-title>
          <v-list-item-subtitle>
            subtext
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list>
        <v-list-item link>
          <v-list-item-icon>
            <i class="fas fa-user-ninja"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Manager Test
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <i class="fas fa-people-arrows"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Peer
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <i class="far fa-building"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Department
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <i class="fas fa-user-plus"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Appraisal Status
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <i class="fas fa-user-friends"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Employee Management
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <i class="far fa-file-alt"></i>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Records
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-main class="main-div">
      <div class="pa-10">
        <v-row>
          <v-col cols="3" class="count-div" v-for="(x,y) in countContent" :key="y">
            <div class="outer-border px-5 py-3">
              <p class="">{{x.text}}</p>
              <h1 class="d-flex justify-lg-space-between">
                <i :class="x.icon"></i>
                <span>{{x.count}}</span>
              </h1>
            </div>
          </v-col>
        </v-row>

        <v-container fluid>
          <div class="navDivContent px-5 py-3">            
            <nuxt />
          </div>
        </v-container>
      </div>
      
    </v-main>
  </v-app>
</template>

<script>
export default {
  data(){
    return{
      countContent: [
        {
          text: "Appraisal in Goals Launching",
          icon: "fas fa-rocket",
          count: "0"
        },
        {
          text: "Appraisals in Mid-Year Review",
          icon : "fas fa-calendar",
          count: "0"
        },
        {
          text: "Appraisals in End-Year Review",
          icon : "fas fa-calendar",
          count: "0"
        },
        {
          text: "Pending Peer Reviews",
          icon : "fas fa-list",
          count: "0"
        }
      ],
    }
  },
}
</script>

<style>
  .header{
    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16) !important;
  }
  .main-div{
    background-color: #f9fafb;
  }
  .count-div .outer-border{
    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    border-radius: 5px;
    border-left: 3.5px solid #2952A4;
    background: #fff;
    color: #555;
  }
  .navDivContent{
    border: 1px solid rgba(0,0,0,.0625);
    background: #fff;
  }
</style>
