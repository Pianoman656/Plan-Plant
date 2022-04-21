<template>
  <div id="login" class="text-center">
        
        <h1 class="h3 mb-3 font-weight-normal">Plant Details</h1>
        <!-- <form v-on:submit.prevent> -->
          
                <p>{{ plant.plantId}} </p>

                <p>{{ plant.commonName}} </p>
            
            
                <p>{{ plant.squareArea}} </p>

                <p>{{ plant.cost}} </p>
                
                <p>{{ plant.sunRequirements}} </p>
                
            
                <p>{{ plant.imageUrl}} </p>
                
            
            
                <p>{{ plant.temporaryUsdaZones}} </p>
                
            
                <p>{{ plant.description}} </p>
                
            
            
        


        <!-- <h1 class="h3 mb-3 font-weight-normal">Edit Plant</h1>
        <form v-on:submit.prevent>
            <div class="field">
                <label for="plant-name">Plant Name</label>
                <input type="text" v-model="plant.name" />
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
            <button type="submit" v-on:click="savePlant()">Update</button>
            </div>
        </form> -->


        
       
        
    </div>


</template>

<script>

import plantsService from '../services/PlantsService'

export default {

  name: "plant-detail",
  data() {
    return {     
       errorMsg: "",
    };
  },
  methods: {
    retrievePlant() {
      plantsService
        .getPlant(this.$route.params.plantId)
        .then(response => {
          this.$store.commit("SET_CURRENT_PLANT", response.data);          

      })
      .catch(error => {
          if (error.response && error.response.status === 404) {
            alert(
              "Plant not available."
            );
            this.$router.push("/admin");
          }
        });
      
      
    }    
  },  
  created() {
      this.retrievePlant();
  }
}

</script>

<style>

textarea {
  width: 500px;
  height: 500px;
}
.back {
  margin-top: 20px;
}

a:link,
a:visited {
  color: rgb(48, 161, 123);
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}

</style>