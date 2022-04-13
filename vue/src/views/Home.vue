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
<style>
  
</style>