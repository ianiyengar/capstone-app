<template>
  <div class="home">
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
      toptens: [],
    };
  },
  created: function () {
    this.indexToptens();
  },
  methods: {
    indexToptens: function () {
      axios.get("/toptens").then((response) => {
        console.log("toptens index", response);
        this.toptens = response.data;
      });
    },
  },
};
</script>
