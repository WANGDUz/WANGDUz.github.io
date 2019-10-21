<template>
  <div class="main">
    <!-- 图片-->
   <div>
      <img class="huhu" src="../../public/img/fox.png">
   </div>
   <div>
      <!--输入框-->
      <div class="phone">
        <input class="phone-input" v-model="phone" placeholder="请输入手机号">
      </div>
      <div class="upwd" >
        <input class="upwd-input" v-model="upwd" type="password" placeholder="请输入6-20位密码 必须包含数字和英文">
      </div>
      <!--登录按钮-->
      <van-button class="login-btn" size="large" @click="login">登录</van-button>
   </div>
  </div>
</template>
<script>
export default {
   data(){
     return {
      phone:"", 
      upwd:""  ,
      user:[] 
    }
    },
   methods:{
     login(){
       //完成用户登录操作
       var phone = this.phone;
       var upwd = this.upwd;
       // 创建正则表达式 
       var phonereg = /^1[3456789]\d{9}$/;
       var upwdreg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
       if(!phonereg.test(phone)){
          this.$toast("手机号码格式不正确");
          return;
       }
       // 密码提示
       if(!upwdreg.test(upwd)){
         this.$toast("密码格式不正确");
         return;
       }
       // 发送ajax axios
       var url = "login";
       var obj = {phone,upwd};
       this.axios.get(url,{params:obj}).then(res=>{
       //接收服务器返回数据
       var code = res.data.code;
       if(code==-1){
        // 失败 提示
        this.$dialog.confirm({
          title: '手机号不存在',
          message: `是否使用当前手机号码${this.phone}进行注册并登录?`
        }).then(() => {
          this.axios.get("login/reg",{params:obj}).then(res=>{
            if(res.data.code==1){
              this.login();
            }else{
              this.$notify({type:'danger',message:"注册失败"});
            }
          })
        }).catch(() => {
          this.$notify({type:'danger',message:"登录失败"});
        });
       }else if(code==1){
       //成功 跳转
      this.$notify({type:'success',message:"登录成功"});
      var data=res.data.data[0];
      this.$store.commit("changeUser",{uid:data.uid,uname:data.uname,ava:data.ava, ubalance:data.ubalance});
      localStorage.setItem('uid',data.uid);
      localStorage.setItem('ava',data.ava);
      localStorage.setItem('uname',data.uname);
      localStorage.setItem('ubalance',data.ubalance);
      this.$router.go("-1");
       }else{
         console.log(res);
         this.$notify({type:'danger',message:"登录失败"});
       }
       })
     }
   }
}
</script>
<style scoped>
  .huhu{
    display: block;
    width:4.5rem;
    height:4.5rem;
    margin:15vh auto 40px;
  }
  .main{
    padding:1.2em;
  }
  .phone,.upwd{
    border-bottom: 1px solid #e5e5e5;
    padding:.6rem 1rem;
    height: 1.4em;
  }
  .phone-input,.upwd-input{
    height: 100%;
    width: 100%;
    box-sizing: border-box;
    padding-top: 0;
    border: 0;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    font-size: 0.9em;
  }
  .login-btn{
    margin-top:30px;
    background:#ed7457;
    font-size: 1.2rem;
    border-radius: 8px;
  }
 </style>

