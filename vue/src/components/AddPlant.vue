<template>
  <form v-on:submit.prevent>
    <div class="field">
      <label for="plant-name">Plant Name</label>
      <input type="text" v-model="plant.commonName" />
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
      <button type="submit" v-on:click="savePlant()">Save Plant</button>
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
                //plantId: Math.floor(Math.random() * (1000 - 100) + 100),
                commonName: "",
                squareArea: "",
                cost: "",
                sunRequirements: "",
                imageUrl: "",
                temporaryUsdaZones: "",
                description: ""
            }
        };
    },
    methods: {
        savePlant() {
            plantsService
                .create(this.plant)
                .then(response => {
                if (response.status === 200 || response.status === 201 ) {
                    this.$router.push("/admin");
                }
                })
                .catch(error => {
                console.error(error);
                //put an error message on the UI
                });
            },
        cancel() {
            this.$router.push("/admin");
        }  
    }
};
</script>



<style>

form {
  padding: 20px;
  font-size: 16px;
  width: 500px;
}
form * {
  box-sizing: border-box;
  line-height: 1.5;
}
.field {
  display: flex;
  flex-direction: column;
}
.field label {
  margin: 4px 0;
  font-weight: bold;
}
.field input,
.field textarea {
  padding: 8px;
}
.field textarea {
  height: 300px;
}
.actions {
  text-align: right;
  padding: 10px 0;
}


</style>