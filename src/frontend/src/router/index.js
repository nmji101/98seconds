import Vue from 'vue'
import Router from 'vue-router'
import Main from "../views/Main";
import ItemList from "../views/item/ItemList";
import ItemInsert from "../views/item/ItemInsert";
import Login from "../views/login/Login";
import Join from "../views/join/Join";

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main
    },
    {
      path: '/itemList',
      name: 'ItemList',
      component: ItemList
    },
    {
      path: '/itemInsert',
      name: 'ItemInsert',
      component: ItemInsert
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/join',
      name: 'Join',
      component: Join
    },
  ]
})
