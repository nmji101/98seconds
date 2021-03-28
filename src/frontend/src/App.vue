<template>
  <div id="app">
    <v-app id="inspire">
      <Header/>
      <img src="./assets/logo.png">
      <router-view/>
      <Footer></Footer>
    </v-app>
  </div>
</template>

<script>
import request from "request";
import Header from "./components/Header";
import Footer from "./Footer";

export default {
  name: 'App',
  components: {
    Header,       //헤더 컴포넌트 추가

  },
  mounted() {
    request('http://localhost:8081/api/hello', function (error,response,body) {
      window.console.error('error', error);
      window.console.log('statusCode', response && response.statusCode);
      window.console.log('body', body)
    })
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
