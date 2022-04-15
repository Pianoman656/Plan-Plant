<template>
  <div class="home">
    <h1>Admin Page</h1>
    <p v-if="$store.state.token == ''">You must be authenticated to see this</p>
    <!--  <p v-if="$store.state.user.username == 'admin'">Let's put the Admin stuff here</p>   -->

    <table>
      <thead>
        <tr>
          <th>&nbsp;</th>
          <th>Plant Name</th>
          <th>Square Area</th>
          <th>Cost</th>
          <th>Hardiness Zone</th>
          <th>Sun Requirements</th>
        </tr>
      </thead>
      <tbody>
        <!--
      <tr v-for="doc in docs" :key="doc.id" v-on:click="viewDocument(doc.id)">
        <td class="docs-icon">
          <img src="../assets/icons8-google-docs-48.png" />
        </td>
        <td class="name">{{ doc.name }}</td>
        <td>
          <img :src="doc.avatar" class="avatar" />
          <span class="ownedby">{{ doc.author }}</span>
        </td>
        <td>{{ doc.lastOpened }}</td>
      </tr>
    -->
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'admin-account'
}
</script>

<style>
table {
  width: 100%;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}

th {
  font-family: 'Work Sans', sans-serif;
  font-weight: 500;
  text-align: left;
}

h1 {
  color: rgb(33, 21, 138);
}
</style>
