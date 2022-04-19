<template>
  <div>
    <h1>Plant Suggestions for Your Farm</h1>
    <ul class="container">
        <div class="suggested_plants" v-for="plant in sortedPlants" :key="plant.plantId">
          <a href="#"> 
            <img :src="plant.imageUrl" class="plant-image"/>
          </a>
           <div> 
            <h2>{{plant.commonName}}</h2>
            <p>{{plant.description}}</p> 
           </div>
        </div>
    </ul>    
  </div>
</template>

<script>
import plantsService from '../../services/PlantsService'
//import suggestService from '../../services/SuggestService'

export default {
        name: "suggested-plants",
        data(){
            return {
                
            }
        },
        methods: {
            addPlantToShoppingList(){
                if(confirm("Are you sure you want to add this to your list?"))
                    suggestedService.
            }
        },
        created(){
            plantsService.listPlants().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
            });
        },
        computed: {
            //will filter plants based on users "needs" - sun of plot, size of plot, plants that user doesn't currently have
            sortedPlants() {
                return this.$store.state.plants.filter(() => {
                return true; 
                // --always returning true right now
                //populate list of plants based on plants not already on current user's farm
                //return false if target plant in join table
                });
            },
            plantsNotOnList(){
                return null;
                //populate list of plants based on plants not already on current user's farm
                //return false if target plant in join table
            },
             plantsBySunRequirements() { //<--- sun/part-shade/shade passed in as argument
                return true;
                //populate list of plants - filter by sun exposure of plot(s)
            },
            plantsByFarmSize() {
                return true;
                //populate list of plants - add by sq foot in loop,
            }       
        }
}

</script>

<style scoped>
.suggested_plants{
    flex-basis:50%;
    display:flex;
    background-color: rgba(168, 211, 189, 0.733);
    margin: 5px;
    border-radius: 10px
}

img{
    height: 180px;
    width: 180px;
    margin:10px;
    border-radius: 5px;
    align-self: center;
}


</style>