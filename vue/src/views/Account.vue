<template>
<div id="account">
    <form @submit.prevent="account">
       <h1 class="h3 mb-3 font-weight-normal">Edit Account</h1>
    <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
    <input
        type="text"
        id="email"
        class="form-control"
        placeholder="Email"
        v-model="user.email"
        required        
      />
    <input
        type="text"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
       

    </form>
</div>
</template>


<script></script>

<style></style>