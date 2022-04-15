<template>
  <div id="user-account">
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
          Plot 1
          <button v-on:click="deletePlots">
            Delete
          </button>
        </li>
        <li>
          Plot 2
          <button v-on:click="deletePlots">
            Delete
          </button>
        </li>
        <li>
          Plot 3
          <button v-on:click="deletePlots">
            Delete
          </button>
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
  name: 'user-account',
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
}
</style>
