import axios from 'axios';

const http = axios.create({
  baseURL: ""
});

export default {
    // list() {
    //   return http.get('/plantings/');
    // },
  
    // get(id) {
    //   return http.get(`/plantings/${id}`)
    // },
    
    listPlots() {
        return http.get('/plots')
    },
    deletePlots(id) {
        return axios.delete('/plots/', id)
    } 
  }