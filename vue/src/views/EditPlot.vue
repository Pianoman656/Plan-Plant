<template>
  <div>
    <h1>Add Plot</h1>
    <plot-form v-bind:plotId="parseInt($route.params.plotId)" />      <!-- should this be Number( )  -->    
  </div>
</template>

<script>
import PlotForm from "../components/PlotForm";

export default {
  components: {
    PlotForm
  }
};
</script>

<style>
</style>