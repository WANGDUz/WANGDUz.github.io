import Vue from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import bus from './bus'
import axios from 'axios'
import Vant from 'vant'
import 'vant/lib/index.css'
import mentItem from './components/ment_item'
import bottomTabbar from './components/bottomTabbar'
import orderItem from './view/order_item'

Vue.prototype.bus = bus;
Vue.prototype.serverUrl ='http://127.0.0.1:5050/'
Vue.config.productionTip = false
//配置请求时保存session信息 
axios.defaults.withCredentials = true
//配置请求基础路径
axios.defaults.baseURL = "http://127.0.0.1:5050/"
//注册
Vue.prototype.axios = axios;

Vue.component('mentItem',mentItem);
Vue.component('bottomTabbar',bottomTabbar);
Vue.component('orderItem',orderItem);
Vue.use(Vant);

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
