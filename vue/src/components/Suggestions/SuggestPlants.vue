<template>
  <div class="suggested_plants">
    <div v-for="plant in sortedPlants" :key="plant.plantId">
        <a class="shopping_list" href="#" v-on:click="addPlantToShoppingList(plant)"> 
                <div class="image_container">
                <img :src="plant.imageUrl" class="plant_image"/>
            <div class="bottom-right">{{plant.commonName}}</div>
            </div>
        </a>
    </div>   
  </div>
</template>

<script>
import plantsService from '../../services/PlantsService'
import SuggestService from '../../services/SuggestService'
//import suggestService from '../../services/SuggestService'

export default {
        name: "suggested-plants",
        data(){
            return {
                
            }
        },
        methods: {
            addPlantToShoppingList(plant){
                SuggestService
                    .addPlantToShoppingList(plant)
                    .then(response => {
                        if (response.status === 201) {
                        this.$router.push("/Shop");
                        }
                    })
                    .catch(error => {
                        console.error(error);
                    });
            },
            addSupplyToShoppingList(supply){ //not yet working 
                SuggestService
                    .addSupplyToShoppingList(supply)
                    .then(response => {
                        if (response.status === 201) {
                        this.$router.push("/Shop");
                        }
                    })
                    .catch(error => {
                        console.error(error);
                    });                
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
                return this.$store.state.plants.filter((plant) => {
                return plant.squareArea <= 1;
                //returning plants with only an area of 2sq ft
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
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-auto-flow: row;
  gap: 20px;
  background-color: rgba(231, 231, 231, 0.438);
}
.image_container {
  position: relative;
  text-align: center;
  margin: 10px;
}

.plant_image{
    width:100%;
    height: auto;
}

.bottom-right {
  
  position: absolute;
  bottom: 6px;
  color: white;
  font-family:'Times New Roman', Times, serif;
  font-size: 30px;
  text-shadow:
        0.07em 0 black,
        0 0.07em black,
        -0.07em 0 black,
        0 -0.07em black;
}

@media only screen and (max-width: 375px) {
  .suggested_plants {
    grid-template-columns: 1fr 1fr;
  }
}

@media only screen and (max-width: 850px) {
  .suggested_plants {
    grid-template-columns: 1fr 1fr 1fr;
  }
}

</style>