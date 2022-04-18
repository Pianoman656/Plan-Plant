import axios from 'axios';


export default {
    listPlants() {
      return axios.get('/plant/');
    },
  
    getPlant(plantId) {
      return axios.get(`/plant/id/${plantId}`)
    },
    
    createPlant(plant) {
      return axios.post('/plant/', plant);      
    },

    updatePlant(plant) {
      return axios.put(`/plant/${plant.Id}`, plant);
    }

  }