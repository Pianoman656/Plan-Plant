import axios from 'axios';


export default {
    list() {
      return axios.get('/plant/');
    },
  
    get(id) {
      return axios.get(`/plant/${id}`)
    }  
  }