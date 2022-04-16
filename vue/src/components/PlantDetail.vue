<template>
  <div id="login" class="text-center">
        
        <h1 class="h3 mb-3 font-weight-normal">Edit Plant</h1>
        <!--<div class="alert alert-danger" role="alert" v-if="invalidCredentials">
            Invalid username and password!   
        </div> -->
        <!-- <div
            class="alert alert-success"
            role="alert"
            v-if="this.$route.query.registration"
        >
            Thank you for registering, please sign in.
        </div>   -->
        <label for="plant-name" class="plant-name">Plant Name</label>
        <input
            type="text"
            id="plant-name"
            class="form-control"
            placeholder="Plant Name"
            v-model="plant.commonName"
            required
            autofocus
        />
        <label for="plant-description" class="plant-description">Plant Description</label>
        <textarea
            v-bind:value="this.$store.state.activePlant.description"
            v-on:input="description = $event.target.value"
            spellcheck="false"
        />
               
       
        <div>
        <button type="submit" v-on:click="savePlant()">Save Plant Details</button>
        </div>
        
    </div>


</template>

<script>

import plantsService from '../services/PlantsService'

export default {

  name: "plant-detail",
  data() {
    return {
      content: ""
    };
  },
  methods: {
    savePlant() {
      const current = this.$store.state.activePlant;
      const plant = {
        plantId: current.plantId,
        imageUrl: current.imageUrl,
        commonName: current.commonName,
        description: current.description,
        squareArea: current.squareArea,
        cost: this.cost,
        sunRequirements: current.sunRequirements,
        temporaryUsdaZones: current.temporaryUsdaZones

      };
      plantsService.update(plant.id, plant).then(response => {
        if (response.status === 200) {
          this.$router.push("/admin-home");
        }
      });
    }
  },
  created() {
      plantsService
        .get(this.$route.params.plantId)
        .then(response => {
        this.$store.commit("SET_ACTIVE_PLANT", response.data);
      })
      .catch(error => {
        if (error.response.status === 404) {
          this.$router.push("/404");
        } else {
          console.error(error);
        }
      });
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