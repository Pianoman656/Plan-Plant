<template>
  
  <div id="view-plot" class="text-center">
        
        <h1 class="h3 mb-3 font-weight-normal">Plot Details {{plot.plotName}} </h1>
        
        <plot-plants-list />
        <suggest-plants-for-plot ></suggest-plants-for-plot>
        
    </div>
    
</template> 

<script>
import PlotPlantsList from '../components/PlotPlantsList.vue'
import SuggestPlantsForPlot from "../components/Suggestions/SuggestPlantsForPlot.vue"
//import SuggestPlants from '../components/Suggestions/SuggestPlants.vue'
//import plotsService from '../services/PlotsService'

export default {
  components:  {
    PlotPlantsList ,
    SuggestPlantsForPlot
  },
    data() {
        return {
            plot: {},
        }
    
    },
    // methods: {
    //     getPlot() {
    //         plotsService.getPlot(this.$route.params.plotId).then(response => )
    //     }
    //}

    // this needs a headline saying what the Plot Name is at the top
    // and then a list of all the plots in the Plot

}
</script>

<style>

</style>