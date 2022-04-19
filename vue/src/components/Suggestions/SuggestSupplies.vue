<template>
  <div class="main">
      <h1>Supply Suggestions for Your Farm</h1>
    <ul class="supply_container">
        <div class="suggested_supplies" v-for="supply in sortedSupplies" :key="supply.supplyId">
           <a href="https://www.ruralking.com"> 
             <img :src="supply.imageUrl" class="supply-image" />
           </a>
          <div class="supply_description">
            <h2>{{supply.supplyName}}</h2>
            <h3>$ {{(supply.supplyCost)}}.00</h3>
          </div>
        </div>
    </ul>    
  </div>
</template>

<script>
import suggestService from '../../services/SuggestService'

export default {
        name: "suggested-supplies",
        data() {
          return {
          }
        },
        methods: {

        },
        created(){
            suggestService.getSupplyStore().then(response => {
                this.$store.commit("SET_SUPPLIES", response.data)
            });
        },
        computed: {
          //will sort supplies to display to user based on plot dimensions(mulch) and supplies NOT already on the shopping list
          sortedSupplies() {
            return this.$store.state.supplies.filter(() => {
              return true;
            });
        }
    }         
}
</script>


<style scoped>
h1{
  text-shadow: -2px 0px 20px rgb(255, 255, 255);
}
.suggested_supplies{
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
    border-radius:10px;
    
}
</style>