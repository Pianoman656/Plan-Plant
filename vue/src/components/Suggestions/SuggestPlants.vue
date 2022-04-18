<template>
  <div>
    <h1>Plant Suggestions for Your Farm</h1>
    <ul class="container">
        <li class="suggested_plants" v-for="plant in sortedPlants" :key="plant.plantId">
            <img :src="plant.imageUrl" class="plant-image" /> 
        </li>
    </ul>    
  </div>
</template>

<script>
import plantsService from '../../services/PlantsService'
import suggestService from '../../services/SuggestService'

export default {
    name: "suggested-plants",
        
        methods: {
            getPlants() {
            plantsService.listPlants().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
            });
        },
            getPlantsBySunRequirements() {
            suggestService.listPlantsBySunRequirements().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
            });
        },
        created(){
            this.getPlants();
        },
        computed: {
            sortedPlants() {
                return this.$store.state.plants
            }
        }         
    }
}
  


</script>

<style scoped>
div{
    display: flex;
}
</style>