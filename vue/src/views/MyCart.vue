<template>
  <div class="display">
      <shopping-list/>
  </div>
</template>

<script>
import ShoppingList from '../components/ShoppingList.vue';


export default {
  components: {
     ShoppingList,
     }
};
</script>

<style>
.display {
    display: grid;
    grid-template-columns: 1fr 1fr;
}
@media only screen and (max-width: 768px) {
.suggest{
  grid-template-columns: 1fr;
}

}
</style>