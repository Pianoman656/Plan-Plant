<template>
  <div class="user-home">
    <h1>User Page</h1>
    <p v-if="$store.state.token == ''">You must be authenticated to see this</p>
    
    
    
  </div>
</template>

<script>
export default {
  name: "user-home"  
}
</script>



<style>

</style>