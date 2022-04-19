<template>
  <div class="main">
      <h1>Supply Suggestions for Your Farm</h1>
    <ul class="container">
        <div class="suggested_supplies" v-for="supply in this.supplies" :key="supply.supplyId">
            <img :src="supply.imageUrl" class="supply-image" />
            <h2>{{supply.supplyName}}</h2>
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
            supplies: []
          }
        },
        methods: {

        },
        created(){
            suggestService.getSupplyStore().then(response => {
                this.supplies = response.data;
            });
        },
        computed: {

    }         
}
</script>


<style scoped>
.suggested_supplies{
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