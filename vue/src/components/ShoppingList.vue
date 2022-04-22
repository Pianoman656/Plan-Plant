<template>
<div id="all-page">
  <h1 class='supply-header'>Supplies for your Garden</h1>
  <div id="supply-page">
        
        
        <div class="container" v-for="supply in myShoppingList" :key="supply.supplyId">
          <a href="https://www.ruralking.com"> 
            <img :src="supply.imageUrl" class="supply-image"/>
          </a>
           <div> 
            <h2>{{supply.supplyName}}</h2>
            <h2 id="item-cost">${{supply.supplyCost}}</h2>
            <button @click='removeFromList(supply.supplyId)' class='button is-info'>Remove from List</button> 
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
            <button @click='removeFromList(product)' class='removeFromList'>Remove from list</button>
           </div>
        </div>
      <h2 class="cost">Estimated cost of your supplies: ${{totalCost}}</h2>
    </div>
  </div>
</template>

<script>
import suggestService from '../services/SuggestService'
import plantsService from '../services/PlantsService'
import plotsService from '../services/PlotsService'
//import { mapGetters, mapActions } from 'vuex'

export default {
    name: 'shopping-list',
    
    methods: {
        getTotalAreaOfFarm() {
          plotsService.listPlots().then(response => {
            this.$store.commit("SET_PLOTS", response.data);
          })
        },
        getSupplyStore() {
        suggestService.getSupplyStore().then(response => {
            this.$store.commit("SET_SUPPLIES", response.data);
            });
        },
        removeFromList(supplyId){
          suggestService.removeSupplyFromShoppingList(supplyId);
          suggestService.getShoppingList().then(response => {
            this.$store.commit("SET_SHOPPING_LIST", response.data);
        });
        }
    },

    created(){
        suggestService.getShoppingList().then(response => {
            this.$store.commit("SET_SHOPPING_LIST", response.data);
        });
        suggestService.getSupplyStore().then(response => {
            this.$store.commit("SET_SUPPLIES", response.data);
        });
        plantsService.listPlants().then(response => {
            this.$store.commit("SET_PLANTS", response.data);
        });
        plotsService.listPlots().then(response => {
            this.$store.commit("SET_PLOTS", response.data);
        });
    },

    computed: {
        myShoppingList() {
          return this.$store.state.shoppingList.filter(() => {
              return true;
          });
        },
        totalCost() {
          let total = 0;
          let list = this.$store.state.shoppingList;
          for(let i = 0; i < list.length; i++)
          {
            total += list[i].supplyCost;
          }
          return total;
        }
    }    
}
</script>

<style scoped>
.supply-header{
    font-size: xx-large;
    font-weight: 400;
    color: black;
    text-shadow: 0px 0px 2px black, 0 0 2px black;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
    border-radius: 4px;
    padding: 0 15px;
    text-align: center;
}

h2.cost{
  position:relative;
  top: 200px;
  font-size: 40px;
  font-weight: 400;
  color: #fff;
  text-shadow: 0px 0px 25px black, 0 0 5px black;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  border-radius: 4px;
  padding: 0 15px;
  text-align: center;
}
.container {
    color: black;
    text-shadow: gray ;
    border: 2px solid black;
    border-radius: 10px;
    background-color: rgba(168, 211, 189, 0.733);
    width: 250px;
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