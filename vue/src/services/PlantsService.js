import axios from 'axios';


export default {
    list() {
      return axios.get('/plant/');
    },
  
    get(id) {
      return axios.get(`/plant/id/${id}`)
    },
    
    create(plant) {
      return axios.post(`/plant/`, plant);      
    },

    update(id, plant) {
      return axios.put(`/plant/${id}`, plant);
    }

  }