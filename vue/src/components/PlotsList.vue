<template>
  
 
   <div class="farm">
    <h2>My Plots</h2>
    <div class="plots">
      <div
        class="plot"
        v-for="plot in sortedPlots"
        v-bind:key="plot.plotId"
        v-on:click="viewPlotDetails(plot.plotId)"          
      >
        <div class="header">
          <h3>{{ plot.plotName }}</h3>
          <!-- <img :src="plot.avatar" class="avatar" />      maybe implement something later-->
        </div>
        <div class="plot-summary"> 
            <ul id="summary-list">
                <li>Sun Requirements: {{ plot.sunExposure }}</li>
                <li>Square Footage: {{ plot.plotSquareFootage }}</li>                
            </ul>
        </div>
       
      </div>
    </div>
  </div>
  
</template>

 <!-- v-for="plot in this.$store.state.plots"  :key="plot.plotId" -->
       
 <!-- v-bind:style="{ 'background-color': plot.backgroundColor }"/> -->



<script>
import plotsService from "../services/PlotsService"

export default {
    name: "plots-list",
    methods: {
        getPlots() {
            plotsService.listPlots().then(response => {
                this.$store.commit("SET_PLOTS", response.data);
            });
        }
    },
     created() {
        this.getPlots();
    },    
    computed: {
        sortedPlots() {
            return this.$store.state.plants  
            //don't know if sorted is really needed but it's here for later          
        }
}
}
</script>

<style>

h2.plots-list {
    color: white;
    text-shadow: 1px 1px 3px #000000;
}


</style>