<template>

  <div class="plot-plants-list-table">    
  <table>
    <thead>
      <tr>
        <th></th>        
        <th>Square Area</th>
        <th>Cost</th>
        <th>Hardiness Zone</th>
        <th>Sun Requirements</th>        
      </tr>
    </thead>
    <tbody>
      <tr v-for="plant in plantsInPlot" :key="plant.plotPlantId">       
        
        <td> 
            <img :src="plant.imageUrl" class="plant-image" />  
            <span class="name"> {{ plant.commonName }}</span>                       
        </td>        
        <td class="square-area">{{plant.squareArea}}</td>
        <td class="cost">{{plant.cost}}</td>    
        <td class="hardiness-zone">{{plant.temporaryUsdaZones}}</td>
        <td class="sun-requirements">{{plant.sunRequirements}}</td>
        <td>        
        </td>
        <td>
        </td>
      </tr>
    </tbody>  
  </table>
  </div>
</template>


<script>

import plotsService from '../services/PlotsService'

export default {

    name: "plot-plants-list",    
    methods: {
        getPlotPlants() {
            plotsService.getPlantsByPlot(this.$route.params.plotId).then(response => {
                this.$store.commit("SET_PLOT_PLANTS", response.data);    
            });
        },
        setCurrentPlot() {
          this.$store.commit("SET_CURRENT_PLOT_ID", this.$route.params.plotId)
        }
    },
    created() {
        this.getPlotPlants(),
        this.setCurrentPlot()
    },
    computed: {
        plantsInPlot() {
            return this.$store.state.plot_plants                            
        }
    }
}
</script>

<style>

table {
  width: 100%;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}

th {
  font-family: "Work Sans", sans-serif;
  font-weight: 500;
  text-align: left;
  color: #019875;
}

.plant-image {
    height: 4%;
    width: 4%;
}

.plot-plants-list-table {
background-color: white;
}

</style>