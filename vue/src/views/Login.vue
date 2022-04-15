<template>
  <div id="login" class="text-center">
    <form class="form-signin container" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >
        Thank you for registering, please sign in.
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <button type="submit">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService'

export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    }
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit('SET_AUTH_TOKEN', response.data.token)
            this.$store.commit('SET_USER', response.data.user)
            if (this.user.username === 'admin') {
              this.$router.push('/admin')
            }
            else {
            this.$router.push('/user')
            }
          }
        })
        .catch((error) => {
          const response = error.response

          if (response.status === 401) {
            this.invalidCredentials = true
          }
        })
    },
  },
}
</script>

<style>
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
  margin: 5px auto;
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
</style>
