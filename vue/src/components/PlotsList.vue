<template>
  <div class="temporary - remove">
    <div class="container">
      <div class="header-wrapper">
        <h2 class="header">My Farm</h2>
        <router-link :to="{ name: 'create-plot' }">
          Add New Plot
        </router-link>
      </div>
    </div>

    <div class="plots-list-table">
      <h2>Plots</h2>
      <div class="list-item" v-for="plot in sortedPlots" :key="plot.plotId">
        <div class="name">Plot Name: {{ plot.plotName }}</div>
        <div class="area">Square Feet: {{ plot.plotSquareFootage }}</div>
        <div class="sun">Sun Exposure: {{ plot.sunExposure }}</div>
        <router-link
          v-bind:to="{
            name: 'view-plot',
            params: { plotId: plot.plotId },
          }"
        >
          Edit
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import plotsService from '../services/PlotsService'

export default {
  name: 'plots-list',

  methods: {
    getPlots() {
      plotsService.listPlots().then((response) => {
        this.$store.commit('SET_PLOTS', response.data)
      })
    },
  },
  created() {
    this.getPlots()
  },
  computed: {
    sortedPlots() {
      return this.$store.state.plots
      //don't know if sorted is really needed but it's here for later
    },
  },
}
</script>

<style scoped>
* {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
}
.plot .container {
  margin: 50px 20px;
  padding: 30px;
  background-color: #fff;
  border: 0.7px solid #aaa;
  border-radius: 5px;
}
.header-wrapper {
  display: flex;
  justify-content: space-between;
  max-width: 950px;
  margin: 80px auto 20px;
}
.header-wrapper > a {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  border-radius: 2px;
  background-color: var(--main-green);
  color: white;
  padding: 10px 30px 7px;
  max-height: 30px;
}
.header-wrapper > a:hover {
  text-decoration: none;
}
h2.header {
  margin: 0;
  font-size: 28px;
  width: 150px;
  color: #444;
  /* color: var(--main-green); */
}
.list-items-container {
}
.list-item {
  display: flex;
  /* background-color: #fff; */
  max-width: 1050px;
  font-size: 18px;
}
.list-item > div {
  width: 250px;
}
.plots-list-table {
  border: 0.7px solid #aaa;
  border-radius: 3px;
  background-color: white;
  max-width: 950px;
  margin: 0 auto;
  padding: 50px 90px;
}
.plots-list-table h2 {
  color: #aaa;
}

.plots-list-table table {
  width: 100%;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}

.plots-list-table th {
  font-weight: 500;
  text-align: left;
  color: var(--main-green);
}

.plots-list-table td {
  text-align: left;
}
</style>
