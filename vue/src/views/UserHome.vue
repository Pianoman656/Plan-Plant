<template>
  <div id="user-home">
    <form class="container" @submit.prevent="update">
      <h1 class="h3 mb-3 font-weight-normal">Edit User Account</h1>
      <input
        type="text"
        id="email"
        class="form-control"
        placeholder="Email"
        v-model="user.email"
        required
        autofocus
      />
      <input
        type="text"
        id="zip"
        class="form-control"
        placeholder="Zipcode"
        v-model="user.zip"
        required
      />
      <ul id="plots">
        <li>
          <button v-on:click="deletePlots">
            Delete
          </button>
          Plot 1
        </li>
        <li>
          <button v-on:click="deletePlots">
            Delete
          </button>
          Plot 2
        </li>
        <li>
          <button v-on:click="deletePlots">
            Delete
          </button>
          Plot 3
        </li>
      </ul>
      <button type="submit">Save</button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService'
import cropService from '../services/CropService'

export default {
  name: 'user-home',
  plots: [],
  data() {
    return {
      user: {
        username: '',
        email: '',
        role: 'user',
        zip: null,
      },
    }
  },
  methods: {
    update() {
      authService.updateAccount(this.$store.state.userId, this.user)
    },
    deletePlots() {
      cropService.deletePlots(this.$store.state.userId)
    },
    async mounted() {
      this.plots = this.getPlots()
    },
  },
}
</script>

<style scoped>
* {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
}
:root {
  --main-green: #019875;
}
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
button[type='submit'] {
  width: 50%;
  background-color: var(--main-green);
  border: 1px solid var(--main-green);
  padding: 10px 0;
  color: white;
  border-radius: 2px;
  margin: 20px auto;
  font-size: 16px;
  box-shadow: 0 1px 8px rgba(61, 61, 61, 0.767);
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
#plots {
  margin: 20px 0;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  min-height: 120px;
}
#plots li {
  border: 0.7px solid #aaa;
  padding: 5px 2px;
  width: 50%;
  border-radius: 3px;
}
#plots li button {
  background-color: transparent;
  color: rgb(185, 0, 0);
  border: none;
  font-size: 10px;
}
</style>
