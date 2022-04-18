<template>
  <div>
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