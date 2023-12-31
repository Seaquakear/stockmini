import Vue from 'vue'
import Router from 'vue-router'
import AHome from '@/components/ahome'
import Subs from '@/components/subs'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/ahome',
      name: 'AHome',
      component: AHome
    },
    {
      path: '/subs',
      name: 'Subs',
      component: Subs
    }
  ]
})
