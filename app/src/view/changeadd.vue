<template>
<!-- 修改地址页面 -->
  <div class="app">
    <div class="container_newadd" >
      <div>
        <span style="name">联系人:</span>
        <input class="newname" type="text" :value="name[activeadr]">
      </div>
      <div class="gender">
        <div class="man" @mouseover="change1" @mouseout="change2">
          <input type="radio" id="man" name="sex" value="man">
          <i :class="{chang:i}"></i>
          <label for="man">先生</label>
        </div>
        <div class="woman" @mouseover="change1" @mouseout="change2">
          <input type="radio" id="woman" name="sex" value="woman">
          <i :class="{chang:!i}"></i>
          <label for="woman">女士</label>
        </div>
      </div>
      <div class="phone">
        <span>手机号:</span>
        <input class="newphone" type="tel" :value="phone[activeadr]">
      </div>
      <div class="address">
        <span>收货地址:</span>
        <input class="newaddress" :value="roadname[activeadr]">
      </div>
      <div>
        <span>门牌号:</span>
        <input type="text"  :value="streets[activeadr]"><div type="text"></div>
      </div>
    </div>
    <div class="preserve">保存</div>
    <div class="delete" @click="del()">删除</div>
    <a href="javascript:history.go(-1)" class="back">返回</a>
  </div>
</template>

<script>
export default {
  data() {
    return {
      i:true,
      uid:localStorage.getItem('uid'),
      aid:'',
    }
  },
  methods: {
    del(){
      var aid=this.$store.getters.getReviseadr.aid
      // this.$store.commit('initadr')
      this.axios.get("address/deladr",{params:(aid)}).then(res=>{
        if(res.data.code==1){
          this.$store.commit('changeadr',{phone,alname,roadname,streets,uid,aid})
          console.log(this.$store.getters.getReviseadr)
        }
      })
      // this.$store.dispatch('actDeladr',1,uid)
      // console.log(this.$store.getters.getReviseadr)
      // this.$router.push('/address')
    },
    change1(){
      this.i=!this.i    
    },
    change2(){
       this.i=this.i
     }
  },
  computed: {
    name(){return this.$store.getters.getReviseadr.name},
    roadname(){return this.$store.getters.getReviseadr.roadname},
    phone(){return this.$store.getters.getReviseadr.phone},
    streets(){return this.$store.getters.getReviseadr.streets},
    activeadr(){return this.$store.getters.getActiveadr},
  },
}
</script>

<style scoped>
  .container_newadd div{  /**div 通用样式 */
    margin-left: .9375rem;       /**左外边距 */
    height: 3.28125rem;     
    line-height: 3.1rem; /**基线 */
    border-bottom: .03125rem solid #e4e4e4;   /**横线 */
    font-size: 1rem;   /**字体大小 */
  }
  .container_newadd input{
    border: none;   /**取消样式 */
    font-size: 1rem;   /**字体 */
    color: #333;
    width: 70%;
    margin-left: 1rem;
    line-height: 0;
  }
  .name{
    position: absolute;
  }
  .gender{
    padding-left: 4.6875rem;
  }
  .man{display: inline-block;}
  .woman{
    display: inline-block;
    margin-left: 3.125rem;
  }
  .gender input{display: none;}
  .gender label{margin-left: .625rem;}
  .gender i{
    vertical-align: middle;
    display: inline-block;
    width: 1.0625rem;
    height: 1.0625rem;
    background: url(../../public/img/baiquan.png) no-repeat;
    background-size: 1.0625rem 1.0625rem;
  }
  /* .gender :hover i,.gender .chang{
    /* vertical-align: middle;
    display: inline-block;
    width: 1.0625rem;
    height: 1.0625rem; */
    /* background: url(../../public/img/huanse.png) no-repeat;
    background-size: 1.0625rem 1.0625rem;
  } */
  .gender .chang{
    background: url(../../public/img/huanse.png) no-repeat;
    background-size: 1.0625rem 1.0625rem;
  }
  
  /* .woman{margin-left: 3.125rem;} */
  .phone{position: relative;}
  /* .newphone{position: absolute;} */
  .address span{position: absolute;}
  .address{
    background: url(../../public/img/arrow02.png) no-repeat 100% 50%;
    background-size: 18px 18px;
    padding-right: 10px;
    background-origin: content-box;
  }
  .container_newadd .newaddress{
    background: url(../../public/img/ttt.png) no-repeat 0 50%;
    background-size: 14px 16px;
    padding-left: 16px;
    width: 70%;
    height: 100%;
    margin-left: 75px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .preserve{
    height: 2.5rem;
    line-height: 2.5rem;
    text-align: center;
    border-radius: .25rem;
    margin: 1.5625rem .9375rem .9375rem .9375rem;
    background-image: linear-gradient(135deg,#ffd266 0%,#ffbd27 100%);
  }
  .back{
    display: block;
    color:#333;
    text-align: center;
    height: 2.5rem;
    line-height: 2.5rem;
    margin: .9375rem .9375rem .9375rem .9375rem;
    border: .0625rem solid #ffb000;
    border-radius: .25rem;
  }
  .delete{
    display: block;
    color:#333;
    text-align: center;
    height: 2.5rem;
    line-height: 2.5rem;
    margin: .9375rem .9375rem .9375rem .9375rem;
    border: .0625rem solid #ffb000;
    border-radius: .25rem;
    background-color: #de3900ba;
  }
</style>