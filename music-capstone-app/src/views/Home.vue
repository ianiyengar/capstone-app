<template>
  <div class="home">
    <!-- <div v-if="!spotifyAccessToken">
      <h1>Authorize Spotify Here</h1>
      <a
        href="https://accounts.spotify.com/authorize?client_id=82a96d9b37a94d40bd0646e83ed32d6e&response_type=code&redirect_uri=http://localhost:8080"
      >
        Authorize Spotify
      </a>
    </div>-->
    <div v-if="spotifyAccessToken">
      Search for Album:
      <input type="text" v-model="albumSearch" />
      <button v-on:click="searchSpotifyAlbums">Submit</button>

      <div v-for="searched_album in searched_albums" v-bind:key="searched_album.id">
        <h2>{{ searched_album.name }}</h2>
        <button v-on:click="createPick()">Add to Top Ten List</button>
        {{ searched_album }}
        <br />
        <br />
        <!-- <div v-for="image in searched_album.images" v-bind:key="image.url">
          <img v-bind:src="image.url" alt="" />
        </div> -->
        <img width="200px" v-if="searched_album.images.length > 0" v-bind:src="searched_album.images[0].url" alt="" />
      </div>
    </div>
    <h3>New Top 10 List</h3>
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
    <button v-on:click="randomAlbum()">Give Me New Music!</button>
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
      spotifyAccessToken: null,
      albumSearch: "",
      searched_albums: [],
    };
  },
  created: function () {
    this.indexAlbums();
    var spotifyCode = this.$route.query.code;
    console.log("The Spotify code is", spotifyCode);
    if (spotifyCode) {
      var params = { code: spotifyCode };
      axios.post("http://localhost:3000/spotify_authorize", params).then((response) => {
        console.log("Spotify access token", response.data);
        localStorage.setItem("spotify_access_token", response.data.access_token);
        this.$router.push("/");
      });
    }

    this.spotifyAccessToken = localStorage.getItem("spotify_access_token");
    if (this.spotifyAccessToken) {
      axios
        .get("http://localhost:3000/spotify_user_info?spotify_access_token=" + this.spotifyAccessToken)
        .then((response) => {
          console.log("Spotify user info", response.data);
        });
    }
    axios
      .get(
        "http://localhost:3000/spotify_search?search=" +
          this.albumSearch +
          "&spotify_access_token=" +
          this.spotifyAccessToken
      )
      .then((response) => {
        console.log("Spotify search", response.data);
      });
  },

  methods: {
    indexToptens: function () {
      axios.get("/toptens").then((response) => {
        console.log("toptens index", response);
        this.toptens = response.data;
      });
    },
    // randomAlbum: function () {
    //   axios.get("/random_album").then((response) => {
    //     console.log("album choice", response);
    //     this.album = response.data;
    //   });
    // },
    randomAlbum: function () {
      console.log("Listen to This!");
    },

    indexAlbums: function () {
      axios.get("/albums").then((response) => {
        console.log("albums index", response);
        this.albums = response.data;
      });
    },
    searchSpotifyAlbums: function () {
      axios
        .get(
          "http://localhost:3000/spotify_search?search=" +
            this.albumSearch +
            "&spotify_access_token=" +
            this.spotifyAccessToken
        )
        .then((response) => {
          console.log("Spotify search", response.data);
          this.searched_albums = response.data.albums.items;
        });
    },

    // createPick: function () {

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
