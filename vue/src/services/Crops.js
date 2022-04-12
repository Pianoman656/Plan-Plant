import axios from 'axios';

const http = axios.create({
  baseURL: "https://www.growstuff.org/api/v1"
});

export default {
    list() {
      return http.get('/plantings/');
    },
  
    get(id) {
      return http.get(`/plantings/${id}`)
    }  
  }