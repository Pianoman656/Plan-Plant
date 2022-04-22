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
    getShoppingList() {
      return axios.get('/Supply/shoppingList');
    },

    //add supply to shopping list
    //this method takes a partially built "supply" object
    //supplyToAdd MUST include farmId property in json object
    addSupplyToShoppingList(supplyToAdd) {
      return axios.post('/Supply/shoppingList', supplyToAdd)
    },

    //remove supply from shopping list
    //this method takes a partially built "supply" object
    //supplyToRemove MUST include farmId property in json object
    removeSupplyFromShoppingList(listItemId) {
      return axios.delete(`/Supply/shoppingList/${listItemId}`)
    },

    //get list of all of user's plots based on token
    getAllUserPlots() {
      return axios.get(`/Plot`)
    },

    //get list of all plots based on farmId (not currently in use)
    getAllFarmPlots(farmId) {
      return axios.get(`/Plot/${farmId}/byFarm`)
    },

    //returns single plot based on plot ID in URL
    getPlotByPlotId(plotId) {
      return axios.get(`/Plot/${plotId}`)
    }, 

    //takes a partially built plot object and adds a new plot to user's list of plots. 
    //Farm ID is assigned with user token on the back-end 
    addNewPlot(plotToAdd) {
      return axios.post('/Plot', plotToAdd)
    },

    //delete plot and its "planted plants" from data store.
    //plotToDelete.PlotId is needed to identify target plot
    deletePlot(plotToDelete) {
      return axios.delete('/Plot', plotToDelete)
    },

    //plantToAdd must contain target plant_id and farm_id.. should refactor..
    addPlantToShoppingList(plantToAdd) {
      return axios.post('/Plant/shoppingList', plantToAdd)
    },

    //plantToRemove must contain supply_farms_plants_id.. must refactor...
    removePlantFromShoppingList(plantToRemove) {
      return axios.delete('/Plant/shoppingList', plantToRemove)
    },

    addPlantToPlot(plantToAdd) {
      return axios.post('/Plant/planting', plantToAdd)
    }

}