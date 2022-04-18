import axios from 'axios';


export default {
    list() {
      return axios.get('/plant/');
    },
  
    get(plantId) {
      return axios.get(`/plant/id/${plantId}`)
    },
    
    create(plant) {
      return axios.post('/plant/', plant);      
    },

    update(plant) {
      return axios.put(`/plant/${plant.Id}`, plant);
    }

  }