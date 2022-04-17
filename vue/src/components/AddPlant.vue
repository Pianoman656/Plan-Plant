<template>
  <form v-on:submit.prevent>
    <div class="field">
      <label for="plant-name">Plant Name</label>
      <input type="text" v-model="newPlant.commonName" />
    </div>
    <div class="field">
      <label for="square-area">Square Area</label>
      <input type="number" v-model="newPlant.squareArea" />
    </div>
    <div class="field">
      <label for="cost">Cost</label>
      <input type="number" v-model="newPlant.cost" />
    </div>
    <div class="field">
      <label for="sun-requirements">Sun Requirements</label>
      <input type="text" v-model="newPlant.sunRequirements" />
    </div>
    <div class="field">
      <label for="image">Image</label>
      <input type="text" v-model="newPlant.imageUrl" />
    </div>
    <div class="field">
      <label for="hardiness-zones">Hardiness Zones</label>
      <input type="text" v-model="newPlant.temporaryUsdaZones" />
    </div>
    <div class="field">
      <label for="plant-description">Plant Description</label>
      <textarea spellcheck="false" v-model="newPlant.description" />
    </div>
    <div class="actions">
      <button type="button" v-on:click="cancel()">Cancel</button>&nbsp;
      <button type="submit" v-on:click="saveNewPlant()">Save Plant</button>
    </div>
  </form>
</template>

<script>
import plantsService from "../services/PlantsService";


export default {
    name: "add-plant",
    data() {
        return {
            newPlant: {
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
        saveNewPlant() {
            plantsService
                .create(this.newPlant)
                .then(response => {
                if (response.status === 200 || response.status === 201 ) {                    
                    this.newPlant = {
                        commonName: "",
                        squareArea: "",
                        cost: "",
                        sunRequirements: "",
                        imageUrl: "",
                        temporaryUsdaZones: "",
                        description: ""
                    }
                    this.$router.push("/admin");

                }
                })
                .catch(error => {
                console.error(error);
                //put an error message on the UI
                    if (error.response) {
                        this.errorMsg = "Error submitting new board. Response received was '" + error.response.statusText + "'.";

                    } else if (error.request) {
                        this.errorMsg = "Error submitting new board. Server could not be reached.";
                    
                    } else {
                        this.errorMsg = "Error submitting new board. Request could not be created.";
                    }
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