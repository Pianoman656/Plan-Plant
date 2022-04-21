<template>
  <div>
    <div class="plants-list-table">
    <h1>Admin Page</h1>
      <div class="add-btn-wrapper">
        <router-link :to="{ name: 'create-plant' }">Add New Plant</router-link>
      </div>
      <table>
        <thead>
          <tr>
            <!-- <th>&nbsp;</th>  -->

            <th></th>
            <th>Square Area</th>
            <th>Cost</th>
            <th>Hardiness Zone</th>
            <th>Sun Requirements</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="plant in sortedPlants" :key="plant.plantId">
            <!--  plantId could've been anything here-->
            <td>
              <img :src="plant.imageUrl" class="plant-image" />
              <span class="name">{{ plant.commonName }}</span>
            </td>
            <!--  <td class="name">{{ plant.commonName }}</td>   -->
            <td class="square-area">{{ plant.squareArea }}</td>
            <td class="cost">{{ plant.cost }}</td>
            <td class="hardiness-zone">{{ plant.temporaryUsdaZones }}</td>
            <td class="sun-requirements">{{ plant.sunRequirements }}</td>
            <!-- 
        <td>
            <button v-on:click="viewPlant(plant.id)">Edit</button>&nbsp;
        </td>
         -->
            <td>
              <router-link
                v-bind:to="{
                  name: 'edit-plant',
                  params: { plantId: plant.plantId },
                }"
              >
                Edit
              </router-link>
              <!-- <router-link :to="{ name: 'plant' }"
        >View
        </router-link> -->
            </td>
            <td>
              <!--  plantId is the param so it had to be written out as plant.plantId (or object.property) -->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import plantsService from '../services/PlantsService'

export default {
  name: 'plants-list',
  methods: {
    getPlants() {
      plantsService.listPlants().then((response) => {
        this.$store.commit('SET_PLANTS', response.data)
      })
    },
  },
  created() {
    this.getPlants()
  },
  computed: {
    sortedPlants() {
      return this.$store.state.plants
      //don't know if sorted is really needed but it's here for later
    },
  },
}
</script>

<style scoped>
.plants-list-table {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  background-color: #fff;
  padding: 30px 20px;
  margin: 50px 30px;
  border: 0.7px solid #aaa;
  border-radius: 3px;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}
tbody tr td:first-child {
  width: 300px;
  display: flex;
  align-items: center;
}
.name {
  margin-left: 15px;
}
th {
  font-family: 'Work Sans', sans-serif;
  font-weight: 500;
  text-align: left;
  color: #888;
}
.admin-home a {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  border-radius: 2px;
}
/* 
.admin-home a:link,
.admin-home a:visited {
  text-align: right;
  color: #019875;
  text-decoration: none;
} */

.admin-home a:hover {
  text-decoration: none;
}
.add-btn-wrapper > a {
  background-color: var(--main-green);
  color: white;
  padding: 10px 35px;
}
td > a {
  border: 0.7px solid #aaa;
  padding: 5px 35px;
  color: var(--main-green);
}

.add-btn-wrapper {
  display: flex;
  justify-content: flex-end;
  width: 100%;
  margin-bottom: 20px;
}
.plant-image {
  width: 90px;
}
</style>
