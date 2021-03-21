<template>
  <div id="app">
    <v-app id="inspire">
      <img src="./assets/logo.png">
      <router-view/>
      <Footer></Footer>
    </v-app>
  </div>
</template>

<script>
import request from "request"
import Footer from "./Footer";

export default {
  name: 'App',
  components: {Footer},
  // mounted() {
  //   request('http://127.0.0.1:8080/api/hello', function (error,response,body) {
  //     window.console.error('error', error);
  //     window.console.log('statusCode', response && response.statusCode);
  //     window.console.log('body', body)
  //   })
  // }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
