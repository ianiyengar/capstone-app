<template>
  <div class="home">
    <h1>New Top 10 List</h1>
    <div v-for="album in topAlbums" v-bind:key="album.id">
      Album {{ album.id }}:
      <input type="text" v-model="album.albumId" />
      <select v-model="selected">
        <option v-for="option in options" v-bind:key="option.value">
          {{ option.text }}
        </option>
      </select>
      <span>Selected: {{ selected }}</span>
    </div>

    <button v-on:click="createList()">Create List</button>

    <div v-for="topten in toptens" v-bind:key="topten.id">
      <h2>{{ topten.name }}</h2>
      <img v-bind:src="topten.url" v-bind:alt="topten.name" />
      <p>album: {{ topten.album }}</p>
    </div>
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

      toptens: [],
      newList: {},
    };
  },
  created: function () {
    // Get all albums from backend
    this.indexToptens();
  },
  methods: {
    indexToptens: function () {
      axios.get("/toptens").then((response) => {
        console.log("toptens index", response);
        this.toptens = response.data;
      });
    },
    createList: function () {
      this.topAlbums.forEach((album) => {
        console.log(album.albumId);
        var params = {
          album: this.albumId.name,
        };
        axios
          .post("/toptens", params)
          .then((response) => {
            console.log("toptens create", response);
            this.toptens.push(response.data);
            this.newTopten = {};
          })
          .catch((error) => {
            console.log("lists create error", error.response);
          });
        // Make web request to post/toptens w/ params for album id
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
