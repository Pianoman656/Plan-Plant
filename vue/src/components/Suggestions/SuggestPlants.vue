<template>
  <div>
    <h1>Plant Suggestions for Your Farm</h1>
    <ul class="container">
        <div class="suggested_plants" v-for="plant in sortedPlants" :key="plant.plantId">
            <img :src="plant.imageUrl" class="plant-image" />
            <h2>{{plant.commonName}}</h2> 
        </div>
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
        },
        created(){
            plantsService.listPlants().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
            });
        },
        computed: {
            sortedPlants() {
                return this.$store.state.plants.filter((plant) => {
                    return plant.squareArea >= 5;
                });
        }
    }         
}

</script>

<style scoped>
.suggested_plants{
    flex-basis:50%;
    display:flex;
}

img{
    height: 180px;
    width: 180px;
    margin:10px;
    border-radius:10px;
    
}


</style>