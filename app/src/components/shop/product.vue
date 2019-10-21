<template>
<div>
  <div class="product-list">
    <!-- 左侧导航栏 -->
    <div class="plmask">
      <div class="prolist">
        <van-sidebar v-model="activeKey" class="sidebar">
          <van-sidebar-item v-for="(item,index) of procate" :key="index" :title="item[1]" :data-cateid="item[0]" :info="cartCC[index]!=0?cartCC[index]:''" :url="'#'+item[0]"/>
        </van-sidebar>
      </div>
    </div>
    <!-- 右侧商品栏 -->
    <div class="proall">
      <div class="kind" v-for="(item,index) of proall"  :key="index">
        <dl v-if="item[0].pname">
          <dt :id="item[0].cateno">{{item[0].catename}}</dt>
          <dd v-for="(i,num) of item"  :key="num" @click="overlay(i)">
            <!-- 商品图片 -->
            <div class="pro_img">
              <img :src="'http://127.0.0.1:5050/'+i.cover" alt="">
            </div>
            <!-- 商品详情 -->
            <div>
              <!-- 商品详细 -->
              <div class="prodetails">
                <!-- 商品名 -->
                <div class="title">{{i.pname}}</div>
                <!-- 商品介绍 -->
                <div class="details">{{i.pdesc}}</div>
                <!-- 销售量和点赞 -->
                <div class="other">
                  <span>已售{{i.sale}}</span>
                  <span>赞{{i.ulike}}</span>
                </div>
                <!-- 价格 -->
                <div class="proprice">
                  <!-- 售价 -->
                  <div class="nowprice">
                    <span class="npicon">￥</span>
                    {{i.price}}
                  </div>
                  <!-- 原价 -->
                  <span class="oprice" v-if="i.oprice">￥{{i.oprice}}</span>
                </div>
                <!-- btn -->
                <div class="procount">
                  <button class="subbtn" v-if="count[i.ord]>0" @click.stop="Countx(-1,i.ord,i.cateno)">-</button>
                  <span class="count" v-if="count[i.ord]>0">{{count[i.ord]}}</span>
                  <button class="addbtn" @click.stop="Countx(1,i.ord,i.cateno)">+</button>
                </div>
              </div>
              <!-- 折扣 -->
              <div class="discount" v-if="i.discount"><span>{{i.discount}}</span></div>
            </div>
          </dd>
        </dl>
      </div>
    </div>
  </div>
</div>
</template>
<script>
export default {
  data() {
    return {
      // 从vuex中获取每个分类中的已选择数量
      cartCC:this.$store.getters.getActiveCart.cateCount,
      activeKey: 0,
       count:this.$store.getters.getActiveCart.count, 
       price:this.$store.getters.getActiveCart.price,
       pid:this.$store.getters.getActiveCart.pid,
      // pord:[]       //保存产品顺序
    }
  },
  computed:{
  },
  methods:{
    tocate(cateid){
      window.location.href('#'+cateid);
    },
    Countx(num,ord,n){
      n=parseInt(n-1);
      ord=parseInt(ord);
      num=parseInt(num);
      this.$store.commit('changeChoosePro',{num,ord,n});
    },
    overlay(item) {//传递当前产品信息交卡片显示
      this.$store.commit("updateCard",item);
      this.$emit("showoverlay");
      // console.log(this.$store.getters.getActiveCard);
    }
  },
  props:["showoverlay","proall","procate","changeCount"]
}
</script>
<style>
  .product-list{
    display: flex;
    min-height: 80vh;
    max-height: 84vh;
  }
  .prolist{
    height:100%;
    background:#fafafa;
    overflow:auto; 
    margin-right:-15px;
    padding-right:15px;
  }
  .proall{
    overflow: auto;
    margin-right:-15px;
    padding-right:15px;
    flex-grow: 1;
  }
  .pro_img{
    position: absolute;
    top:0;
    left:0.625rem;
  }
  .pro_img>img{
    width:4.6875rem;
    height:4.6875rem;
  }
  .kind dt{
    font-size: 12px;
    height: 2.25rem;
    line-height: 2.25rem;
  }
  .kind dd{
    position: relative;
    padding:0 10px 22px 93px;
    margin-left: 0;
  }
  .prodetails .details,.prodetails .title{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .prodetails .title{
    font-size: 16px;
    font-weight: bold;
    color:#333;
    line-height: 22.5px;
    margin-bottom:2px;
  }
  .prodetails .details,.prodetails .other,.proprice .oprice{
    font-size: 12px;
    color:#666;
    line-height: 15px;
    margin-bottom:3px;
  }
  .prodetails .other>span{
    margin-right:10px;
  }
  .proprice>.nowprice{
    height: 21.5px;
    line-height: 21.5px;
    display: inline-block;
    color: #fb4e44;
    font-size: 18px;
    font-family: "PingFangSC-Medium", "Hiragino Sans GB", Arial, Helvetica, "\5B8B\4F53", sans-serif;
    vertical-align: middle;
  }
  .proprice>.nowprice>.npicon{
    margin-right:-5px;
  }
  .proprice .oprice{
    margin-left: 5px;
    text-decoration: line-through;
  }
  .procount button{
    width:25px;
    height:25px;
    border-radius: 50%;
    outline: none;
    border: 0;
    text-indent: -9999px;
  }
  .procount button.addbtn{
    background: url(../../../public/icon/add.png);
    background-size: 100%;
  }
  .procount button.subbtn{
    background: url(../../../public/icon/sub.png);
    background-size: 100%;
  }
  .procount>span{
    padding:0 10px;
  }
  .procount{
    position: absolute;
    right:10px;
    top:55px;
  }
  .discount>span{
    display: inline-block;
    font-size:12px;
    max-width:80%;
    border:1px solid #fb4e44;
    color:#fb4e44;
    transform: scale(0.98);
    white-space: nowrap;
    overflow: hidden;
  }
  /* 分类列表的滚动隐藏 */
  .plmask{
    overflow: hidden;
    flex-shrink: 0;
  }
</style>