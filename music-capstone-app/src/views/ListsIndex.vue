<template>
  <div class="users_index">
    <h1>All Top Tens</h1>
    <div v-for="user in users" v-bind:key="user.id">
      <h2>{{ user.name }}</h2>
      <div class="row">
        <div class="col-3" v-for="album in user.albums" v-bind:key="album.id">
          {{ album.name }}

          <!-- <div v-for="cover_art_url in albums.cover_art_url" v-bind:key="album.cover_art_url">
          <img v-bind:src="cover_art_url.url" alt="" />
          {{ cover_art_url }}
        </div> -->
          <img width="200px" v-bind:src="album.cover_art_url" alt="" />
        </div>
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
