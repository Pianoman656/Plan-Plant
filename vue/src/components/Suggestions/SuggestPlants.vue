<template>
  <div>
    <h1>Plant Suggestions for Your Farm</h1>
    <div class="container">
        <div class="suggested_plants">

        </div>
    </div>    
  </div>
</template>

<script>
import plantsService from '../services/PlantsService'
import suggestService from '../services/SuggestService'

export default {
    name: "suggest-plants",
        data() {
            return {     
            errorMsg: "",
            }   
        },
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

                
    }
}
  


</script>

<style>

</style>