<template>
  
  <table>
    <thead>
      <tr>
        <!-- <th>&nbsp;</th>  -->
         
        <th></th>
        <th>Square Area</th>
        <th>Cost</th>
        <th>Hardiness Zone</th>
        <th>Sun Requirements</th>        
      </tr>
    </thead>
    <tbody>
      <tr v-for="plant in plants" :key="plant.id" v-on:click="viewPlant(plant.id)">        
        <td> 
            <img :src="plant.imageUrl" class="plant-image" />  
            <span class="name"> {{ plant.commonName }}</span>                       
        </td>
        <!--  <td class="name">{{ plant.commonName }}</td>   -->      
        <td class="square-area">{{plant.squareArea}}</td>
        <td class="cost">{{plant.cost}}</td>    
        <td class="hardiness-zone">{{plant.temporaryUsdaZones}}</td>
        <td class="sun-requirements">{{plant.sunRequirements}}</td>
      </tr>
    </tbody>  
  </table>
</template>


<script>

import plants from '../services/PlantsService'

export default {

    name: "plants-list",
    data() {
        return {
        plants: []
        };
    },
    methods: {
        viewPlant(id) {
        this.$router.push(`/plant/${id}`);
        }
    },
    created() {
        plants.list().then((response) => {
        this.plants = response.data;
        });
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

</style>