<template>
  <div class="con-pay">
    <!-- 顶层 支付订单 -->
    <div class="nav" style="display:block;">
      <div class="nav-left nav-arrow" @click="ok"></div>
      <div class="nav-title">支付订单</div>
    </div>
    <div class="add" style="display:block;">
      <div class="order-top">
        <div class="countdown remain-time-container" style="display:block;">
          支付剩余时间
          <div class="remain-time" v-if="!overtime">
            <span>{{minutes}}:{{seconds}}</span>
          </div>
          <span class="overtime" v-else>支付超时</span>
        </div>
        <div class="order-mid">
          <span class="mid-l">¥{{needCost}}</span>
          <span class="mid-r" v-for="(item,index) of item" :key="index">{{item.offset}}</span>
        </div>
        <div class="total"></div>
        <!-- <div class="order-title">汉堡</div> -->
      </div>
      <van-radio-group v-model="radio" class="pay-method">
        <div class="m-wrapper">
          <div class="cell-access">
            <div class="cell-icon">
              <img src="../../public/img/mtzhifu.png">
            </div>
            <div class="cell-left">
              <div class="mt-pay ellipsis">
                <div class="mt-pay-title">
                  钱包支付
                  <div class="right-labels">
                    <div class="cl-tags">
                      <span class="cl-bubble">推荐</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="pay-info ellipsis">
                <span class="amount-info"></span>
              </div>
            </div>
            <!-- <div class="checkbox checkbox-round"> -->
            <van-radio name="1" checked-color="#00a0af" icon-size="2rem"></van-radio>
              <!-- <input type="radio" name="pay-method">
              <i class="icon-success"></i> -->
            <!-- </div> -->
          </div>
          <div class="in-addon-card clearfix">
            <div class="cell-left in-switcher">
              <div class="ellipsis in-switcher-text">余额:￥{{ubalance}}</div>
              <!-- <div class="cl-tags">
                <span class="cl-normal-tag">返90元酒店卷</span>
              </div>
              <div class="cell-arrow"></div> -->
            </div>
          </div>
        </div>
        <div class="wx-pay">
          <div class="wx-access">
            <div class="cell-icon">
              <img src="../../public/img/wx-pay.png" alt="">
            </div>
            <div class="cell-left">
              <div class="wx-pay-title ellipsis">
                <div class="">微信支付</div>
              </div>
              <div class="wx-pay-info ellipsis">
                <span class="amount-info"></span>
              </div>
            </div>
            <van-radio name="2" checked-color="#2aaf90" icon-size="2rem"></van-radio>
            <!-- <div class="checkbox checkbox-round">
              <input type="radio" name="pay-method">
              <i class="icon-success"></i>
            </div> -->
          </div>
        </div>
        <div class="ali-pay" v-show="more_pay">
          <div class="ali-access">
            <div class="cell-icon">
              <img src="../../public/img/ali-pay.png" alt="">
            </div>
            <div class="cell-left">
              <div class="ali-pay-title ellipsis">
                <div class="">支付宝支付</div>
              </div>
              <div class="ali-pay-info ellipsis">
                <span class="amount-info"></span>
              </div>
            </div>
            <van-radio name="3" checked-color="#3f90e8" icon-size="2rem"></van-radio>
            <!-- <div class="checkbox checkbox-round">
              <input type="radio" name="pay-method">
              <i class="icon-success"></i>
            </div> -->
          </div>
        </div>
        <div class="show-more">
          <span class="cell-arrow"  @click="more" v-show="!more_pay">展示更多支付方式</span>
        </div>
      </van-radio-group>
    </div>
    <button class="btn btn-submit" @click="payment">
      <span class="need-pay">确认支付</span>
    </button>
    <div class="Timetip" v-show="Timetip">
      <div class="modal" style="display:block;">
        <div class="modal-mask"></div>
        <div class="modal-box">
          <div class="modal-title">
            <div>支付超时</div>
          </div>
          <div class="modal-text">
            <div>订单已取消,请重新下单</div>
          </div>
          <button class="btn btn-ok" @click="ok">知道了</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      needCost:this.$store.getters.getNeedCost,
      ubalance:localStorage.getItem('ubalance'),
      minutes:15,
      seconds:0,
      overtime:false,
      Timetip:false,
      more_pay:false,
      radio:'1',
      item:"",
    }
  },
  mounted () {
      this.add()
    },
  methods:{
    payment(){
      var url='pay';
      var uid=localStorage.getItem('uid');
      var ubalance=this.ubalance;
      var price=this.needCost;
      var mark=this.$store.getters.getOrdMark;
      if(ubalance<price){
        this.$toast("钱包余额不足");
        return;
      }else{
        this.axios.get(url,{params:{uid,price,mark}}).then(res=>{
          console.log(res.data);
          if(res.data.code==1){
            this.$toast("支付成功！");
            localStorage.setItem('ubalance',res.data.data);
            this.$store.commit('changeUser',{ubalance:res.data.data});
            this.$router.push('/');
          }else if(res.data.code==-1){
            this.$toast("钱包余额不足！");
          }else{
            this.$toast("支付失败！");
          }
        })
      }
    },
      more:function(){
        this.more_pay=!false
      },
      ok:function(){
        this.$router.go(-1)
      },
      num: function (n) {
        return n < 10 ? '0' + n : '' + n
      },
      add: function () {
        var _this = this
        var time = window.setInterval(function () {
          if (_this.seconds === 0 && _this.minutes !== 0) {
            _this.seconds = 59
            _this.minutes -= 1
          } else if (_this.minutes === 0 && _this.seconds === 0) {
            _this.seconds = 0            
            window.clearInterval(time);            
            _this.overtime=!false,
            _this.Timetip=!false           
          } else {
            _this.seconds -= 1;
            
          }  
          
        }, 1000)
        
      }
    },
    watch: {
      second: {
        handler (newVal) {
          this.num(newVal)
        }
      },
      minute: {
        handler (newVal) {
          this.num(newVal)
        }
      }
    },
    computed: {
      second: function () {
        return this.num(this.seconds)
      },
      minute: function () {
        return this.num(this.minutes)
      }
    }
}
</script>

<style scoped>
  *,::after,::before{box-sizing: inherit;}
  a,button,input,select{
    padding: 0;
    font: inherit;
    color: inherit;
  }
  .con-pay{
    /* position: absolute; */
    /* background-color: #f4f5f6; */
    margin: 0 auto;
    width: 7.5rem;
    height: 100%;
    color: #4a494b;
    font-size: .9375rem;
    line-height: 1.5;
    min-width: 100%;
    font-family: "PingFang SC","Helvetica Neue",Helvetica,Arial,sans-serif;
  }
 
  .nav{
    position: inherit;
    user-select: none;
    text-align: center;
    height: 2.4rem;
    z-index: 10;
    line-height: 2.4rem;
    box-shadow: 0 0 .0625rem rgba(0,0,0,0.3);
    background-color: #fafafa;
  }
  .nav-arrow{
    width:1rem;
    height: 2.4rem;
  }
  .nav-arrow::after{
    left: 50%;
    top: 30%;
    content: '';
    width: .75rem;
    height: .75rem;
    position: absolute;
    transform: rotate(225deg);
    border: #222 solid;
    border-width: .0625rem .0625rem 0 0;
  }
  .nav-left{
    left: 0;
  }
  .nav-left,.nav-right{
    top: 0;
    color: #222;
    position: absolute;
    padding: 0 .5rem;
    font-size: .875rem;
  }
  .nav-title{
    font-size: 1rem;
  }
  .add{
    background-color: #fff;
    height: 100%;
  }
  .order-top{
    padding: 2.82rem 0 2.72rem;
    text-align: center;
    background-color: #fff;
  }
  .countdown{
    display: none;
    vertical-align: center;
    color: #999;
    font-size: 1rem;
    line-height: 1;
  }
  .order-mid{
    margin-top: .04rem;
    line-height: 1;
    font-family: MTfin,"DINAlternate-Bold","PingFang SC","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 0.5rem;
    color: #333;
    letter-spacing: -0.0275rem;
  }
  .mid-l{
    font-size: 2.4rem;
    margin-right: 0.8rem;
  }
  .mid-r{
    font-size: 3rem;
  }
  .total{
    text-decoration: line-through;
    color: #333;
    font-size: .24rem;
  }
  .order-title{
    font-size: 0.8rem;
    color: #999;
    letter-spacing: -0.015rem;
  }
  .pay-method{
    padding-bottom: .3rem;
    background-color: transparent;
    padding: 0 1rem;
  }
  .m-wrapper{
    background: #fff;
    z-index: 0;
    overflow: hidden;
    /* position: relative; */
  }
  .cell-access{
    position: relative;
    z-index: 2;
    background: transparent;
    display: flex;
    padding: 1rem 0.3rem 0 0.3rem;
  }
  .cell-access::before{
    top: 0;
    content: '';
    position: absolute;
    left: 1.08rem;
    right: 0;
    height: 0;
    border-bottom: .0625rem solid #e5e5e5;
    transform: scaleY(0.5);
    transform-origin: 0 0;
  }
  .cell-icon{
    text-align: center;
    position: relative;
    width:2rem;
    height: 2rem;
    margin-right: .625rem;
    margin-top: .3125rem;
  }
  .cell-icon img{
    width: 2rem;
    height: 2rem;
    /* position: relative; */
  }
  .cell-left{
    flex: 1;
    margin: 0;
    padding: 0.18rem 0;
  }
  .mt-pay{
    padding: 0;
    max-width: 5rem;
    color: #333;
    font-size: .32rem;
  }
  .ellipsis{
    white-space: nowrap;
    text-overflow: ellipsis;
  }
  .mt-pay-title{
    font-size: 1.3rem;
    font-weight: bold;
    position: relative;
    top: 0.125rem;
    display: flex;
  }
  .cell-left .cl-tags{
    margin: 0 -13.6875rem 0 0;
  }
  .right-labels .cl-tags{
    position: absolute;
    bottom: 0.04rem;
    display: block;
    /* vertical-align: middle; */
    max-width: 3.32rem;
  }
  .cl-tags{
    height: 1rem;
    line-height: 0.32rem;
    min-height: 0.34rem;
    overflow: hidden;
    white-space: normal;
    font-size: 0;
    padding-top: 1.125rem;
  }
  .cl-bubble{
    color: #fff;
    border-color: #ff851c;
    background-color: #ff851c;
    border-top-left-radius: 0.16rem;
    border-top-right-radius: 0.2rem;
    border-bottom-right-radius: 0.2rem;
  }
  .cl-bubble{
    position: fixed;
    /* display: inline-block; */
    padding: 0.1rem 0.1rem;
    font-weight: 400;
    font-size: 1.2rem;
    line-height: 1;
    text-align: center;
    margin-left: .5rem;
    margin-top: -0.625rem;
    /* border-radius: 2px; */
    /* -webkit-transform-origin: left; */
    transform-origin: left;
    border: .0625rem solid currentColor;
    white-space: nowrap;
    width: 3.125rem;
  }
  .pay-info{
    /* margin-top: 0.1rem; */
    /* line-height: .75rem; */
    /* font-size: 0.2rem; */
    max-width: 2rem;
    /* font-weight: 300; */
    /* color: #ccc; */
  }
  .checkbox{
    display: flex;
    /* position: relative; */
    width: 1.4375rem;
    height: 1.4375rem;
  }
  .checkbox input{
    margin: 0;
    opacity: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    top:0;
    left: 0;
    position: absolute;
  }
  .checkbox .icon-success{
    width: 2rem;
    /* height: 0.44rem; */
    border-color: #ccc;
    border-radius: 50%;
    background-clip: padding-box;
    display: block;
    position: relative;
    font-weight: bold;
    text-align: center;
    font-size: 0.24rem;
    line-height: 0.4rem;
    border: none;
    background-image: linear-gradient(135deg,#ffd000 0%,#ffbd00 100%);
    color: #222200;
    background-color: #ffc700;
  }
  .icon-success::before{
    content: '';
    background-image: url(../../public/img/kongxuan.png);
    background-size: 0.44rem 0.44rem;
    width: 0.44rem;
    height: 0.44rem;
  }
  .in-addon-card{
    position: relative;
    z-index: 2;
    height: 2.5rem;
  }
  .clearfix::before{
    content: "";
    display: table;
  }
  .m-wrapper .in-switcher{
    float: left;
    padding: .3125rem 2.5rem;
    margin: 0;
  }
  .in-addon-card .cell-left{
    line-height: 0.36rem;
    color: #333;
    font-size: 1rem;
    position: relative;
    flex: 1;
    display: flex;
  }
  .m-wrapper .in-switcher-text{
    max-width: 100%;
    line-height: 1rem;
  }
  .cell-left .cl-tags{
    margin: 0 -13.6875rem 0 0;
  }
  .cl-tags{
    height: 1rem;
    line-height: 0.32rem;
    min-height: 0.34rem;
    overflow: hidden;
    white-space: normal;
    padding-top: 1.125rem;
  }
  .cl-normal-tag{
    color: #ff851c;
    position: relative;
    display: inline-block;
    padding: 0.04rem 0.06rem;
    font-weight: 400;
    font-size: 0.2rem;
    line-height: 1;
    text-align: center;
    margin-right: 0.08rem;
    margin-bottom: 0.04rem;
    border-radius: .125rem;
    transform-origin: left;
    border: .0625rem solid currentColor;
    white-space: nowrap;
  }
  .m-wrapper .in-switcher .cell-arrow{
    margin-left: .75rem;
    margin-top: -0.75rem;
    right: 0.8rem;
    top: 50%;
    line-height: 1.5;
    font-weight: 400;
    color: #8e8d8e;
    position: absolute;
    padding-right: 0.3rem;
    font-size: .75rem;
    height: 1.125rem;
  }
  .cell-arrow::after{
    margin-top: -0.25rem;
    border-color: #8e8d8e;
    right: 0;
    top: 50%;
    content: '';
    width: .5rem;
    height: .5rem;
    position: absolute;
    transform: rotate(45deg);
    border: #c6c6c7 solid;
    border-width: .0625rem .0625rem 0 0;
  }
  .clearfix::after{
    clear: both;
    content: "";
    display: table;
  }
  .wx-pay{
    background: #fff;
  }
  .con-pay .wx-access{
    border-width: .5rem;
  }
  .wx-access{
    min-height: 4rem;
    padding: 0 0.4rem;
    user-select: none;
    display: flex;
    position: relative;
    align-items: center;
    background-color: white;
  }
  .wx-access::before{
    top: 0;
    content: '';
    position: absolute;
    left: 1.08rem;
    right: 0;
    height: 0;
    border-bottom: .0625rem solid #e5e5e5;
    transform: scale(0.5);
    transform-origin: 0 0;
  }
  .wx-pay .cell-icon{
    margin-right: 0.8rem;
    width: 2rem;
    height: 2rem;
    text-align: center;
  }
  .cell-icon img{
    width: 2rem;
    height: 2rem;
  }
  .wx-pay-title{
    max-width: 5rem;
    color: #333;
    font-size: 1.2rem;
  }
  .wx-pay-info{
    font-size: 0.2rem;
    max-width: 5rem;
    font-weight: 300;
    color: #ccc;
  }
  .ali-pay{
    background: #fff;
  }
  .con-pay .ali-access{
    border-width: .5rem;
  }
  .ali-access{
    display: flex;
    min-height: 4rem;
    padding: 0 0.4rem;
    user-select: none;
    align-items: center;
  }
  .ali-pay .cell-icon{
    margin-right: 0.8rem;
    width: 2rem;
    height: 2rem;
    text-align:center;
  }
  .ali-pay-title{
    max-width: 6rem;
    color: #333;
    font-size: 1.2rem;
  }
  .ali-pau-info{
    font-size: 0.2rem;
    max-width: 5rem;
    font-weight: 300;
    color: #ccc;
  }
  .show-more{
    font-size: 0.3rem;
    color: #8e8d8e;
    height: 2.8rem;
    text-align: center;
    background-color: #fff;
    position: relative;
  }
  .show-more::after{
    top: 0;
    bottom: 0;
    content: '';
    position: absolute;
    left: 1.08rem;
    right: 0;
    height: 0;
    border-bottom: .0625rem solid #e5e5e5;
    transform: scaleY(0.5);
    transform-origin: 0 0;
  }
  .show-more span{
    position: absolute;
    left: 1.08rem;
    top: 0.26rem;
    font-size: 0.9rem;
    color: #999;
    padding-right: 1rem;
  }
  .cell-arrow::after {
    right: 0;
    top: 50%;
    content: '';
    width: .5rem;
    height: 0.5rem;
    position: absolute;
    transform: rotate(45deg);
    border: #c6c6c7 solid;
    border-width: .0625rem .0625rem 0 0;
    margin-top: -0.25rem;
  }
  .btn{
    width: 85%;
    background-image: linear-gradient(135deg,#ffd000 0%,#ffcd00 100%);
    font-weight: bold;
    border: none;
    color: #222;
    font-size: 1rem;
    line-height: 2rem;
    border-radius: 0.4rem;
    text-align: center;
    vertical-align: middle;
    padding: 0.3rem 0.4rem;
    background-clip: padding-box;
    background-color: #222;
  }
  .btn-submit{
    margin: 100px auto 0;
    display: block;
  }
  .modal,.modal-mask{
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  .modal{
    z-index: 100;
    position: fixed;
  }
  .modal-mask{
    position: absolute;
    background: rgba(0,0,0,0.75);
  }
  .modal-box{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 85%;
    max-width: 90%;
    overflow: hidden;
    border-radius: .375rem;
    background-color: #fff;
    transform: translate3d(-50%,-52%,0);
    box-shadow: 0 .1875rem .375rem rgba(0,0,0,0.2);
  }
  .modal-title{
    font-size: 1.0625rem;
    position: relative;
    text-align: center;
    margin: 1.3rem 0 1rem;
    color: #4a494b;
  }
  .modal-text{
    overflow-y: auto;
    max-height: 8rem;
    margin: 0 2rem 1.1rem;
    color: #666;
    text-align: center;
  }
  .btn-ok{
    width: 100%;
    border: none;
    border-radius: 0;
    background: transparent;
    color: #222;
    border-top: .0625rem solid #e8e8e8;
    margin-top: 0;
  }
</style>