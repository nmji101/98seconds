<template>
  <header>
    <h1>
      <router-link to="/">98Seconds</router-link>
    </h1>
    <div class='menuWrap'>
      <ul class='menu'>
        <li>
          <router-link to="/login">LOGIN</router-link>
        </li>
        <li><a href="javascript:;">JOIN</a></li>
        <li><a href="javascript:;">MY PAGE</a></li>
        <li><a href="javascript:;">CART</a></li>
        <li><a href="javascript:;">ORDER</a></li>
      </ul>
    </div>
    <div class="itemMenuWrap">
      <ul class="itemMenu">
        <li><a href="javascript:;">BEST 50</a></li>
        <li><a href="javascript:;">NEW</a></li>
        <li><a href="javascript:;">SALE</a></li>
        <li><router-link to="/ItemList">OUTER</router-link></li>
        <li><a href="javascript:;">TOP</a></li>
        <li><a href="javascript:;">BOTTOM</a></li>
        <li><a href="javascript:;">DRESS</a></li>
        <li><a href="javascript:;">ACC</a></li>
      </ul>
    </div>
  </header>
</template>
<style scoped>
header {
  width: 100%;
  text-align: center;
  position: relative;
  height: 150px;
  border-bottom: 1px solid black;
}

header h1 {
  position: absolute;
  top: 50px;
  left: 100px;
}

header ul.menu:after, header ul.itemMenu:after {
  display: block;
  clear: both;
  content: '';
}

header ul.menu {
  position: absolute;
  right: 0px;
  font-size: 13px;
}
header ul.itemMenu{
  display: inline-block;
  margin-top: 100px;
}
header ul.menu li{
  float: left;
  padding: 10px 20px;
  list-style: none;
}
header ul.itemMenu li{
  float: left;
  padding: 10px 20px;
  list-style: none;
}
a {
  text-decoration: none;
  color: #333;
}
</style>
