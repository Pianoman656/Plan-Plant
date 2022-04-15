<!--     -->
<template>
  <div class="admin-home">
    <h1>Admin Page</h1>
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

</style>