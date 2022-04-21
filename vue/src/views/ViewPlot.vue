<template>
  
  <div id="login" class="text-center">
        
        <h1 class="h3 mb-3 font-weight-normal">Plot Details</h1>
        <!-- <form v-on:submit.prevent> -->
          
                <p>{{ plot.plotId}} </p>

                <p>{{ plot.farmId}} </p>

                <p>{{ plot.plotName}} </p>
            
            
                <p>{{ plot.sunExposure}} </p>

                <p>{{ plot.plotSquareFootage}} </p>
                
                <p>{{ plot.zoneId}} </p>

                <plot-plants-list />
        
    </div>
    
</template>

<script>
import PlotPlantsList from '../components/PlotPlantsList.vue'
export default {
  components: { PlotPlantsList },
  
    data() {
        return {
            plot: {}
        }
    }
    // this needs a headline saying what the Plot Name is at the top
    // and then a list of all the plots in the Plot

}
</script>

<style>

</style>