<template>
    <div>
      <h1>Plant Suggestions</h1>
      <ul class="container">
          <div class="suggested_plants" v-for="plant in sortedPlants" :key="plant.plantId">
            <div class="plant_cost">
            <a href="#"> 
              <img :src="plant.imageUrl" class="plant_image"/>
            </a>
            <h3>Grows best in USDA hardiness-zones: {{plant.temporaryUsdaZones}}</h3>
            </div> 
             <div> 
               <div class="plant_button">
              <h2>{{plant.commonName}}</h2>
              <button v-on:click="addPlantToShoppingList(plant)">Add Plant to shopping list</button>
               </div>
              <p>{{plant.description}}</p> 
             </div>
          </div>
      </ul>    
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
                  }
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
  
  h2{
    font-size: 30px;
  }
  h3{
      margin-top:none;
      padding-top:none;
      font-style:italic;
  }
  .plant_button{
      text-align:center;
  }
  .plant_cost{
      display: grid;
      text-align:center;
  }
  .suggested_plants{
      flex-basis:50%;
      display:flex;
      background-color: rgba(168, 211, 189, 0.829);
      margin: 5px;
      margin-right: 10px;
      border-radius: 5px
  }
  
  img{
      height: 180px;
      width: 180px;
      margin:10px;
      border-radius: 5px;
      align-self: center;
  }
  
  button{
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
      border:none;
      height:30px;
      font-weight: bold;
  }
  
  p{
      margin-right: 10px;
      text-align: center;
  }
  
  
  </style>