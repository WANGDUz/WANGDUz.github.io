<template>
  <div style="background: rgb(240, 240, 240);">
    <div>
      <div class="cond_top">
        <div class="cond_top_qx">
          <span class="top_qx">
            <span class="qx_zi">订单已取消</span>
          </span>
          <div class="chao_shi">支付超时，订单已取消</div>
        </div>
        <div class="cond_top_again">
          <div class="kong_1"></div>
          <div class="bie_jia primary">逛逛别家</div>
          <div class="kong_1"></div>
          <div class="bie_jia primary">再来一单</div>
          <div class="kong_1"></div>
        </div>
      </div>
      <div class="wen_ti top-questions-module">
        <div class="questions-title">
          <h3>常见问题</h3>
          <a href="javascript:;">在线客服<img src="../../public/img/arrow02.png" alt=""></a>
        </div>
        <div class="top_questions">
          <ul>
            <li><a href="javascript:;">无法支付</a></li>
            <li><a href="javascript:;">红包无法使用</a></li>
            <li><a href="javascript:;">新用户首单未减免</a></li>
            <li><a href="javascript:;">订单支持哪些支付方式</a></li>
            <li><a href="javascript:;">退款之后会员红包是否会退</a></li>
            <li><a href="javascript:;">外卖新用户是什么</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
.cond_top{
  padding: 20px 15px;
  padding-bottom: 0;
  background: #fff;
  font-size: .875rem;
  overflow: hidden;
}
.cond_top_qx{
  text-align: center;
  margin-bottom: 14px;
}
.cond_top_again{
  margin-bottom: 20px;
  display: flex;
}
.top_qx{
  display: inline-block;
  font-size: 1.1875rem;
  color: #333;
  margin-bottom: 5.5px;
}
.top_qx::after{
  content: '';
  display: inline-block;
  width: 9px;
  height: 9px;
  border-right: 1px solid #666;
  border-bottom: 1px solid #666;
  transform: rotate(-45deg);
  vertical-align: middle;
}
.qx_zi{
  vertical-align: middle;
}
.chao_shi{
  font-size: .875rem;
  color: #666;
  line-height: 21px;
}
.kong_1{
  -webkit-flex: 1;
}
.bie_jia{
  border: 1px solid #cccccc;
  color: #333333;
}
.primary{
  line-height: 35px;
  font-size: 14px;
  border-radius: 3px;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 90px;
  border: 1px solid #999;
}
.wen_ti{
  margin-top: 10px;
}
.questions-title{
    border: 0;
    background-repeat: repeat-x;
    background-size: 100% 1px;
    background-position: left bottom;
    position: relative;
    margin: 0 15px;
    padding: 10px 0;
    background-repeat: repeat-x;
    background-size: 100% 1px;
    background-position: left bottom;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0.5, transparent), color-stop(0.5, #e0e0e0));
}
.top_questions{
  padding: 16px 10px;
}
.top_questions>ul{
  margin: 0;
  padding: 0;
  list-style: none;
}
.top_questions>ul::before{
  display: table;
  content: " ";
}
.top_questions>ul>li{
  display: block;
  float: left;
  width: 33%;
  margin: 0;
  padding: 0;
  text-align: center;
}
.top_questions>ul>li>a{
  position: relative;
  border: 0;
  border-radius: 2px;
  font-size: .8125rem;
  display: block;
  margin: 5px;
  padding: 6px;
  color: #333;
  background-color: #fafafa;
  overflow: hidden;
  text-overflow: clip;
  white-space: nowrap;
}
.top-questions-module{
  background-color: #fff;
  border: 0;
  background-repeat: repeat-x;
  background-size: 100% 1px;
  background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.5, transparent), color-stop(0.5, #d7d7d7)), -webkit-gradient(linear, left top, left bottom, color-stop(0.5, transparent), color-stop(0.5, #d7d7d7));
  background-position: top, bottom;
}
.questions-title>h3{
  font-size: .9375rem;
  font-weight: 700;
  margin: 0;
  color: #333;
}
.questions-title>a{
  font-size: .8125rem;
  position: absolute;
  top: 50%;
  right: 0;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  color: #333;
}
.questions-title > a > img {
    width: 22px;
    height: 24px;
    vertical-align: middle;
    margin-right: -6px;
}
</style>