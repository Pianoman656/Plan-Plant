<template>
  <div id="register" class="text-center">
    <form class="form-register container" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
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
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <label for="zip" class="sr-only">Zipcode</label>
      <input
        type="text"
        id="zip"
        class="form-control"
        placeholder="Zipcode"
        v-model="user.zip"
        required
      />
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
        zip: null
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
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