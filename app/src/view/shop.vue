<template>
  <div class="shop">
    <div class="s_header">
      <div class="h_top">
        <router-link to="/home">
          <van-icon name="arrow-left" class="left_icon"/>
        </router-link>
      </div>
      <div class="h_main">
        <!-- 商家logo -->
        <img class="shop_logo" :src="'http://127.0.0.1:5050/'+shopInfo.logo_img">
        <div class="info">
          <div class="info_content">
            <div>{{shopInfo.send_time>60?(shopInfo.send_time/60).tofixed(2)+'小时':(shopInfo.send_time)+'分钟'}} | {{shopInfo.testdist>=1000?(shopInfo.testdist/1000).tofixed(1)+'km':shopInfo.testdist+'m'}}</div>
            <div class="notice van-ellipsis">公告：{{shopInfo.notice}}</div>
            <!-- 优惠轮播和右侧箭头，实现弹窗和向子组件传弹窗 -->
            <div class="discount" @click="showPopup">
              <!-- 优惠内容轮播 -->
              <van-swipe style="height: 16px;" :show-indicators="false" :autoplay="3000" vertical>
                <!-- 满减 -->
                <van-swipe-item v-if="shopInfo.coupon_money" class="discount-item van-ellipsis"><i class="icon iconjian"></i><span v-for="(item,index) of shopInfo.coupon_money" :key="index">满{{item[0]}}减{{item[1]}}<span v-if="shopInfo.coupon_money[index+1]">;</span></span></van-swipe-item>
                <!-- 折扣 -->
                <van-swipe-item v-if="shopInfo.zhe" class="discount-item"><i class="icon iconzhe"></i>折扣商品{{shopInfo.zhe}}折起</van-swipe-item>
                <van-swipe-item v-if="shopInfo.zeng" class="discount-item"><i class="icon iconzeng"></i>{{shopInfo.zeng[1]}}</van-swipe-item>
                <van-swipe-item v-if="shopInfo.fan" class="discount-item"><i class="icon iconfan"></i>实际支付{{shopInfo.fan[0]}}元返{{shopInfo.fan[1]}}元商家代金券</van-swipe-item>
              </van-swipe>
              <van-icon name="arrow" class="right-icon"/>
            </div>
          </div>
        </div>
      </div>
      <van-tabs v-model="active" animated class="shop_main">
        <van-tab title="点餐"><product @showoverlay="showoverlay = true" :proall="proall" :procate="cate"></product></van-tab>
        <van-tab title="评价" ><comment :sid="sid"></comment></van-tab>
        <van-tab title="商家"><storedetails @showPopup="showPopup"></storedetails></van-tab>
      </van-tabs>
    </div>
    <!-- 空购物车 -->
    <div class="b_cart" v-show="priceall==0&&active==0">
      <div class="carticon" :class="have">
        <div v-show="alCount">{{alCount}}</div>
      </div>
      <div class="price">
        <div>
          <span class="money">
            <span>￥</span>
            {{alPrice}}
          </span>
        </div>
        <span class="">另需配送费¥{{shopInfo.send_cost}}</span>
      </div>
      <div class="cango" v-show="alPrice<=shopInfo.floor_send_cost">¥{{shopInfo.floor_send_cost}}起送</div>
      <div @click="tosubmit" class="cango ok" v-show="shopInfo.floor_send_cost<alPrice">去结算</div>
    </div>
     <!-- 商家信息弹窗 -->
    <van-popup v-model="showdetails" position="bottom" class="tan">
        <div>
            <div v-if="shopInfo.zhe" class="zhekou discount-item van-ellipsis"><i class="icon iconzhe"></i>折扣商品{{shopInfo.zhe}}折起</div>
            <div v-if="shopInfo.zeng" class="zhekou discount-item van-ellipsis"><i class="icon iconzeng"></i>{{shopInfo.zeng[1]}}</div>
            <div v-if="shopInfo.coupon_money" class="zhekou discount-item van-ellipsis">
              <i class="icon iconjian"></i>
              <span v-for="(item,index) of shopInfo.coupon_money" :key="index">满{{item[0]}}减{{item[1]}}
                <span v-if="shopInfo.coupon_money[index+1]">;</span>
              </span></div>
            <div v-if="shopInfo.fan" class="zhekou discount-item van-ellipsis"><i class="icon iconfan"></i>实际支付{{shopInfo.fan[0]}}元返{{shopInfo.fan[1]}}元商家代金券</div>
            <div class="popeisong">
                <div class="pei">配送</div>
                <p class="qisong">起送:￥0</p>
                <p class="qisong">配送时间:08:00--22:00</p>
            </div>
            <div>
                <div class="gonggao">公告</div>
                <p class="gonggao1">欢迎光临肯德基急宅送，专业外送，全程保温，准时送达</p>
            </div>
        </div>
    </van-popup>
    <!-- 公告 end notice -->
    <!-- 商品详情card弹窗 -->
    <van-overlay :show="showoverlay" @click="showoverlay = false"/>
    <div class="procard" v-show="showoverlay">
      <div class="procard_body">
        <div>
          <img class="procardimg" :src="card.cover?serverUrl+card.cover:''" alt="">
        </div>
        <!-- 详情介绍 -->
        <dl class="procard-detail">
          <dt>{{card.pname}}</dt>
          <dd class="sale-like">
            <span>月售{{card.sale}}</span>
            <span>赞{{card.ulike}}</span>
          </dd>
          <dd class="detailall">{{card.pdesc}}</dd>
        </dl>
        <!-- 价格及加入购物车 -->
        <div class="priceadd">
          <div>￥{{card.price}}</div>
          <div class="tocart">加入购物车</div>
        </div>
      </div>
      <button class="clocard" @click="showoverlay = false"></button>
    </div>
  </div>
</template>

<script>
import comment from '../components/shop/Comment'
import product from '../components/shop/product'
import storedetails from '../components/shop/storedetails'
export default {
  data() {
    return {
      // alPrice:0,
      // alCount:0,
      // card:this.$store.getters.getActiveCard,              //卡片商品信息
      cate:[],              //保存请求的产品分组
      priceall:0,               //保存当前选中商品的总价
      showoverlay:false,    //控制产品卡片显示
      showdetails: false,  //控制详情弹窗显示
      active:0,           //商家页面切换
      proall:[],        //ajax获取的全部商品信息
      shopInfo:{logo_img:'fox.png'}         //保存ajax获取的商家信息,默认显示logo，防止请求中报错
    }
  },
  computed:{
    // 购物车图片
    have(){
      if(this.alCount>0){
        return 'have';
      }else{
        return ''
      }
    },
    card(){
      return this.$store.getters.getActiveCard;
    },
    // 购物车总数
    alCount(){
      return this.$store.getters.getActiveCart.alCount;
    },
    // 购物车总价格
    alPrice(){
      return this.$store.getters.getActiveCart.alPrice;
    }
  },
  props:['sid','sname'],
  methods: {
    // 跳转提交方法
    tosubmit(){     //sid:'',sname: '',			sendCost:0,alPrice: 0			proName:[],	proPrice: [],	proCount: [],
      var uid = localStorage.getItem('uid');
      if(!uid){
        this.$dialog.confirm({
        title: '您未登录',
        message: `请先登录`
        }).then(res=>{
        //跳转登录组件
        this.$router.push("/login")
        }).catch(() => {
        // on cancel
        })
        return;
      }
      var cart=this.$store.getters.getActiveCart;
      var sid=this.sid;
      var sname=this.sname;
      var sendCost=this.shopInfo.send_cost;
      var alPrice=cart.alPrice;
      var proName=[];
      var proPrice=[];
      var proCount=[];
      var proImg=[];
      for(var i in cart.count){
        if(cart.count[i]>0){
          proCount.push(cart.count[i]);
          proName.push(cart.pname[i]);
          proPrice.push(cart.price[i]);
          proImg.push(cart.img[i]);
        }
      }
      this.$store.commit('createCommitMsg',{sid,sname,sendCost,alPrice,proName,proPrice,proCount,proImg});
      this.$router.push('/submit');
      // console.log(this.$store.getters.getCommitMsg);
    },
    loadProduct(){
      for(var index in this.proall){
        if(this.proall[index][0].pname){
          var item=this.proall[index];
          for(var i in item){
            this.$store.commit("initActiveCart",{price:item[i].price,pid:item[i].pid,img:item[i].cover,pname:item[i].pname});
          }
        }
      }
    },
    showPopup() {
      this.showdetails = true;
    },
    // 获取商家所有商品，发送ajax请求
    getProducts(){
      //功能一:当组件创建成功后获取第一页数据 
      //1:创建url地址
      var url = "products";
      var sid = this.sid;
      //2:发送ajax请求获取数据
      this.axios.get(url,{params:{sid}}).then(res=>{
       //3:将数据保存data中
       if(res.data.code==1){
         var pros=res.data.data;    //所有产品混编信息
         for(var i in pros){
           var item=pros[i];
           item.ord=i;
           var cateno=item.cateno-1;
           if(!this.proall[cateno]){
             this.proall[cateno]=[].concat(item);
             var cateno=item.cateno;
             var catename=item.catename;
             this.cate.push([cateno,catename]);
             this.$store.commit('initActiveCartcc');
           }else{
             this.proall[cateno]=this.proall[cateno].concat(item);
           }
         }
       }else{
         this.$toast("产品加载失败");
       }
       this.loadProduct();
        // console.log(this.$store.getters.getActiveCart);
      })
    },
    // 获取当前商家的商家信息
    getShopInfo(){
      var sid=this.sid
      //1:创建url地址
      var url = "shopInfo";
      //2:发送ajax请求获取数据
      this.axios.get(url,{params:{sid}}).then(res=>{
       //3:将数据保存data中
        if(res.data.code==1){
         this.shopInfo=res.data.data[0];
         this.shopInfo.fan=eval(this.shopInfo.fan);
         this.shopInfo.zeng=eval(this.shopInfo.zeng);
         this.shopInfo.coupon_money=eval(this.shopInfo.coupon_money);
        }else{
         console.log("无此商家");
       }
      })
    }
  },
  created(){
    this.getProducts();
    this.getShopInfo();
  },
  components:{
    comment,
    product,
    storedetails
  }
}
</script>

<style>
dd{
  margin:0;
}
.shop{
  padding-bottom:52px;
}
.s_header>.h_top,.s_header>.h_main{
  width: 100%;
  background: #2e2f3b;
}
.h_top{
  height:3.125rem;
  position: relative;
}
.h_top::after{
  content:'';
  position: absolute;
  bottom:0;
  left:0;
  right:0;
  box-sizing: border-box;
  height: 1px;
  border-bottom:1px solid #fff;
  transform: translateY(0.5);
  transform-origin: 0 0;
}
.h_main{
  height:5rem;
  /* border-top:1px solid #fff; */
  position: relative;
  margin-bottom:1.25rem;
}
.left_icon{
  color:white;
  margin:1rem;
}
.shop_logo{
  width:5.3125rem;
  height: 4rem;
  display:block;
  position: absolute;
  top:0.3125rem;
  left:0.625rem;
  border-radius: 2px;
}
.info{
  padding:0.3125rem 0 0 5.9375rem;
}
.info_content{
  height:4rem;
  padding-left:0.625rem;
  font-size: 12px;
  color:#fff;
}
.notice{
  padding:0.4rem 0;
}
.iconjian{
  background-image: url(../../public/lv/jian.png);
}
.iconzhe{
  background-image: url(../../public/lv/zhe.png);
}
.iconzeng{
  background-image: url(../../public/icon/zeng.png);
}
.iconfan{
  background-image: url(../../public/icon/fan.png)
}
.icon{
  display: inline-block;
  width:0.9375rem;
  height:0.9375rem;
  background-size:0.9375rem 0.9375rem;
  vertical-align: bottom;
  margin-right:0.3rem;
}
.discount{
  margin-top:0.28rem;
  position: relative;
}
.discount-item{
  line-height: 15px;
}
.discount .right-icon{
  position: absolute;
  top:0;
  right:0.5rem;
}
[class*=van-hairline]::after{
  border-top:0 !important; 
}
/* 购物车 */
.b_cart{
  width:100%;
  height:3.125rem;
  position: fixed;
  bottom:0;
  left:0;
  display: flex;
  background:#3b3b3c;
  color:#999;
  justify-content: space-between;
}
.b_cart>div{
  height:3.125rem;
}
.b_cart>.carticon{
  width:3.125rem;
  height:3.125rem;
  background:url(../../public/icon/shopcart0.png);
  background-size:3.125rem 3.125rem;
  margin:0 0.625rem;
  position: relative;
  bottom:0.625rem;
  left:0;
}
.b_cart>.carticon.have{
  background-image: url(../../public/icon/shopcart1.png);
}
.b_cart>.carticon.nohave{
  background-image: url(../../public/icon/shopcart0.png);
}
.b_cart>.carticon.have>div{
  background:#FB4E44;
  color:#fff;
  width:30px;
  height:30px;
  position: absolute;
  top:0;
  right:0;
  border-radius: 50%;
  line-height: 30px;
  text-align: center;
  transform: scale(0.5) translate(50%, -50%);
}
.b_cart>.price{
  flex-grow: 1;
  padding-top:0.125rem;
}
.b_cart>.price>div{
  margin-bottom:-0.125rem;
}
.b_cart>.price>span{
  font-size: 0.75rem;
}
.b_cart>.cango{
  padding:0 1.125rem;
  line-height:3.125rem;
}
.b_cart>.cango.ok{
  background-image: linear-gradient(-135deg, #FFBD27 0%, #FFD161 100%);
  color:#555;
  padding:0 1.875rem;
}
.money{
  font-size: 1.5rem;
  color:#fff;
}
.money>span{
  font-size: 1rem;
  font-weight:bold;
  vertical-align:0.125rem;
  margin-right: -0.375rem;
}
/*弹窗*/

/*弹窗折扣*/
.zhekou{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:0.8rem;
    font-size: 0.7rem;
}
/*配送*/
.popeisong{
  margin:1rem 2rem;
  font-size: 0.7rem;
}
.gonggao1{
    margin-right:2rem;
    font-size: 0.7rem;
    margin-left:2rem;
    margin-top:0;
}
.pei{
    display:flex;
    margin-top:0;
    margin-bottom:0.1rem;
    font-size:1.1rem;
}
.qisong{
    margin-top:0;
    margin-bottom:0;
}
/*公告*/
.gonggao{
    margin-left:2rem;
    display:flex;
    font-size:1.1rem
}
.shop_main .van-tabs__line{
  height:2px;
  background-color:#f5a64b;
  width:25px !important;
}
/* 产品详情卡片 */
.procard{
    border-radius: 0;
    position: fixed;
    flex: 1 1 auto;
    width: 84vw;
    max-height: 88vh;
    padding-bottom: 60px;
    background: transparent;
    left:50%;
    top:50%;
    transform: translate(-50%,-50%);
    z-index:2;
}
.procard_body{
  border-radius: 8px;
  overflow: hidden;
  background-color:#fff;
}
.procard_body>div:first-child{
  background: url(../../public/product/bg.png);
  background-size: 100% 100%;
}
.procardimg{
  width:100%;
  display: block;
}
.procard-detail{
  background:#fff;
  margin: 0;
  padding: 10px 17px 2px;
  max-height: 100px;
  overflow-y: auto;
  box-sizing: border-box;
}
.procard-detail>dt{
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  color: #333333;
  font-weight: bolder;
  margin-bottom: 2px;
  height: 22.5px;
  line-height: 22.5px;
  font-size: 16px;
}
.procard-detail .sale-like{
  font-size: 12px;
  font-family: mtsi-font;
  margin-bottom:5px;
}
.procard-detail .detailall{
  margin:10px 0 16px;
  font-size: 12px;
  color: #666;
  line-height: 15px;
}
.priceadd{
  display: flex;
  justify-content: space-between;
  padding: 8px 17px;
  background-color: #fafafa;
}
.priceadd>div:first-child{
  color:#fb4e44;
  line-height: 25px;
  font-size: 24px;
  font-weight: bold;
}
.priceadd>.tocart{
  background: linear-gradient(-135deg, #FFBD27 0%, #FFD161 100%);
  padding:0 15px;
  border-radius:25px;
  height: 25px;
  font-size: 12px;
  line-height: 25px;
  color:#333;
}
.procard .clocard{
  height: 40px;
  width: 40px;
  border-radius:50%;
  background:url(../../public/product/clocard.png);
  background-size:100%;
  border:0;
  position: absolute;
  left:50%;
  margin-left:-20px;
  bottom:0;
}
</style>