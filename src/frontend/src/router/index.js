import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Main from "../views/Main";
import ItemList from "../components/item/ItemList";
import ItemInsert from "../components/item/ItemInsert";

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main
    },
    {
      path: '/ItemList',
      name: 'ItemList',
      component: ItemList
    },
    {
      path: '/ItemInsert',
      name: 'ItemList',
      component: ItemInsert
    },
  ]
})
