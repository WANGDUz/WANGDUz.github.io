<template>
  <li>
    <div class="ding_dan_1">
      <router-link class="tarde" :to="'/shop/'+item.sid+'/肯德基宅急送'">
       <!-- 商店信息栏 -->
      <div class="tu_pian">
        <img src="https://p0.meituan.net/xianfu/7221d2332b2ffe6293c3e2a6d8d7c80614873.jpg">
      </div>
      <div class="tarde_name">
        <p class="dian_ming">肯德基宅急送</p>
        <van-icon name="arrow" class="wei_zhi" />
      </div>
      </router-link>
       <!-- 商品 数量 价格栏 -->
        <div class="tarde">
          <div class="food_message">
            <p v-for="(itema,index) of item.pname" :key="index">
              <span class="food_message_name" >{{itema}}</span>
              <span class="food_message_number">x{{item.num[index]}}</span>
            </p>
            <p class="data_time">{{orderTimea}}<span class="out_of_pocket">实付¥{{item.total}}</span></p>
          </div>
        </div>
     <!-- 订单状态栏 -->
        <p class="btn_p">
          <span class="cancle">{{item.ostate | ostate}}</span>
          <router-link v-if="item.ostate==0" to="/conpay" class="come_on">去付款</router-link>
          <router-link v-else :to="'/shop/'+item.sid+'/肯德基宅急送'" class="come_on">{{item.ostate==4?'再来一单':'取消订单'}}</router-link>
          <a @click="delord(item.id)" class="select_list">删除</a>
        </p>
    </div>
  </li>
</template>
<script>
export default {
  data(){
    return{  
      orderTimea:"",
      shijian:{
        order_time:""
      },
    }
  }, 
  methods:{
    delord(id){
      var url='orders/delord';
      this.axios.get(url,{params:{id}}).then(res=>{
      //3:将数据保存data中
      if(res.data.code==1){
        this.$toast("删除成功");
      }else{
        this.$toast("删除失败");
      }
    })
    }
  },
  props:["item"],
  created() {
    var orderTime=this.item.order_time;
    var arr=orderTime.split("T");
    this.orderTimea=arr[0];
    this.shijian=this.item;

    this.item.pname=eval(this.item.pname);
    this.item.num=eval(this.item.num);
  },
  filters:{
    ostate(state){
      switch (state) {
        case 0:
          return '待付款'
          break;
        case 1:
          return '等待接单'
          break;
        case 2:
          return '商家已接单'
          break;
        case 3:
          return '配送中'
          break;
        case 4:
          return '订单已完成'
          break;
      }
    }
  }
}
</script>
<style scoped>
p, div, ul, ol, li, i {
    margin: 0;
    padding: 0;
}
/* 页面背景颜色 内边距 */

.ding_dan ul li.ding_dan_1{
    position: relative;
    display: block;
}
/* 订单信息 背景 样式 */
.ding_dan ul li{
    background-color: #fff;
    padding-left: 15px;
    border-top: 1px solid #d7d7d7;
    border-bottom: 1px solid #d7d7d7;
    list-style: none;
    margin-bottom: 10px;
}
/* 图片大小 */
 .tu_pian{
    margin-right: 10px;
    width: 35px;
    height: 35px;
}
/* 图片大小 圆角 */
.tu_pian img{
    width:2.1875rem;height:2.1875rem;
    -webkit-border-radius: 50%;
}
/* 商店名 字体大小 颜色 外边距 */
.ding_dan ul li .ding_dan_1 .tarde .tarde_name{
    font-size: 16px;
    color: #323232 ;
    padding: 5px 10px 5px 0px;
    white-space: nowrap;
    flex-grow: 1;
    display: flex;
    justify-content: space-between;
}
/* 上下外边距 */
.ding_dan ul li .ding_dan_1 .tarde{
    padding: 10px 0;
    position: relative;
    display: flex;
}
/* 右箭头 位置 */
.wei_zhi{
    top:5px;
}
/* 商品信息栏  */
.food_message{
    flex-grow: 1;
    line-height: 1.8em;
    padding-right: 14px;
    color: black;
    font-size: .875rem;
}
/* 右浮 */
.food_message_number{
    float: right;
}
/* 中间隔线 */
.tarde::after{
    border-top: 1px solid #d7d7d7;
    content: ' ';
    display: block;
    width: 100%;
    position: absolute;
    left: 0;
    transform: scaleY(0.5);
    bottom: 0;
}
/* 时间 字体大小 颜色 */
.data_time{
    font-size: .75rem;
    color: #999;
}
/* 实付 字体大小 右浮 */
.out_of_pocket{
    font-size: .875rem;
    color: black;
    float: right
}
/* 订单取消框 定位 外边距 */
.ding_dan ul li .btn_p{
    position: relative;
    line-height: 27px;
    padding: 10px 0 10px 0px;
    height: 27px;
}
/* 订单取消 字体颜色 大小 */
.ding_dan ul li .btn_p .cancle{
    color: #999;
    font-size: .875rem;
    line-height: 20px;
}
/* 再来一单按钮 样式 */
.come_on{
    font-size: .875rem;
    display: inline-block;
    float: right;
    color: #333;
    border: solid 1px #FFD161;
    padding: 0 10px;
    margin-right: 14px;
    border-radius: 3px;
    background-color: #FFD161;
}
/* 删除按钮 样式 */
.select_list{
    font-size: .875rem;
    margin-right: .9375rem;
    background: #fff;
    border-radius: 3px;
    display: block;
    color: #333;
    padding: 0 10px;
    border: 1px solid #ddd;
    text-align: center;
    float: right;
}
</style>