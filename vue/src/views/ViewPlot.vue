<template>
  
  <div id="login" class="text-center">
        
        <h1 class="h3 mb-3 font-weight-normal">Plant Details</h1>
        <!-- <form v-on:submit.prevent> -->
          
                <p>{{ plant.plantId}} </p>

                <p>{{ plant.commonName}} </p>
            
            
                <p>{{ plant.squareArea}} </p>

                <p>{{ plant.cost}} </p>
                
                <p>{{ plant.sunRequirements}} </p>
                
            
                <p>{{ plant.imageUrl}} </p>
                
            
            
                <p>{{ plant.temporaryUsdaZones}} </p>
                
            
                <p>{{ plant.description}} </p>
        
    </div>
    
</template>

<script>
export default {

    // this needs a headline saying what the Plot Name is at the top
    // and then a list of all the plants in the Plot

}
</script>

<style>

</style>