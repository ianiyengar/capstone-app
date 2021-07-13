<template>
  <div class="users_index">
    <h1>All Top Tens</h1>
    <div v-for="user in users" v-bind:key="user.id">
      <h2>{{ user.name }}</h2>
      <div v-for="album in user.albums" v-bind:key="album.id">
        {{ album }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      users: {},
    };
  },
  created: function () {
    this.indexUsers();
  },
  methods: {
    indexUsers: function () {
      axios.get("/users").then((response) => {
        console.log("users index", response);
        this.users = response.data;
      });
    },
  },
};
</script>
