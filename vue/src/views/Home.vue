<template>
  <div class="home">
    <h1>Home</h1>
    <p v-if="$store.state.token == ''">You must be authenticated to see this</p>
    
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>
<<<<<<< HEAD


=======
<style>
  
</style>
>>>>>>> 37ed926d1343e5ae1617645113cadb25da95705d
