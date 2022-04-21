<template>
  <div class="container">
    <h1>Plant Detail</h1>
    <plant-detail />
  </div>
</template>

<script>
import PlantDetail from "../components/PlantDetail";

export default {
  components: {
    PlantDetail
  }
};
</script>

<style scoped>
  .container {
    padding: 0 30px;
  }
</style>