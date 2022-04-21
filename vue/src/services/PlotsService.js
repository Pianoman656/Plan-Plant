import axios from 'axios';


export default {    
  
    listPlots() {
       return axios.get('/plot/');
    },
    
    getPlot(plotId) {
      return axios.get(`/plot/id/${plotId}`)
    },
    
    createPlot(plot) {
      return axios.post('/plot/', plot);      
    },

    updatePlot(plot) {
      return axios.put(`/plot/${plot.plotId}`, plot);
    },
    
    deletePlot(id) {
      return axios.delete('/plot/' + id);
    }

  }