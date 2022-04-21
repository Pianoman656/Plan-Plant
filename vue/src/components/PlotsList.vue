<template>
  
  
   <div class="plots-list-table">
       <h2>Plots</h2>
        <table>
        <thead>
        <tr>
        <!-- <th>&nbsp;</th>  -->
        <th>Plot Name</th>
        <th>Square Footage</th>
        <th>Sun Exposure</th>   
        <th>Actions</th>                 
      </tr>
    </thead>
    <tbody>
      <tr v-for="plot in sortedPlots" :key="plot.plotId">               
        <td class="name">{{ plot.plotName }}</td>      
        <td class="square-area">{{plot.plotSquareFootage}}</td>        
        <td class="sun-requirements">{{plot.sunExposure}}</td>   
        <td>
           <router-link v-bind:to="{ name: 'view-plot', params: {plotId: plot.plotId} }"   
          >Edit</router-link>
        </td>       
      </tr>
    </tbody>  
  </table>
  </div> 
  
</template>


<script>
import plotsService from "../services/PlotsService"

export default {
    name: "plots-list",
    
    methods: {
        getPlots() {
            plotsService.listPlots().then(response => {
                this.$store.commit("SET_PLOTS", response.data);
            });
        },       
    },
     created() {
        this.getPlots();
    },    
    computed: {
        sortedPlots() {
            return this.$store.state.plots 
            //don't know if sorted is really needed but it's here for later          
        }
}
}
</script>

<style>

.plots-list-table h2 {
    color: white;
    text-shadow: 1px 1px 3px #000000;
}

.plots-list-table table {
  width: 100%;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}

.plots-list-table th {
  font-family: "Work Sans", sans-serif;
  font-weight: 500;  
  text-align: left;
  color: #019875;
}

.plots-list-table td {
    text-align: left;
}

.plots-list-table {
background-color: white;
}

</style>