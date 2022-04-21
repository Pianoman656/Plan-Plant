import Vue from 'vue'
import Router from 'vue-router'
//import Home from '../views/Home.vue'
import AdminHome from '../views/AdminHome.vue'
import UserHome from '../views/UserHome.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import Plant from '../views/Plant.vue'
import CreatePlant from '../views/CreatePlant.vue'
import EditPlant from '../views/EditPlant.vue'
import store from '../store/index'
import NotFound from '../views/NotFound.vue'
import MyCart from '../views/MyCart.vue'
import Farm from '../views/Farm.vue'
import CreatePlot from '../views/CreatePlot.vue'
import ViewPlot from '../views/ViewPlot.vue'
import Suggestions from '../views/Suggestions.vue'


Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/admin',
      name: 'admin-home',
      component: AdminHome,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/user',
      name: 'user-home',
      component: UserHome,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },    
    {
      path: "/logout",
      name: "logout",
      component: Logout, 
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },   
    {
      path: '/plant/create',
      name: 'create-plant',
      component: CreatePlant
    },
    {
      path: '/plant/:plantId/edit',
      name: 'edit-plant',
      component: EditPlant
    },
    
    {
      path: '/plant/:plantId',
      name: 'Plant',
      component: Plant
    },
    
    {
      path: '/404',
      name: 'NotFound',
      component: NotFound
    },
    {
      path: '/mycart',
      name: 'mycart',
      component: MyCart
    },
    {
      path: '/farm',
      name: 'farm',
      component: Farm
    },
    {
      path: '/plot/create',
      name: 'create-plot',
      component: CreatePlot
    },
    {
      path: '/suggestions',
      name: 'suggestions',
      component: Suggestions
    },
    {
      path: '/plot/:plotId',
      name: 'view-plot',
      component: ViewPlot
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
