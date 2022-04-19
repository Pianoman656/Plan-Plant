<template>
  <div class="shopping-container">
    <supply-card v-bind:supply="supply" v-for="supply in $store.state.supplies" v-bind:key="supply.supplyId" />
  </div>
</template>

<script>
import SupplyCard from '@/components/SupplyCard.vue';

export default {
    name: 'shopping-list',
    computed: {
        supplies() {
            return this.$store.state.supplies.filter((supply) => {
        return supply;
      });
        }
    },
    components: {
        SupplyCard
    }
}
</script>

<style>
.shopping-container {
    display:flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>