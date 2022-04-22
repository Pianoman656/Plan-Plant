<template>
  <div>
    
    <plots-list />
    <suggest-supplies />
  </div>
</template>

<script>
import PlotsList from "../components/PlotsList";
import SuggestSupplies from "../components/Suggestions/SuggestSupplies";

export default {
  components: {
    PlotsList,
    SuggestSupplies
  }
};
</script>

<style>

h1.farm {
    color: white;
    text-shadow: 1px 1px 3px #000000;
}

admin-home h1 {  
  color: var(--main-green);  
}

.farm a {
  float: right;
}

.farm a:link,
.farm a:visited {
  padding: 20px 20px 20px 0;
  text-align: right;
  color: var(--main-green);
  text-decoration: none;
}
.farm a:hover {
  text-decoration: underline;
}

.farm a {
  float: right;
}


</style>