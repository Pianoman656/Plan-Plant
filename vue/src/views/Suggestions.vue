<template>
  <div class="suggest">
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

<style>
.suggest{ 
  display: grid;
  grid-template-columns: 1fr 1fr;
}

@media only screen and (max-width: 768px) {
.suggest{
  grid-template-columns: 1fr;
}

}
</style>