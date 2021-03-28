<template>
  <header>
    <h1>
      98Seconds
    </h1>
    <div class='menuWrap'>
      <ul class='menu'>
        <li>
<!--          <router-link to="/board/list">게시판</router-link>-->
          <a href="javascript:;">LOGIN</a>
        </li>
        <li><a href="javascript:;">JOIN</a></li>
        <li><a href="javascript:;">MY PAGE</a></li>
        <li><a href="javascript:;">CART</a></li>
        <li><a href="javascript:;">ORDER</a></li>
      </ul>
    </div>
  </header>
</template>
<style scoped>
header {
  width: 100%;
  text-align: center;
  position: relative;
  height: 80px;
  border-bottom: 1px solid black;
}

header h1 {
  position: absolute;
  top: 20px;
  left: 100px;
}

header ul.menu:after {
  display: block;
  clear: both;
  content: '';
}

header ul.menu {
  position: absolute;
  right: 0px;
  font-size: 13px;
}

header ul.menu li {
  float: left;
  padding: 10px 20px;
  list-style: none;
}

a {
  text-decoration: none;
  color: #333;
}
</style>
