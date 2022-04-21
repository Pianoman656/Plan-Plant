<template>
  <div id="suggested-plants">
    <h1>Plant Suggestions</h1>
    <section class="cards container">
      <div class="card" v-for="plant in sortedPlants" :key="plant.plantId">
        <div class="left">
          <img :src="plant.imageUrl" id="plant-img" />
        </div>
        <!-- End Of Left -->

        <div class="right">
          <div>{{ plant.commonName }}</div>

          <p class="desc">{{ plant.description }}
              <br />
               <em>Hardiness Zones: {{ plant.temporaryUsdaZones }}</em>
          </p>
          
          <button v-on:click="addPlantToShoppingList(plant)">
            Add To Shopping List
          </button>
        </div>
        <!-- End Of Right -->
      </div>
    </section>
  </div>
</template>

<script>
import plantsService from '../../services/PlantsService'
import SuggestService from '../../services/SuggestService'
//import suggestService from '../../services/SuggestService'

export default {
  name: 'suggested-plants',
  data() {
    return {}
  },
  methods: {
    addPlantToShoppingList(plant) {
      SuggestService.addPlantToShoppingList(plant)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push('/shoppingList')
          }
        })
        .catch((error) => {
          console.error(error)
        })
    },
  },
  created() {
    plantsService.listPlants().then((response) => {
      this.$store.commit('SET_PLANTS', response.data)
    })
  },
  computed: {
    //will filter plants based on users "needs" - sun of plot, size of plot, plants that user doesn't currently have
    sortedPlants() {
      return this.$store.state.plants.filter((plant) => {
        return plant.squareArea <= 1
        //returning plants with only an area of 2sq ft
        //populate list of plants based on plants not already on current user's farm
        //return false if target plant in join table
      })
    },
    plantsNotOnList() {
      return null
      //populate list of plants based on plants not already on current user's farm
      //return false if target plant in join table
    },
    plantsBySunRequirements() {
      //<--- sun/part-shade/shade passed in as argument
      return true
      //populate list of plants - filter by sun exposure of plot(s)
    },
    plantsByFarmSize() {
      return true
      //populate list of plants - add by sq foot in loop,
    },
  },
}
</script>

<style scoped>
* {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
}
h1,
h2,
h3,
h4 {
  color: #444;
  margin: 0;
}
div.right {
    padding: 10px 20px;
}
div.right div:first-child {
    color: #444;
    font-weight: 500;
}
div.right button {
    border: 1px solid var(--main-green);
    border-radius: 3px;
    padding: 8px 25px;
    background-color: var(--main-green);
    color: white;
    box-shadow: 0 0 3px #44444480;
    transition: box-shadow 0.3s, filter 0.3s;
}
div.right button:hover {
    box-shadow: 0 0 10px #44444480;
    filter: brightness(1.1);
}
img {
  width: 220px;
}
.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.cards {
    margin: 0 auto;
}
.card {
  display: flex;
  flex: 1;
  background-color: #fff;
  padding: 15px;
  max-width: 600px;
  margin: 5px;
  border-radius: 3px;
  border: 0.7px solid #aaa; 
}
.desc {
  width: 380px;
  font-size: 13px;
  letter-spacing: 0.2px;
}
em {
    margin: 35px 0;
}
.left {
  width: 150px;
  overflow: hidden;
}
/* h2 {
  font-size: 30px;
}
h3 {
  margin-top: none;
  padding-top: none;
  font-style: italic;
}
.plant_button {
  text-align: center;
}
.plant_cost {
  display: grid;
  text-align: center;
}
.suggested_plants {
  flex-basis: 50%;
  display: flex;
  background-color: rgba(168, 211, 189, 0.829);
  margin: 5px;
  margin-right: 10px;
  border-radius: 5px;
}

img {
  height: 180px;
  width: 180px;
  margin: 10px;
  border-radius: 5px;
  align-self: center;
}

button {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
  border: none;
  height: 30px;
  font-weight: bold;
}

p {
  margin-right: 10px;
  text-align: center;
} */
</style>
