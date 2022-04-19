<template>
  <div>
    <h1 class="farm">My Farm</h1>
    <router-link :to="{ name: 'create-plot' }"
      >Add New Plot
    </router-link>
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

admin-home h1 {  
  color: #019875;  
}

.farm a {
  float: right;
}

.farm a:link,
.farm a:visited {
  padding: 20px 20px 20px 0;
  text-align: right;
  color: #019875;
  text-decoration: none;
}
.farm a:hover {
  text-decoration: underline;
}

.farm a {
  float: right;
}


</style>