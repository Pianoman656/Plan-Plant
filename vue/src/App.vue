<template>
<div>
  <div id="app">
    <!-- <div class=""> -->
    <nav id="router-links">
      <img id="logo" src="../img/Plan&PlantLogo.jpeg">
      <router-link 
      v-if="$store.state.user.username === 'admin'" 
        v-bind:to="{ name: 'admin-home' }">
        Home
      </router-link>      

      <router-link 
      v-else-if="$store.state.user.username !== 'admin'" 
        v-bind:to="{ name: 'user-home' }">
        Home
      </router-link>  


      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
      >
        Logout
      </router-link>
      <router-link v-if="$store.state.token === ''" v-bind:to="{ name: 'login' }">Login</router-link>
      <router-link v-bind:to="{ name: 'register' }">Register</router-link>
      <router-link 
        v-if="$store.state.user.username !== 'admin'"
        v-bind:to="{ name: 'user-home' }"> 
          {{$store.state.token == '' ? "Account Home" : $store.state.user.username + " Home"}} 
      </router-link>
      <router-link v-if="$store.state.user.username === 'admin'" v-bind:to="{ name: 'admin-home' }">
        Admin Home  
      </router-link>      
    </nav>
    <router-view />
  </div>
      <h1 id="tagline">A Growing Guide for the Greener Gardener</h1>
</div>
</template>

<style>
:root {
  --main-green: #77bc3f;
}
body {
  background: #ebeff0 no-repeat fixed center;
  background-image: url('https://images.unsplash.com/photo-1560493676-04071c5f467b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2148&q=80');
  background-size: 100% 100%;
  height: 100vh;
  margin: 0;
  background-color: #fafafa;
  text-align: center;
}
ul {padding: 0;}
ul li {
  list-style: none;
}
nav#router-links {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
  text-decoration: none;
  color: #02020248;
    padding: 20px 0;
    background-color: white;
    text-align: center;
    border: 1px solid lightgray;
}
nav#router-links > a {
  color: var(--main-green);
  font-weight: 400;
  font-size: 16px;
  border-left: 0.7px solid lightgray;
  padding: 5px 15px;
  text-decoration: none;
}
nav#router-links > a:first-child {
  border-left: 0.7px solid transparent;
}
#logo {
  width: 80px;
}
#tagline {
  font-size:xx-large;
  font-weight: 400;
  color: #fff;
  text-shadow: 0px 0px 25px black, 0 0 5px black;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
}
</style>
