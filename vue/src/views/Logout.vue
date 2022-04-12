<template>
  <h1>Logout</h1>
</template>

<script>
export default {
  created() {
    this.$store.commit("LOGOUT");
    this.$router.push("/login");
  }
};
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