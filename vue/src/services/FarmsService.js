import axios from 'axios';


export default {
    
    getFarm() {
      return axios.get('/farm/');
    },

  }