<template>
  <div id="user-home">
    <form class="container" @submit.prevent>
      <h1 class="h3 mb-3 font-weight-normal">Edit User Account</h1>

      <div class="user-info">
        <div>
          Current User Email:
          <em>{{ currentUserInfo.email }}</em>
        </div>
        <div>
          Current User Zipcode:
          <em>{{ currentUserInfo.zip }}</em>
        </div>
      </div>
      <label for="email">Email</label>
      <input
        name="email"
        type="text"
        id="email"
        class="form-control"
        placeholder="Email"
        v-model="user.email"
        required
        autofocus
      />
      <label for="zip">Zip</label>
      <input
        type="text"
        id="zip"
        class="form-control"
        placeholder="Zipcode"
        v-model="user.zip"
        required
      />
      <small class="alert">
        <span v-if="successful">Email & Zip Updated!</span>
      </small>
      <button id="save" @click.prevent="update()">
        Save
      </button>
      <ul id="plots">
        <li v-for="plot in plots" v-bind:key="plot.plotId">
          <button v-on:click="deletePlot(plot)">
            Delete
          </button>
          {{ plot['plotName'] }}
          <small class="alert">
            <span v-if="deleted">Plot Deleted!</span>
          </small>
        </li>
      </ul>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService'
import plotsService from '../services/PlotsService'

export default {
  name: 'user-home',
  data() {
    return {
      plots: [],
      user: {
        email: '',
        zip: '',
      },
      currentUserInfo: {
        email: '',
        zip: '',
      },
      successful: false,
      deleted: false
    }
  },
  methods: {
    update() {
      authService.updateAccount(this.user).then((res) => {
        if (res.status) {
          this.successful = true
        }
        authService.getUserInfo().then((res) => {
          this.currentUserInfo.email = res.data.email
          this.currentUserInfo.zip = res.data.zip
        })
      })
    },
    //async deletePlot(id) {
      // console.log("Plot delete: ", id)
      // plotsService.deletePlot(parseInt(id))
      // .catch(err => console.log("Error!: ", err))
      //console.log("Passed in id value: ", id)
      //await fetch(`https://localhost:44315/plot/${id}`, 
      //{
       // method: "delete"
     // })
      //.then(res => console.log(res))
      // .then(result => console.log("Result: ",result))
     // .catch(err => console.log("Fetch Error!: ", err))
    //},
    deletePlot(plot) {
        plotsService.deletePlot(plot).then((response) => {
          if (response.status === 200) {
            this.deleted = true;
            this.getPlots();
          }
        })
        .catch(error => {
          if (error.response.status === 404) {
            this.$router.push("/404");
          } else {
            console.error(error);
          }
        });
    },
    async getPlots() {
      plotsService.listPlots().then((res) => {
        this.plots = res.data
        // console.log('Plots[0]: ', this.plots[0])
        console.log('Res.Data: ', res.data)
      })
      .catch((err) => console.log(err))
    },
  },
  async mounted() {},
  computed: {},
  created() {
    authService.getUserInfo().then((res) => {
      this.currentUserInfo.email = res.data.email
      this.currentUserInfo.zip = res.data.zip
      // console.log(res.data)
    }),
  this.getPlots()
  },
}
</script>

<style scoped>
* {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
}
label,
h1,
h2,
h3 {
  color: #444;
}
a {
  text-decoration: none;
  margin: 0 auto;
  color: #444444;
}
button#save {
  width: 100%;
  background-color: var(--main-green);
  border: 0.7px solid #aaa;
  border-radius: 5px;
  padding: 8px 0;
  color: #fff;
  border-radius: 2px;
  margin: 10px auto;
  font-size: 16px;
  transition: color 0.3s, background-color 0.3s;
}
button#save:hover {
  background-color: #6aa33c;
  color: white;
}
.container {
  display: flex;
  flex-direction: column;
  max-width: 400px;
  justify-content: space-around;
  margin: 80px auto 0;
  border: 0.7px solid #aaa;
  padding: 60px;
  border-radius: 5px;
  background-color: white;
}
.container a {
  color: #0055c5;
}
input {
  margin-bottom: 25px;
  padding: 8px 15px;
  border: 0.7px solid gray;
  border-radius: 2px;
}
.user-info {
  margin: 30px 0;
  font: 14px 'san-serif';
}
.user-info em {
  margin-left: 5px;
  color: #888;
}
.alert {
  height: 10px;
  text-align: center;
  color: #777;
}
#plots {
  padding: 20px 0;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  border-top: 0.7px solid #dcdcdc;
  min-height: 120px;
}
#plots li {
  padding: 5px 2px;
  width: 50%;
  border: 0.7px solid transparent;
  border-radius: 3px;
  transition: border 0.3s;
}
#plots li:hover {
  border: 0.7px solid #aaa;
}
#plots li button:hover {
  cursor: pointer;
  border: 0.7px solid #ddd;
}
#plots li button {
  background-color: transparent;
  color: rgb(185, 0, 0);
  border: none;
  font-size: 10px;
  border: 0.7px solid #fff;
  transition: border 0.4s;
  margin-left: 5px;
}
</style>
