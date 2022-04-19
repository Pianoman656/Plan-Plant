<template>
  <form v-on:submit.prevent="savePlot" class="plotForm">
    <div class="status-message error" v-show="errorMsg != ''">{{errorMsg}}</div>
    <div class="field">
      <label for="plot-name">Plot Name</label>
      <input type="text" v-model="plot.plotName" />
    </div>
    <div class="field">
      <label for="square-footage">Square Footage</label>
      <input type="number" v-model.number="plot.plotSquareFootage" />
    </div>    
    <div class="field">
      <label for="sun-exposure">Sun Exposure</label>
      <input type="text" v-model="plot.sunExposure" />
    </div>
    <div class="field">
      <label for="zone-id">Zone ID</label>
      <input type="text" v-model="plot.zoneId" />
    </div>
    <div class="actions">
      <button type="button" v-on:click="cancel()">Cancel</button>&nbsp;
      <button class="btn btn-submit">Save Plot</button>
      <!-- <button type="submit" v-on:click="savePlot()">Save Plot</button> -->
    </div>
  </form>
</template>

<script>
import plotsService from "../services/PlotsService";

export default {
    name: "plot-form",
    props: {
        plotId: {     
            type: Number,
            default: 0
        }
    },
    data() {
        return {
            plot: {                                                
                plotName: '',
                sunExposure: '',
                plotSquareFootage: '',
                zoneId: ''                
            },
            errorMsg: ""
        };
    },
    methods: {
        savePlot() {
            const newPlot = {
                plotId: Number(this.$route.params.plotId),
                farmId: Number(this.$route.params.farmId),
                plotName: this.plot.plotName,
                sunExposure: this.plot.sunExposure,
                plotSquareFootage: this.plot.plotSquareFootage,
                zoneId: this.plot.zoneId                   
            }
            

            if (isNaN(newPlot.plotId)) {

                newPlot.plotId = 0;                           

                plotsService
                .createPlot(newPlot)
                .then(response => {
                    if (response.status === 200 || response.status === 201 ) { 
                        this.$router.push("/farm");
                    }
                })
                .catch(error => {
                    this.handleErrorResponse(error, "adding");
                });
            } else {
                
                // update    
                newPlot.plotId = this.plot.plotId;
                newPlot.farmId = this.plot.farmId;
                newPlot.plotName = this.plot.plotName,
                newPlot.sunExposure = this.plot.sunExposure,
                newPlot.plotSquareFootage = this.plot.plotSquareFootage,
                newPlot.zoneId = this.plot.zoneId
                
                plotsService
                    .updatePlot(newPlot)
                    .then(response => {
                        if (response.status === 200 || response.status === 201) {
                            this.$router.push("/farm");
                        }
                    })
                    .catch(error => {
                        this.handleErrorResponse(error, "updating");
                    });
            }
        },
        cancel() {
            this.$router.push("/farm");
        },
        handleErrorResponse(error, verb) {
        if (error.response) {
                this.errorMsg =
                    "Error " + verb + " plot. Response received was '" +
                    error.response.statusText + "'.";
        } else if (error.request) {
                this.errorMsg =
                    "Error " + verb + " plot. Server could not be reached.";
        } else {
                this.errorMsg =
                    "Error " + verb + " plot. Request could not be created.";
            }
        }
    },
    created() {
        if (this.plotId != 0) {
        plotsService
            .getPlot(this.plotId)
            .then(response => {
            this.plot = response.data;
            })
            .catch(error => {
            if (error.response && error.response.status === 404) {
                alert(
                "Plot not available. This plot may have been deleted or you have entered an invalid plot ID."
                );
                this.$router.push("/farm");
            }
            });
        }
    }
};
</script>



<style>



form {
  padding: 20px;
  font-size: 16px;
  width: 500px;
}
form * {
  box-sizing: border-box;
  line-height: 1.5;
}
.field {
  display: flex;
  flex-direction: column;
}
.field label {
  margin: 4px 0;
  font-weight: bold;
}
.field input,
.field textarea {
  padding: 8px;
}
.field textarea {
  height: 300px;
}
.actions {
  text-align: right;
  padding: 10px 0;
}


</style>