<template>
  <div class="container">
    <suggest-plants />
    <suggest-supplies />
  </div>
</template>



<script>
import SuggestSupplies from "../components/Suggestions/SuggestSupplies.vue";
import SuggestPlants from '../components/Suggestions/SuggestPlants.vue';

export default {
  components: {
    SuggestSupplies,
    SuggestPlants
  }
};
</script>

<style scoped>

/* h1{
  text-align: center;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  text-shadow: -2px 0px 20px rgb(102, 102, 102);
  color:rgb(67, 119, 67)
}
h2{
  margin-right:5px;
} */
/* .suggest{ 
  display: grid;
  grid-template-columns: 1fr 1fr;
}

@media only screen and (max-width: 768px) {
.suggest{
  grid-template-columns: 1fr;
}

} */
</style>