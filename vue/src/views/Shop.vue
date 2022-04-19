<template>
  <div>
    <h2>Supplies for your garden</h2>
      <shopping-list/>
      <router-view></router-view>
  </div>
</template>

<script>
import ShoppingList from '../components/ShoppingList.vue'

export default {
  components: {
     ShoppingList 
     },

}
</script>

<style>

</style>