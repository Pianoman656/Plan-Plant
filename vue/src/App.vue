<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'login' }">Login</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'register' }">Register</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
:root {
  --main-green: #019875;
}
#nav {
  display: flex;
  color: #02020248;
  padding: 10px 30px;
  max-width: 300px;
}
#nav > a {
  color: var(--main-green);
  font-weight: 400;
  font-size: 16px;
}

</style>