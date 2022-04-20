<template>

  <div class="plot-plants-list-table">    
  <table>
    <thead>
      <tr>
        <!-- <th>&nbsp;</th>  -->

        
        <th></th>
        <!-- <th>Plot Plant ID</th>  -->
        <th>Square Area</th>
        <th>Cost</th>
        <th>Hardiness Zone</th>
        <th>Sun Requirements</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="plant in sortedPlants" :key="plant.plantId">        <!--  need to make it the plot_plants_id -->
        
        <td> 
            <img :src="plant.imageUrl" class="plant-image" />  
            <span class="name"> {{ plant.commonName }}</span>                       
        </td>
        <!-- <td class="name">{{ plant.plots_plant_id }}</td>         it's plots_plant_id in the database -->
        <td class="square-area">{{plant.squareArea}}</td>
        <td class="cost">{{plant.cost}}</td>    
        <td class="hardiness-zone">{{plant.temporaryUsdaZones}}</td>
        <td class="sun-requirements">{{plant.sunRequirements}}</td>
        <!-- 
        <td>
            <button v-on:click="viewPlant(plant.id)">Edit</button>&nbsp;
        </td>
         -->
        <td>
        <!-- <router-link :to="{ name: 'plant' }"
        >View
        </router-link> -->
        </td>
        <td>
          <!--  plantId is the param so it had to be written out as plant.plantId (or object.property) -->
        <!-- <router-link v-bind:to="{ name: 'edit-plant', params: {plantId: plant.plantId} }"   
        >Edit
        </router-link> -->
        </td>
      </tr>
    </tbody>  
  </table>
  </div>
</template>


<script>

import plotsService from '../services/PlotsService'

export default {

    name: "plants-list",    
    methods: {
        getPlotPlants() {
            plotsService.getPlantsByPlot(this.$route.params.plotId).then(response => {
                this.$store.commit("SET_PLANTS", response.data);    //SET_PLOT_PLANTS
            });
        }
    },
    created() {
        this.getPlotPlants();

    },
    computed: {
        sortedPlants() {
            return this.$store.state.plants       //plot_plants

            //don't know if sorted is really needed but it's here for later          
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