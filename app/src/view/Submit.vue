<template>
  <div>
    <!-- 页面头部  标题 -->
    <div class="bk">
      <div class="order">
        <div style="width:100%;height:100%">
          <div style="background-color: rgb(255, 255, 255);width: 100%;z-index: 1000; position: fixed;">
            <div class="order_list order_tm">   
              <i class="shop_header list_shop">
                <a href="javascript:history.go(-1);">
                <img src="../../public/img/arrow.png" style="padding:18px 0 0 10px;" >
                </a>
              </i>          
              <div>
                <div class="shop_detail" style="padding: 18px 0 0 10px;">
                  <div class="order_n">提交订单</div>
                </div>
              </div>
            </div>
          </div>
          <!-- 选择收货地址 -->
          <div class="order_bottom">
            <div class="address1">
              <router-link to="/address" >
                <div class="bg" v-if="chooseAdr<0">
                  <div class="list_add">
                    <div class="select">选择收货地址</div>
                  </div>
                </div>
                <div class="bg" v-else>
                  <div class="list_add_1">
                    <div class="one_1">{{address.roadname[chooseAdr]+address.streets[chooseAdr]}}</div>
                    <div class="xin_xi">
                      <span>{{address.name[chooseAdr]}}</span>
                      <span>&nbsp;先生&nbsp;&nbsp;&nbsp;{{address.phone[chooseAdr]}}</span>
                    </div>
                  </div>
                </div>
              </router-link>       
              <div class="order_time">
                <span class="list_time"></span>
                <span class="song">
                  <span class="shape">立即送出</span>
                </span>
              </div>
            </div>
            <!-- 商店信息栏 -->
            <div class="address1">
              <div class="shop">
                <div class="shop_list">
                  <span class="imgs"></span>
                  <span class="shop_name">{{lists.sname}}</span>
                </div>
                <!-- 商品信息栏 -->
                <div class="shop_message">
                  <div class="merchant_message" v-for="(item,index) of lists.proName" :key="index">
                    <img :src="serverUrl+lists.proImg[index]" style="width:55px;height:55px;" class="picture">
                    <div class="message_zi">
                      <div class="message_1" > 
                        <span class="dx">{{item}}</span>
                        <span class="dx1">¥{{lists.proPrice[index]}}</span>
                      </div>
                      <!--商品规格 -->
                      <div class="model_1"><span>标准</span></div>
                      <div class="nums">x {{lists.proCount[index]}}</div>
                    </div>
                  </div>
                </div>
                <!-- 配送费-->
                <div class="p_song">
                  <div class="list_p">
                    <div class="pei_song">
                      <span class="p_song_fei">配送费</span>
                      <span class="p_song_fei">￥{{lists.sendCost}}</span>
                    </div>
                  </div>
                </div>
                <!-- 价格栏 -->
                <div class="price">
                  <div class="price_g">
                    <span class="gong_ji">共计￥{{lists.alPrice}}&nbsp;&nbsp;&nbsp;</span>
                    <span class="xiao_ji">小计<span class="jia_ge">￥{{lists.alPrice+lists.sendCost-this.messages}}</span></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="address1">
              <div></div>
            </div>
            <!-- 支付方式 -->
            <div class="address1">
              <div>
                <div class="payment">
                  <span>支付方式</span>
                  <span class="zai_xian"><span>在线支付</span></span>
                </div>
              </div>
              <!-- 餐具数量 -->
              <div class="b_bottom"  type="primary" @click="showPopup">
                <div class="food_num">
                  <span>餐具数量</span>
                  <span class="select_c">
                    <span :class="liang" class="not_select">未选择</span>
                    <span>{{message}}</span>
                  </span>
                  <span :class="liang" class="neng_liang shu_ye">选“无需餐具”，能量+10</span>
                </div>
              </div>
              <!-- 商家备注  提示框-->
              <van-popup  v-model="show" position="bottom" :style="{ height: '38%' }">
                <div class="select_can_ju">
                  <span class="can_ju">选“无需餐具”：在“我的”内收取环保能量</span>
                </div>
                <div @click="rowClick1($event)">
                  <div class="txt_num01">
                    无需餐具（能量+10）
                  </div>
                  <div class="txt_num01 txt_num02">1份</div>
                  <div class="txt_num01">2份</div>
                  <div class="txt_num01">3份</div>
                  <div class="txt_num01">4份</div>
                  <div class="txt_num01">5份</div>
                  <div class="txt_num01">6份</div>
                  <div class="txt_num01">7份</div>
                  <div class="txt_num01">8份</div>
                  <div class="txt_num01">9份</div>
                  <div class="txt_num01">10份</div>
                  <div class="txt_num01">10份以上</div>
                </div>
              </van-popup>
              <!-- 红包 -->            
              <div class="b_bottom"  type="primary" @click="showPopups">
                <div class="food_num">
                  <span>红包</span>
                  <span class="select_c">
                    <span :class="wei" class="not_select">未选择</span>
                    <span v-show="messages">{{'- ¥'+messages}}</span>
                  </span>
                </div>
              </div>
              <!-- 红包列表-->
              <van-popup  v-model="shows" position="bottom" :style="{ height: '38%' }">
                <div class="hong_b">
                  <span class="hong_d" @click="hongBao">不使用红包</span>
                </div>
                <div  v-for="(itemred,index) of redbao1" :key="index" :item="itemred">
                  <div @click="rowClick2(itemred.redmoney)">
                    <div class="member">
                    <div class="amount">
                      <span class="amount1">{{itemred.redname}}</span>
                      <span class="amount2">￥{{itemred.redmoney}}</span>
                    </div>
                    <div class="timea">
                      <span class="timec">有效期至{{youdatea1}}</span>
                      <span class="time2">无门槛</span>
                    </div>
                    <hr class="hr0" />
                  </div> 
                </div>
                </div>
              </van-popup>
              <!-- 备注框 -->
              <div class="bei_zhu" type="primary" @click="show1Popup">
                <div class="bei_zhu_1">
                  <span class="remark">备注</span>
                  <span :class="kouwei" class="live">口味、偏好等要求</span>
                  <span class="yincang">{{pianhao}}</span>
                </div>
              </div>
               <van-popup  v-model="show1" position="bottom" :style="{ height: '38%' }">
                 <div>
                   <div class="wen_ben">
                     <span class="call_off" @click="guanbi">取消</span>
                     <span class="succeed" :class="wancheng" @click="cheng1">完成</span>
                   </div>
                    <section class="kou_wei_1">
                      <textarea  placeholder="口味、偏好等要求" maxlength="50" class="pian_hao" v-model="txtlength" @input="chang1">
                    </textarea>
                     <p class="txt_number">{{n}}/50</p>
                   </section>
                 </div>
               </van-popup>
              <div>
                <van-cell-group style="padding: 12px 15px 12px 0;" class="invoice"  >
                  <van-switch-cell v-model="checked" title="发票" style="color:#000000" active-color="#ffd300" @change="xianShi()" />
              </van-cell-group>
              </div>  
              <div class="bottom_biao" :style="show2">
                <div class="bottom_biao_list bei_zhu">
                  <input type="text" style="border:none;" class="bottom_list" placeholder="请填写个人或公司名称">
                </div>
                <div class="bottom_biao_list  bei_zhu">
                  <input type="text" style="border:none;" class="bottom_list" placeholder="请填写纳税人识别号(选填)">
                </div>
              </div>
              <div class="rule">
                <span class="tan_hao"></span>
                <span class="no_rule">不清楚优惠规则?</span>
              </div>
            </div>
            <!-- 页面底部 合计 提交按钮 -->
            <div class="base">
              <div>
                <div style="position: relative;">
                  <div class="base_btn_1">
                    <div class="base_he_ji">
                      <span class="add_up_to">合计<i>¥{{needCost}}</i></span>
                    </div>
                    <van-button @click="tijiao" type="primary" color="#f8c74e">
                      <span class="base_btn">提交订单</span>
                    </van-button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 收货地址信息
      address:this.$store.getters.getReviseadr,
      // 当前选中的地址
      chooseAdr:this.$store.getters.getChooseAdr,
      show: false,show1:false,
      checked:false,show2:"display:none",
      txtlength:"",wancheng:{succeed_1:true},
      liang:{not_select_1:false},message:"",
      kouwei:{live_1:false},pianhao:"",n:"",
      lists:this.$store.getters.getCommitMsg,
      shows:false,redbao1:[],youdatea1:"",messages:"",wei:{not_selects:false},redmoney:""
      //huo:{list_add_s:false}, dzhi:{list_add_d:true}
    }   
  },
  created(){
        this.loadmorered();
  },
  computed:{
    needCost(){
      var needCost=this.lists.alPrice+this.lists.sendCost-this.messages;
      this.$store.commit('createNeedCost',needCost);
      return needCost;
    }
  },
  methods: {
    chang1(){
      this.n=this.txtlength.length;
      if(this.txtlength!==""){
        this.wancheng.succeed_1=false;
      }else{
        this.wancheng.succeed_1=true;
      }
    },
    tijiao(){
      var url = "orders/new";
      var now=new Date();
      var order_time =now.getFullYear()+'-'+(now.getMonth()+1)+'-'+(now.getDate()+1);
      var sid = this.lists.sid;
      var pname = JSON.stringify(this.lists.proName);
      var num = JSON.stringify(this.lists.proCount);
      var total = this.needCost;
      var mark=Math.floor(Math.random()*1000000000);
      var uid=localStorage.getItem('uid');
      var obj={order_time,sid,pname,num,total,uid,mark}
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==1){
          this.$store.commit('createMark',mark);
          this.$router.push('conpay');
        }else{
          this.$toast('订单生成失败');
        }
      })
    },
    cheng1(){
      this.show1 = false;  
      this.kouwei.live_1 = true
       this.pianhao=this.txtlength;
    },
    hongBao(){
      this.shows = false;
      this.messages = 0;
    },
    showPopup() {
      this.show = true;
    },
    show1Popup(){
      this.show1 = true;
    },
    showPopups(){
      this.shows = true;
    },
    guanbi(){
      this.show1 = false;
    },
    xianShi(){
      if(this.checked == true){
        this.show2="display:block";
      }else{
        this.show2="display:none";
      }
    },
    rowClick1(e){
      // console.log(e.target.innerHTML);
      this.show = false;
      this.liang.not_select_1=true;
      this.message=e.target.innerHTML;
    },
    rowClick2(m){
      this.shows = false;
      this.wei.not_selects = true;
      this.messages=m
    },
    loadmorered(){
             var url="red_envelopes";
             var uid=localStorage.getItem('uid');
                //请求数据
                // console.log(uid)
                var obj={uid:uid};
                this.axios.get(url,{params:obj}).then(res=>{
                //3.将数据保存在data中
                var rows=res.data.data;
                this.redbao1=rows;
                this.youxioaqi();
               })
        },
         youxioaqi(){
            for(var key in this.redbao1){
                //console.log(this.redbao[key].ter_mof_validity)
                var mymoney= this.redbao1[key].redmoney;
                // console.log(mymoney)
                var youa=this.redbao1[key].ter_mof_validity;
                var arr=youa.split("T");
                this.youdatea1=arr[0];
                //console.log(this.youdatea)
            }
        }
  }
};
</script>
<style scoped>
/* 内容下外边距 */
.order {
  padding-bottom:50px;
  overflow: auto;
  box-sizing: border-box;
}
/* 宽度 背景颜色 */
.bk {
    width: 100vw;
    position: relative;
    background: #f4f4f4;
    }
    /* 头部 宽高 */
.order_list .shop_header {
    width: 2.5rem;
    height: 3.125rem;
}
p, div, ul, ol, li, i {
    margin: 0;
    padding: 0;
}
.order_tm .shop_detail .order_n {
    max-width: 140px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
/* 顶部提交字体位置 */
.order_tm .shop_detail {
    max-width: 160px;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    margin-left: 0px !important;
}
/* 商家图标 商店名称 */
.order_list {
    display: flex;
    flex-direction: row;
    position: relative;
    z-index: 1000;
    left: 0;
    top: 0;
    position: fixed;
}
.order_tm {
    position: relative;/*相对定位*/
}
/* 宽度100% 外边距 */
.order_bottom{
  width:100%;
  padding-top: 3.125rem;
}
/* 地址、时间栏 内外边距 背景颜色 字体大小 */
.address1{
  margin: 10px;
  padding-left: 10px;
  padding-right:10px;
  background-color: #fff;
  overflow: hidden;
  font-size: .875rem;
}
/* 外边距 */
.bg{
  box-sizing: border-box;
  padding: 15px 15px 13px 0;
  position: relative;/*相对定位*/
}
/* 选择地址右侧箭头 */
.bg::after,.order_time::after,.food_num::after,.bei_zhu_1::after{
  top: 50%;
  right: 0px;
  margin-top: -5px;
  content: '';
  display: inline-block;
  height: 11px;
  width: 6px;
  background-image: url("../../public/img/arrow01.png");/*图片地址*/
  background-repeat: no-repeat;
  background-size: 6px 11px;
  position: absolute;/*绝对定位*/
}
/* 右外边距 左内边距 */
.list_add,.list_add_1{
  padding-right: 15px;
  margin-left: 30px;
}
.list_add_s{
  display:none;
}
.list_add_d{
  display: none;
}
.list_add_1{
  height: 44px;
}
.list_add_1::after{
  content: '';
  display: inline-block;
  height: 20px;
  width: 20px;
  background-image: url(https://s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:9096d347/9a0efeee4a3265ee9e151e5d03eadf5e.png);
  background-repeat: no-repeat;
  background-size: 20px 20px;
  position: absolute;
  left: 2px;
  top: 50%;
  margin-top: -8px;
}
.xin_xi{
  line-height: 20px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  height: 28px;
  line-height: 28px;
  color: #777777;
}
.one_1{
  font-weight: bold;
  font-size: .9375rem;
  color: #333333;
  margin-bottom: 3px;
  height: 21px;
  line-height: 21px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
/*选择地址左侧加号*/
.list_add::after{
  content: '';
  display: inline-block;
  height: 20px;
  width: 20px;
  background-image: url("../../public/img/add.png");/*加号图片地址*/
  background-repeat: no-repeat;
  position: absolute;
  left: 2px;
  top: 50%;
  margin-top: -8px;
}
/* 地址框内字体 颜色 大小 */
.list_add .select{
  font-size: 16px;
  color: #FFB000;
  text-align:left;
  font-weight: bold;/*字体加粗*/
}
/* 时间 外边距 */
.order_time{
  padding: 12px 0;
  position: relative;/*相对定位*/
  text-align: left;
}
/* 中间线的样式 */
.order_time::before,.food_num::before,.bei_zhu::before,.invoice::before{
  content: '';
    position: absolute;/*绝对定位*/
    top: -50%;
    bottom: -50%;
    left: -50%;
    right: -50%;
    transform: scale(0.5);
    border-top-style: solid;
    border-width: 1px;
    border-color: #d7d7d7;
    border-radius: 0;
}
/* 左侧时间图标 */
.list_time{
  display: inline-block;
    height: 20px;
    width: 20px;
    background-image: url("../../public/img/time.png");/*表图标地址*/
    margin-left: 2px;
    vertical-align: middle;
}
/* 送达时间 字体颜色 位置 */
.song{
    padding-right: 24px;
    box-sizing: border-box;
    display: inline-block;
    margin-left: 10px;
    font-size: 14px;
    color: #348BED;
    height: 21px;
    line-height: 21px;
    vertical-align: middle;
    max-width: 90%;
}
/* 字体 大小 颜色 */
.shape{
  font-size: 15px;
    color: #333333;
    font-weight: bold;
    margin-right: 5px;
}
/* 上外边距 */
.shop{
  position: relative;
  padding-top: 50px;
}
.hong_b{
  display: block;
  position: relative;
  margin: 0 auto;
  width:80%;
  padding-top: 20px;
}
/* 商店名称字体颜色 外边距 */
.shop_list {
    padding: 0 15px;
    color: #999999;
    height: 50px;
    background-color: #fff;
    position: absolute;
    left: -15px;
    top: 0;
    padding-left: 33px;
    box-sizing: border-box;
    overflow: hidden; /*超出隐藏*/
    white-space: nowrap;/*文字不换行*/
    text-overflow:ellipsis;/*隐藏的部分用...表示*/
    width:100%;
}
/* 店铺头像  样式 */
.imgs{
  display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    border-radius: 50%;
    background-image: url("https://p0.meituan.net/xianfu/7221d2332b2ffe6293c3e2a6d8d7c80614873.jpg");/*商店图标地址*/
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    position: absolute;
    left: 15px;
    top: 15px;
}
/* 店铺名称 */
.shop_name{
  margin-left: 12px;
  height: 100%;
  line-height: 3.125rem;
  margin-top: 1px;
  font-size: .875rem;
  color: #666;
  max-width: 70%;
}
/* 商品图片 */
.picture{
  object-fit: cover;
}
/* 订单栏 商品信息 背景宽高 */
.merchant_message{
  padding: 10px;
  box-sizing: border-box;
  height: 75px;
  width: 100%;
  background-color: #F8F8F8;
  display: flex;
  margin-bottom: 5px;
}
.shop_message{
  padding:0;
  margin-left:-10px;
  margin-right:-10px;
  overflow: hidden;
}
.message_zi{
  padding-left:10px;
  position: relative;
  flex-grow: 1;
}
 .message_1{
  margin:0;
  display: flex;
  height: 20px;
  line-height: 20px;
  justify-content: space-between;
}
/* 字体大小 颜色 */
.dx,.dx1{
  font-size: .875rem;
  color: #333;
}
.model_1,.nums{
  font-size:.75rem;
  line-height:1.0625rem;
  color: #999;
  text-align: left;
}
.p_song{
  padding-right: 0;
  position: relative;
  padding-top: 4px ;
  padding-bottom: 4px;
}
.p_song_fei{
  width: 50%;
  display: block;
  display: flex;
}
.p_song_fei:last-child{
   justify-content: flex-end;
}
.list_p{
  height: 100%;
  width: 100%;
  position: relative;
}
/* 圆颜色 位置 */
.list_p::before{
  content: '';
  position: absolute;
  top: -6px;
  left: -16px;
  height: 12px;
  width: 12px;
  background-color: #f4f4f4;
  border-radius: 50%;
  top: initial;
  bottom: -9px;
}
/* 下内边距 */
.pei_song:nth-of-type(1){
  margin-bottom: 15px;
}
.pei_song{
  display: flex;
  height: 20px;
  line-height: 20px;
  margin: 8px 0;
}
.p_song::after{
  content: "";
  position: absolute;
  top: -50%;
  bottom: -50%;
  left: -50%;
  right: -50%;
  -webkit-transform: scale(0.5);
  transform: scale(0.5);
  border: 5px dashed #d7d7d7;
  border-radius: 0;
  border-top: 0;
  border-left: 0;
  border-right: 0;
}
.price{
  position: relative;
  padding-right: 0;
}
.price_g{
  line-height: 20px;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  padding-top:.75rem;
  padding-bottom: .75rem;
}
.gong_ji{
  display: block;
  -webkit-flex: 1;
  -ms-flex: 1;
  flex: 1;
  text-align: right;
  font-size: 12px;
  color: #999;
  padding-right: 15px;
}
.xiao_ji{
  font-size: .9375rem;
  font-weight: bold;
  color: #333;
}
.yincang{
  float: right;
  margin-right: 18px;
}
/* 字体颜色 */
.jia_ge{
  color: #FB4E44;
}
.not_selects{
  display: none;
}
.hong_d{
  text-align: center;
    padding: 8px;
    font-size: 20px;
    background-color: #d1881d73;
    border-radius: 10px;
}
/* 圆颜色 位置 */
.price::after {
  content: '';
  position: absolute;
  top: -6px;
  left: -16px;
  height: 12px;
  width: 12px;
  background-color: #f4f4f4;
  border-radius: 50%;
  left: initial;
  right: -1rem;
}
/* 外边距 定位 */
.payment{
  padding: 12px 15px 12px 0;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  position: relative;
  padding-right: 18px;
  line-height: 20px;
}
/* 右对齐 */
.zai_xian{
  display: block;
  text-align: right;
  flex-grow: 1;
}
.food_num{
  padding-right: 10px;
  position: relative;
  padding: 12px 15px 12px 0;
  padding-right: 0;
  line-height: 26px;
  text-align: start;
}

/* 字体颜色 */
.not_select{
  color: #999;
}
.not_select_1{
  display: none;
}
/* 右浮 右内边距 */
.select_c{
  margin-right: 1.125rem;
  float: right;
  text-align: right;
}
/* 字体颜色 大小背景颜色内外边距 */
.neng_liang{
  background: #F4FFFC;
  font-size: .6875rem;
  color: #34D195;
  line-height: 26px;
  float: right;
  margin-right: 7px;
  border-radius: 3.125rem;
  padding: 0 5px;
}
/* 图片路径 大小 */
.shu_ye::before,.can_ju::before{
  content: '';
  display: inline-block;
  width: 15px;
  height: 15px;
  background: url("https://s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:9096d347/2869ce44ece286ab9ef9bbc883fda792.png");/*树叶图片路径*/
  background-size: contain;
  margin-left: 2px;
  margin-right: 4px;
  vertical-align: middle;
}
/* 相对定位 外边距 */
.bei_zhu{
  position: relative;
  padding: 12px 15px 12px 0;
  padding-right: 0;
  line-height: 26px;
}
.remark{
  flex: initial;
  margin-right: 1.875rem;
}
.bei_zhu_1{
  display:contents;
}
/* 字体颜色 右外边距 */
.live{
  float: right;
  padding-right: 1.125rem;
  display: inline-block;
  color: #999;
}
.bottom_list{
  height: 20px;
  padding: 1px;
  width:100%;
  position: relative;
  box-sizing: border-box;
}
/* 隐藏 */
/* .bottom_biao{
  display: none;
} */
/* 上下外边距 */
.bottom_biao_list{
  padding-top:.75rem;
  padding-bottom: .75rem;
}
/* 底部背景颜色 外边距 */
.rule{
  position: relative;/*相对定位*/
  background-color: #f4f4f4;
  padding-left: 5px;
  text-align: right;
  left: -10px;
  width: 100%;
  color: #999;
  line-height: 20px;
  padding: 12px 20px 12px 0;
}
/* 图片路径 大小 */
.tan_hao{
  display: inline-block;
    margin-right: 5px;
    height: 15px;
    width: 15px;
    background-image: url("../../public/img/tan1.png");/*叹号！图标路径*/
    background-size: 100% 100%;
    margin-top: -1px;
    vertical-align: middle;
}
/* 字体大小 颜色 */
.no_rule{
  font-size: .75rem;
  color: #666666;
}
/* 提交按钮大小 颜色 字体颜色 */
.base_btn{
  font-size: 16px;
  font-weight: bold;
  color: #333;
}
/* 背景颜色 */
.base_he_ji{
  position: relative;/*相对定位*/
  background-color: #fff;
  flex: 1;
}
/* 底部宽度 叠加值 */
.base_btn_1{
  position: relative;
  display: flex;
  bottom: 0px;
  width: 100%;
  position: fixed;/*固定定位*/
  z-index: 1000;
}
/* 位置 高度字体大小颜色 */
.add_up_to{
  position: absolute;
  right: 15px;
  line-height: 50px;
  font-size: 1rem;
  color: #333;
}
/* 底部价格 字体颜色 加粗 */
.add_up_to i{
  color: #FB4E44;
  font-style: normal;
  font-weight: bold;
}
.select_can_ju{
  text-align: center;
}
.can_ju{
  font-size: .75rem;
  color:#4DC6A5;
  border-radius: 50px;
  line-height: 24px;
  display: inline-block;
  background: #F5FFFB;
}
/* .txt_num{
  font-size: .875rem;
  color:#333;
  line-height: 3.0625rem;
  text-align: center;
} */
.txt_num01{
  font-size: .875rem;
  color:#333;
  line-height: 3.0625rem;
  text-align: center;
}
/* 文本框 */
.wen_ben{
  height: 3.125rem;
  display: flex;
  justify-content: space-between;
  position: relative;
}
/* 中间线 */
.wen_ben::after{
  content: "";
  position: absolute;
  top: 100%;
  left: -50%;
  right: -50%;
  -webkit-transform: scale(0.5);
  transform: scale(0.5);
  border: 1px solid #e4e4e4;
  border-radius: 0;
  border-bottom: 0;
  border-left: 0;
  border-right: 0;
}
.call_off,.succeed{
  line-height: 50px;
  display: inline-block;
  font-size: 16px;
  color: #333;
  padding-left: 15px;
  padding-right: 15px;
}
.succeed_1{
  color:#ccc;
}
.kou_wei_1{
  padding: .9375rem;
  padding-bottom: 1.875rem;
}
.live_1{
  display: none;
}
.pian_hao{
  box-sizing: border-box;
  height: 87.5px;
  resize: none;
  border-width: 0;
  width: 100%;
  font-size: 1rem;
}
.txt_number{
  margin-top: 4.5px;
  margin-bottom: 10px;
  font-size: .875rem;
  color: #999;
  text-align: right;
  width: 100%;
}
/* 红包 */
.member{
    width: 80%;
    height:5.375rem;
    background-color: #d1881d73;
    margin: 0 auto;
    margin-top: 1rem;
    margin-bottom: 0.5rem;
    border-radius: 10px;
}
/*红包金额*/
.amount{
    color:red;
    font-size: 1.25rem;
    display: flex;
    justify-content: space-between;
    padding-left:.625rem;
    padding-right:.625rem;
    padding-top:.625rem;
}
/*时间*/
.timea{
    color:#000;
    font-size: .875rem;
    margin:0;
    flex-wrap:nowrap ;
    display: flex;
    justify-content: space-between;
    padding:.625rem;
}
/* hr分割线 */
.hr0{ height:1px;border:none;border-top:1px dashed #f4f4f4;} 
.use{
    padding: .625rem;
    color:#000;
    font-size: .875rem;
    text-align: justify;
    text-justify: newspaper;
    word-break: break-all;
}
</style>