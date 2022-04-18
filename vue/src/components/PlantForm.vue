<template>
  <form v-on:submit.prevent="savePlant" class="plantForm">
    <div class="status-message error" v-show="errorMsg != ''">{{errorMsg}}</div>
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
    name: "plant-form",
    props: {
        plantId: {     
            type: Number,
            default: 0
        }
    },
    data() {
        return {
            plant: {                
                commonName: "",
                squareArea: "",
                cost: "",
                sunRequirements: "",
                imageUrl: "",
                temporaryUsdaZones: "",
                description: ""
            },
            errorMsg: ""
        };
    },
    methods: {
        savePlant() {
            const newPlant = {
                plantId: Number(this.$route.params.plantId),
                commonName: this.plant.commonName,
                squareArea: Number(this.plant.squareArea),
                cost: Number(this.plant.cost),
                sunRequirements: this.plant.sunRequirements,
                imageUrl: this.plant.imageUrl,
                temporaryUsdaZones: this.plant.temporaryUsdaZones,
                description: this.plant.description
            }

            if (this.plantId === 0) {
                // add
                //this.newPlant.cost = parseInt(this.newPlant.cost)
                //this.newPlant.squareArea = parseInt(this.squareArea.cost)     
                newPlant.plantId = 0;           
                console.log("Plant Id is zero!");
                console.log(newPlant);
                //console.log(this.newPlant.cost);

                plantsService
                .createPlant(newPlant)
                .then(response => {
                    if (response.status === 200 || response.status === 201 ) { 
                        this.$router.push("/admin");
                    }
                })
                .catch(error => {
                    this.handleErrorResponse(error, "adding");
                });
            } else {
                // update
                newPlant.plantId = this.plantId;
                newPlant.commonName = this.plant.commonName;
                newPlant.squareArea = this.plant.squareArea;
                newPlant.cost = this.plant.cost;
                newPlant.sunRequirements = this.plant.sunRequirements;
                newPlant.imageUrl = this.plant.imageUrl;
                newPlant.temporaryUsdaZones = this.plant.temporaryUsdaZones;
                newPlant.description = this.plant.description;
                plantsService
                    .updatePlant(newPlant)
                    .then(response => {
                        if (response.status === 200 || response.status === 201) {
                            this.$router.push("/admin");
                        }
                    })
                    .catch(error => {
                        this.handleErrorResponse(error, "updating");
                    });
            }
        },
        cancel() {
            this.$router.push("/admin");
        },
        handleErrorResponse(error, verb) {
        if (error.response) {
                this.errorMsg =
                    "Error " + verb + " plant. Response received was '" +
                    error.response.statusText + "'.";
        } else if (error.request) {
                this.errorMsg =
                    "Error " + verb + " plant. Server could not be reached.";
        } else {
                this.errorMsg =
                    "Error " + verb + " plant. Request could not be created.";
            }
        }
    },
    created() {
        if (this.plantId != 0) {
        plantsService
            .getPlant(this.plantId)
            .then(response => {
            this.plant = response.data;
            })
            .catch(error => {
            if (error.response && error.response.status === 404) {
                alert(
                "Plant not available. This plant may have been deleted or you have entered an invalid plant ID."
                );
                this.$router.push("/admin");
            }
            });
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