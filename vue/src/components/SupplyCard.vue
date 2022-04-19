<template>
  <div class="card" v-bind:class="{ buy: supply.buy }">
    <h2 class="supply-name">{{ supply.supplyName }}</h2>
    <img v-if="supply.supplyId" v-bind:src="supply.imageUrl" />
    <h3 class="supply-description">{{ supply.description }}</h3>
    <h3 class="supply-cost">{{ supply.supplyCost }}</h3>
    <div class="button-container" v-if="! enableAdd">
        <button class="mark-read" v-on:click.prevent="setBuy(true)" v-if=" ! book.read">Mark Bought</button>
        <button class="mark-unread" v-on:click.prevent="setBuy(false)" v-if="book.read">Mark Unbuy</button>
    </div>
    <button v-if="enableAdd" v-on:click.prevent="addToShoppingList(supply)">Add to Shopping List</button>
  </div>
</template>

<script>
import SuggestService from '../services/SuggestService';
export default {
    name: 'supply-card',
    props: {
        supply: Object,
        enableAdd: {
            type: Boolean,
            default: false
        }
    },
    methods: {
        getSupplies() {
            SuggestService.getSupplyList().then(response => {
                this.$store.commit("SET_SUPPLY", response.data);
                });
            },
        
        setBuy(value) {
            this.$store.commit('SET_BUY_STATUS', {supply: this.supply, value: value});
        },
        addToShoppingList(supply) {
            let addedSupply = Object.assign({ read: false }, supply);
            this.$store.commit('BUY_SUPPLY', addedSupply);
        },
        created(){
            SuggestService.getSupplyList().then(response => {
                this.$store.commit("SET_SUPPLY", response.data);
            });
        },
        
    }
}
</script>

<style>
.card {
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 550px;
    margin: 20px;
}

.card.read {
    background-color: lightgray;
}

.card .book-title {
    font-size: 1.5rem;
}

.card .book-author {
    font-size: 1rem;
}
</style>