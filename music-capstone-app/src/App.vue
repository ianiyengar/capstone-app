<template>
  <div id="app">
    <!-- Header-->
    <header class="masthead text-center text-white">
      <div class="masthead-content">
        <div class="container px-5">
          <h1 class="masthead-heading mb-0">The Music Guru's Lair</h1>
          <h2 class="masthead-subheading mb-0">Find new Music...</h2>
        </div>
        <div>
          <a
            class="btn btn-primary btn-xl rounded-pill mt-5"
            href="https://accounts.spotify.com/authorize?client_id=82a96d9b37a94d40bd0646e83ed32d6e&response_type=code&redirect_uri=http://localhost:8080"
          >
            Authorize Spotify Here
          </a>
        </div>
        <!-- <div v-if="spotifyAccessToken">
          Search for Album:
          <input type="text" v-model="albumSearch" />
        </div> -->
      </div>
      <div class="bg-circle-1 bg-circle"></div>
      <div class="bg-circle-2 bg-circle"></div>
      <div class="bg-circle-3 bg-circle"></div>
      <div class="bg-circle-4 bg-circle"></div>
    </header>

    <div id="nav">
      <router-link to="/">Home</router-link>
      |
      <router-link to="/about">About</router-link>
      |
      <router-link to="/signup">Signup</router-link>
      |
      <router-link to="/login">Login</router-link>
      |
      <router-link to="/logout">Logout</router-link>
      |
      <router-link to="/users">See More Top Ten Lists!</router-link>
      <!-- |
      <router-link to="/top_tens">New Album List</router-link> -->
    </div>

    <div class="container">
      <div v-if="flashMessage" class="alert alert-success" role="alert">{{ flashMessage }}</div>
      <router-view />
      <!-- Footer-->
      <footer class="py-5 bg-black">
        <div class="container px-5">
          <p class="m-0 text-center text-black small">Copyright &copy; Spotify and Ian Iyengar 2021</p>
        </div>
      </footer>
    </div>
  </div>
</template>

<style>
h1 {
  font-family: Georgia, "Times New Roman", Times, serif;
  font-size: larger;
}

h2 {
  font-family: Georgia, "Times New Roman", Times, serif;
}
</style>

<script>
export default {
  data: function () {
    return {
      flashMessage: null,
    };
  },
  methods: {
    isLoggedIn: function () {
      return localStorage.getItem("jwt");
    },
  },
};
</script>
