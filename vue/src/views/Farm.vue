<template>
  <div>
    <h1 class="farm">My Farm</h1>
    <plots-list />
  </div>
</template>

<script>
import PlotsList from "../components/PlotsList";

export default {
  components: {
    PlotsList
  }
};
</script>

<style>

h1.farm {
    color: white;
    text-shadow: 1px 1px 3px #000000;
}

</style>