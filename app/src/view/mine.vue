<template>
<!-- 我的页面 -->
  <div class="container">
    <!-- 顶层 背景图 头像 姓名 -->
    <div style="background:rgb(240,240,240);height:100vh;">
      <div class="bg">
        <div class="icon_main" :style="'background-image: url(http://127.0.0.1:5050/'+ava+')'" @click="login">
        </div>
        <p v-if="uname">{{uname}}</p>
        <p v-else @click="login">未登录</p>
      </div>
      <div class="jump">
         <a @click="isLogin('/red_envelopes')">
          <div class="jumpto">
            <img src="../../public/img/m-red.png">
            <p>我的钱包</p>
          </div>
        </a>
        <a @click="isLogin('/address')">
          <div class="jumpto">
            <img src="../../public/img/m-add.png">
            <p>收货地址</p>
          </div>
        </a>
        <router-link to="/questions">
          <div class="jumpto">
            <img src="../../public/img/m-ques.png">
            <p>常见问题</p>
          </div>
        </router-link>
        <div class="jumpto" @click="logout">
          <a href="">
            <img src="../../public/img/m-off.png">
            <p>退出登录</p>
          </a>
        </div>
      </div>
      <div class="telp">
        <p>
          客服电话:10101
          <a href="tel:101010101"></a>
        </p>
      </div>
      <div class="worktime">
        <p>服务时间: 9:00-23:00</p>
      </div>
    </div>
    <bottomTabbar></bottomTabbar>  
  </div>
</template>

<script>
export default {
  data(){
    return{
      uid:'',
      ava:'fox.png',
      uname:''
    }
  },
  created(){
    this.changeUser();
  },
  computed:{
  },
  methods:{
    // 前往钱包页面，验证是否登录
    isLogin(url){
      var uid=localStorage.getItem('uid');
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
      }else{
        this.$router.push(url);
      }
    },
    changeUser(){
      if(localStorage.getItem('uid')){
        this.ava=localStorage.getItem('ava');
        this.uname=localStorage.getItem('uname');
        this.uid=localStorage.getItem('uid');
      }
    },
    login(){
      if(!this.uid){
        this.$router.push('/login');
      }
    },
    logout(){
      if(this.uid){
        this.$store.commit("changeUser",{uid:"",uname:"",ava:""})
        localStorage.clear();
        window.location.reload();
      }
    }
  }
}
</script>

<style scoped>
  *{margin: 0;padding: 0;outline:0;}
  .bg{
    width: 100%;
    padding: 10% 0 5%;
    background: url(../../public/img/main_bg.png);
    background-size: 100% 100%;
  }
  .bg p{
    width: 100%;
    text-align: center;
    font-size: 1rem;
    margin-top: .5rem;
    cursor: pointer;
    color: #333;
    max-width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .icon_main{
    width: 19.7333%;
    padding-top: 19.7333%;
    border-radius: 100%;
    border: .25rem solid #ffe699;
    background-size: 100% 100%;
    margin: auto;
  }
  .jump{
    background: white;
    
  }
  .jump .jumpto{
    width: 97%;
    margin-left: 3%;
    padding: .625rem 0;
    border-bottom: .0625rem solid #e3e3e3;
    cursor: pointer;
  }
  .jump .jumpto::after{
    display: inline-block;
    content: '>';
    float: right;
    margin-right: 1.375rem;
    font-size: 1.125rem;
    line-height: 1.125rem;
    color: #aaa;
    -webkit-transform: scaleY(1.5) translateY(-75%);
    transform: scaleY(1.5) translateY(-75%);
  }
  .jump .jumpto img{
    width: .9375rem;
    display: inline-block;
    margin: .1875rem .625rem 0 0;
    float: left;
  }
  .jump .jumpto p{
    font-size: .875rem;
    line-height: 1.25rem;
    color: #333;
  }
  .telp{
    font-size: .875rem;
    margin-top: 1.25rem;
    text-align: center;
    color: #ffb000;
    padding: .625rem 0;
    background: white;
  }
  .worktime{
    font-size: .75rem;
    text-align: center;
    color: #999;
    padding: .625rem 0;
    margin-bottom: 4.0625rem;
  }
  a{
    text-decoration: none;
  }
</style>