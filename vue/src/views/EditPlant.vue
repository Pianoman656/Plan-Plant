<template>
  <div>
    <h1>Edit Plant</h1>
    <plant-form v-bind:plantId="parseInt($route.params.plantId)" />      <!-- should this be Number( )  -->    
  </div>
</template>

<script>
import PlantForm from "../components/PlantForm";

export default {
  components: {
    PlantForm
  }
};
</script>

<style>
</style>