<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>

      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
      >
        Logout
      </router-link>

      <router-link
      v-if="$store.state.token === ''"
       v-bind:to="{ name: 'login' }">Login</router-link>

      <router-link v-bind:to="{ name: 'register' }">Register</router-link>

      <router-link v-bind:to="{ name: 'crop-gallery' }">
        Crop Gallery
      </router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
:root {
  --main-green: #019875;
}
body {
  height: 100vh;
  margin: 0;
  background-color: #fafafa;
}
#nav {
 color: #02020248;
    padding: 20px 0;
    /* max-width: 456px; */
    background-color: white;
    /* margin: 0 auto; */
    /* width: 100%; */
    text-align: center;
    border: 1px solid lightgray;
}
#nav > a {
  color: var(--main-green);
  font-weight: 400;
  font-size: 16px;
  border-left: 0.7px solid lightgray;
  padding: 5px 15px;
}
#nav > a:first-child {
  border-left: 0.7px solid transparent;
}
</style>
