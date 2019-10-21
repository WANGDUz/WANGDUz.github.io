import Vue from 'vue'
import Router from 'vue-router'
import Red_envelopes from './view/red_envelopes' //吕 红包页面
import Indexsearch from './view/search' //吕 搜索页面
import questions from './view/questions'  //程 常见问题
import Submit from './view/Submit' //于  提交订单
import address from './view/address'//朱  地址列表
import newadd from './view/newadd'//朱  新增地址
import changeadd from './view/changeadd'//修改地址
import login from './view/login' //程  登录
import Shop from './view/shop'//王  商家页面总组件
import conpay from './components/conpay'//确认支付
import ment_item from './components/ment_item'
import home from './view/home'
import order from './view/Order'
import mine from './view/mine'
import order_item from './view/order_item'
import dfood from './view/dfood'
import kong from './view/kong'
import condition from './view/condition'
import city from './view/city'
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",component:home},  //吕 红包页面
    {path:"/red_envelopes",component:Red_envelopes},  //吕 红包页面
    {path:"/indexsearch",component:Indexsearch},  //吕 首页搜索页
    {path:"/questions",component:questions},  //程  常见问题
    {path:"/submit",component:Submit},
    {path:"/address",component:address},//朱 地址列表
    {path:"/changeadd",component:changeadd}, //修改地址
    {path:"/newadd",component:newadd}, //新增地址
    {path:"/login",component:login},
    { path: "/shop/:sid/:sname", component: Shop,props:true},       //王 商家主页
    {path:"/conpay",component:conpay},//确认支付
    {path:"/ment_item",component:ment_item},
    {path:"/home",component:home},
    {path:"/order",component:order},
    {path:"/mine",component:mine},
    {path:"/order_item",component:order_item},
    {path:"/dfood",component:dfood},
    {path:"/kong",component:kong},
    {path:"/condition",component:condition},
    {path:"/city",component:city}
  ]
})
