<template>
  <div id="app">
    <Main/>
      <main>
        <router-view></router-view>
      </main>
  </div>
</template>

<script>
  import Main from './components/Main.vue'

  export default {
    name: 'App',
    components: {
      Main
    }
  }
</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap');

  * {
    font-family: 'Roboto Condensed', sans-serif;
  }

  body, html {
    margin: 0;
    padding: 0;
  }

  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  main {
    min-height: calc(100vh - 45px - 46px - 2rem);
  }
</style>
