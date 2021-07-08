<template>
  <div class="home">
    <h1>New Top 10 List</h1>
    <div v-for="album in topAlbums" v-bind:key="album.id">
      Album {{ album.id }}:
      <select v-model="album.albumId">
        <option v-for="album in albums" v-bind:key="album.id" v-bind:value="album.id">
          {{ album.name }}
        </option>
      </select>
      <span>Selected: {{ album.albumId }}</span>
    </div>

    <button v-on:click="createList()">Create List</button>
  </div>
</template>

<style></style>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      topAlbums: [
        { id: 1, albumId: null },
        { id: 2, albumId: null },
        { id: 3, albumId: null },
        { id: 4, albumId: null },
        { id: 5, albumId: null },
        { id: 6, albumId: null },
        { id: 7, albumId: null },
        { id: 8, albumId: null },
        { id: 9, albumId: null },
        { id: 10, albumId: null },
      ],

      albums: [],
      toptens: [],
      newList: {},
    };
  },
  created: function () {
    this.indexAlbums();
  },
  methods: {
    indexToptens: function () {
      axios.get("/toptens").then((response) => {
        console.log("toptens index", response);
        this.toptens = response.data;
      });
    },
    indexAlbums: function () {
      axios.get("/albums").then((response) => {
        console.log("albums index", response);
        this.albums = response.data;
      });
    },
    createList: function () {
      this.topAlbums.forEach((album) => {
        console.log(album.albumId);
        var params = {
          album_id: album.albumId,
        };
        axios
          .post("/top_tens", params)
          .then((response) => {
            console.log("top_tens create", response);
            this.toptens.push(response.data);
            this.newTopten = {};
          })
          .catch((error) => {
            console.log("lists create error", error.response);
          });
      });
      // var params = {
      //   name: this.newList.name,
      // };
      // axios
      //   .post("/lists", params)
      //   .then((response) => {
      //     console.log("lists create", response);
      //     this.lists.push(response.data);
      //     this.newList = {};
      //   })
      //   .catch((error) => {
      //     console.log("lists create error", error.response);
      //   });
    },
  },
};
</script>
