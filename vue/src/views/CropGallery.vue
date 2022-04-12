<template>
  <div>
    <div
    style="max-width: 600px; height: 20px; color: white; border: 1px solid #333;"
     v-for="crop in crops" v-bind:key="crop.attributes.id">
    {{ crop.attributes['crop-name'] }}
    </div>
  </div>
</template>

<script>
import crops from '../services/Crops';

export default {
  name: "home",
  data() {
    return {
      crops: [],
      photos: []
    }
  },
  created() {
    crops.list().then((res) => {
      this.crops = res.data.data;
      this.photos = res.data.data
      console.log("Data List: ", res.data.data[0])
    })
  }
};
</script>
