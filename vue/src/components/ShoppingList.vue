<template>
<div id="all-page">
  <h1>Plants and Supplies for your Garden</h1>
  <div id="supply-page">
        <div class="container" v-for="supply in sortedSupplies" :key="supply.supplyId">
          <a href="https://www.ruralking.com"> 
            <img :src="supply.imageUrl" class="supply-image"/>
          </a>
           <div> 
            <h2>{{ supply.supplyName }}</h2>
            <p>{{supply.description}}</p>
            <h2>${{supply.supplyCost}}</h2>
            <button>Add to Cart</button> 
           </div>
        </div>
        <div class="container" v-for="plant in sortedPlants" :key="plant.plantId">
          <a href="https://www.ufseeds.com"> 
            <img :src="plant.imageUrl" class="plant-image"/>
          </a>
           <div> 
            <h2>{{plant.commonName}}</h2>
            <p>{{plant.description}}</p>
            <h2>${{plant.cost}}</h2>
            <button>Add to Cart</button>
           </div>
        </div>
  </div>
  </div>
</template>

<script>
import suggestService from '../services/SuggestService'
import plantsService from '../services/PlantsService'

export default {
    name: 'shopping-list',
    methods: {
      getPlants() {
            plantsService.listPlants().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
                });
            },
        getSupplyStore() {
        suggestService.getSupplyStore().then(response => {
            this.$store.commit("SET_SUPPLIES", response.data);
            });
            }
          },
        created(){
        suggestService.getSupplyStore().then(response => {
            this.$store.commit("SET_SUPPLIES", response.data);
        }),
        plantsService.listPlants().then(response => {
                this.$store.commit("SET_PLANTS", response.data);
        });
    },
    computed: {
              sortedSupplies() {
                return this.$store.state.supplies.filter((supply) => {
                    return supply;
                });
        },
              sortedPlants() {
                return this.$store.state.plants.filter((plant) => {
                    return plant; // 
                });
        }
    }    
}
</script>

<style scoped>
.container {
    color: ivory;
    text-shadow: gray ;
    border: 2px solid black;
    border-radius: 10px;
    background-color: rgba(168, 211, 189, 0.733);
    width: 250px;
    height: 550px;
    margin: 20px;
}
img{
    height: 180px;
    width: 180px;
    margin:10px;
    border-radius: 5px;
    align-self: center;
}
#supply-page {
  display: flex;
  flex-wrap: wrap ;
  justify-content: space-evenly;
  font-size: .9rem
}
h1 {
  text-align: center;
  font-weight: 400;
  color: var(--main-green);
}
#all-page {
  position: absolute;
  margin-top: 100px;
}

</style>