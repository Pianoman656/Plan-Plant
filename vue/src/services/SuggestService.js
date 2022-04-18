import axios from 'axios';


export default {
    
    //filtered list based on sunExposure of plots
    //returns plants based on their sun requirements
    listPlantsBySunRequirements(sunExposure) {
      return axios.get(`/plant/sun/${sunExposure}`);
    },

    
    //get list of all supplies that you can add to your shopping list
    //use this list to suggest items
    getSupplyStore() {
      return axios.get('/Supply/supplyStore');      
    },


    //get list of all supplies currently on your shopping list
    //potentially use this for comparison 
    //to determine which suggestions are made to user
    getSupplyList() {
      return axios.get('/Supply/mySupplies');
    }

  }