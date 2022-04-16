<!--     -->
<template>
  <div class="admin-home">
    <h1>Admin Page</h1>
    <router-link :to="{ name: 'AddPlant' }"
      >Add New Plant</router-link
    >
    <p v-if="$store.state.token == ''">You must be authenticated to see this</p>    
    <plants-list />
   

  </div>


</template>

<script>
import PlantsList from "../components/PlantsList.vue";

export default {
  components: {
    PlantsList
  }      
};

</script>


<style>

.admin-home h1 {  
  color: #019875;  
}

.admin-home a {
  float: right;
}

.admin-home a:link,
.admin-home a:visited {
  padding: 20px 20px 20px 0;
  text-align: right;
  color: #019875;
  text-decoration: none;
}
.admin-home a:hover {
  text-decoration: underline;
}



</style>