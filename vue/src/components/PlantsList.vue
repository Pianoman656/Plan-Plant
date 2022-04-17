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
        <th>Actions</th>        
      </tr>
    </thead>
    <tbody>
      <tr v-for="plant in sortedPlants" :key="plant.id">        
        <td> 
            <img :src="plant.imageUrl" class="plant-image" />  
            <span class="name"> {{ plant.commonName }}</span>                       
        </td>
        <!--  <td class="name">{{ plant.commonName }}</td>   -->      
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
        <router-link :to="{ name: 'edit-plant' }"
        >Edit
        </router-link>
        </td>


      </tr>
    </tbody>  
  </table>
</template>


<script>

import plantsService from '../services/PlantsService'

export default {

    name: "plants-list",
    // data() {
    //     return {
    //     plants: []
    //     };
    // },
    methods: {
        //viewPlant(id) {
        // plantsService.get(id).then(response => {
        //     this.$store.commit("SET_ACTIVE_PLANT", response.data);
        // });
        //this.$router.push(`/plant/id/${id}`);
        //},

        getPlants() {
            plantsService.list().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
            });
        }

    },
    created() {
        this.getPlants();
    },
    computed: {
        sortedPlants() {
            return this.$store.state.plants  
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

</style>