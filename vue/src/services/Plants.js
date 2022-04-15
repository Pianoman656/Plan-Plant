import axios from 'axios';


export default {
    list() {
      return axios.get('/plants/');
    },
  
    get(id) {
      return axios.get(`/plants/${id}`)
    }  
  }