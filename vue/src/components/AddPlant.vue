<template>
  <form v-on:submit.prevent>
    <div class="field">
      <label for="plant-name">Plant Name</label>
      <input type="text" v-model="document.name" />
    </div>
    <div class="field">
      <label for="square-area">Square Area</label>
      <input type="number" v-model="plant.squareArea" />
    </div>
    <div class="field">
      <label for="cost">Cost</label>
      <input type="number" v-model="plant.cost" />
    </div>
    <div class="field">
      <label for="sun-requirements">Sun Requirements</label>
      <input type="text" v-model="plant.sunRequirements" />
    </div>
    <div class="field">
      <label for="image">Image</label>
      <input type="text" v-model="plant.imageUrl" />
    </div>
    <div class="field">
      <label for="hardiness-zones">Hardiness Zones</label>
      <input type="text" v-model="plant.temporaryUsdaZones" />
    </div>
    <div class="field">
      <label for="plant-description">Plant Description</label>
      <textarea spellcheck="false" v-model="plant.description" />
    </div>
    <div class="actions">
      <button type="button" v-on:click="cancel()">Cancel</button>&nbsp;
      <button type="submit" v-on:click="saveDocument()">Save Document</button>
    </div>
  </form>
</template>

<script>
import plantsService from "../services/PlantsService";


export default {
    name: "add-plant",
    data() {
        return {
            plant: {
                plantId: Math.floor(Math.random() * (1000 - 100) + 100),
                imageUrl: "",
                commonName: "",
                description: "",
                squareArea: null,
                cost: null,
                sunRequirements: "",
                temporaryUsdaZones: ""
            }
        };
    },
    methods: {
        savePlant() {
            plantsService
                .create(this.plant)
                .then(response => {
                if (response.status === 201) {
                    this.$router.push("/admin-home");
                }
                })
                .catch(error => {
                console.error(error);
                });
            },
        cancel() {
            this.$router.push("/admin-home");
        }  
    }
};
</script>


<style>




</style>