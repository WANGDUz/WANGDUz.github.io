<template>
    <div class="bei_one">
        <div class="background">
            <van-collapse v-model="activeName" accordion>
            <div class="issue">
                <div class="bottom_xian">
                    <a class="return" href="javascript:history.go(-1);">
                        <van-icon color="#686868" name="arrow-left" />
                    </a> 
                    <h3 class="title">常见问题</h3> 
                </div>                      
                <!-- 支付问题-->
                <van-collapse-item class="catalog-title-word" title="支付问题" name="1">
                    <div class="help-item">
                        <h5 class="wu">Q：为什么提示我“账户存在异常，无法下单”？</h5>
                        <div>
                            <h6 class="liu">包含（但不仅限于）以下行为者，系统将自动予以封禁（客服无权解封）：
                            <br>i）有过虚假交易（编造不存在真实买卖的订单）；
                            <br>>ii）有过恶意下单行为；</h6>
                        </div>
                    </div>
                    <div  class="help-item">
                        <h5 class="wu">Q：在线支付取消订单后钱怎么返还？</h5>
                        <div>
                            <h6 class="liu">订单取消后，款项会在一个工作日内，直接返还到您的美团账户余额。</h6>
                        </div>
                    </div>
                    <div  class="help-item">
                        <h5 class="wu">Q：怎么查看退款是否成功？</h5>
                        <div>
                            <h6 class="liu">退款会在一个工作日之内到美团账户余额，可在“账号管理——我的账号”中查看是否到账。</h6>
                        </div>
                    </div>
                    <div  class="help-item">
                        <h5 class="wu">Q：在线支付的过程中，订单显示未支付成功，款项却被扣了，怎么办？</h5>
                        <div>
                            <h6 class="liu">这个情况属于第三方交易平台付款延迟问题，我们会立即将扣款退回到您的美团账户余额。</h6>
                        </div>
                    </div>
                    <div  class="help-item">
                        <h5 class="wu">Q：怎么取消退款呢？</h5>
                        <div>
                            <h6 class="liu">请在订单页点击“不退款了”，商家还会正常送餐的。</h6>
                        </div>
                    </div>
                </van-collapse-item>
                <!-- 订单问题-->
                <van-collapse-item class="catalog-title-word" title="订单问题" name="2">
                    <div class="help-item">
                        <h5 class="wu">Q：我的订单为什么被取消了？？</h5>
                            <h6 class="liu">如果商家5分钟（部分品牌商家8分钟）未接您的订单，为了保障您的权益，系统将会为您自动取消订单；商家接单后可能由于无法联系到您、菜品售完等原因无法配送，因而取消了您的订单，具体原因可查看系统发送的短信或通知。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：如何取消订单？</h5>
                            <h6 class="liu">如果商家尚未接单，您可以在订单详情页通过“取消订单”功能进行取消;如果商家已接单，则需要您电话联系后由商家取消订单。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：如何进行催单？</h5>
                            <h6 class="liu">您可以在订单状态页面点击“电话催单”按钮向商家催单。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：刚下单发现信息填错了怎么办？</h5>
                            <h6 class="liu">如果商家尚未接单，您可以自主取消订单；如果商家已经接单，您可以电话联系商家后由对方取消订单。然后重新下一单。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：为什么提示下单次数过多，已无法下单？</h5>
                            <h6 class="liu">同一手机号在同一设备上一天最多可以成功提交7次订单（在线支付以完成支付为准，货到付款以提交订单为准）。</h6>
                    </div>
                </van-collapse-item>
                <!-- 优惠问题-->
                <van-collapse-item class="catalog-title-word" title="优惠问题" name="3">
                    <div class="help-item">
                        <h5 class="wu">Q：哪些商家有优惠？都有些什么优惠？</h5>
                            <h6 class="liu">有优惠的商家在商家列表页均含有优惠标识；具体的优惠可以查看活动详情或者商家详情页中的描述</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：我达到了满赠、满减的优惠的金额，为什么没有享受相关的优惠？</h5>
                            <h6 class="liu">满赠与满减优惠是以订单内菜品的总额及餐盒费来计算的，不包含配送费。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：在新用户享受的优惠中，新用户的条件是什么？</h5>
                            <h6 class="liu">新用户是指第一次在美团外卖下单的用户（同一设备、同一手机号、同一账户、同一支付账号仅可享受一次）。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：超时赔付是什么意思？</h5>
                            <h6 class="liu">超时赔付模式即：商家承诺一个送达时间和一个折扣,从用户下单时间开始计算,如果外卖超过了承诺时间才送到,该份外卖按照折扣价收取费用。由于恶劣天气、某些美食烹调时间过长、或者其他因素,商家会选择性的延长承诺时间或者不做承诺。预订单不参与超时赔付</h6>
                    </div>
                </van-collapse-item>
                <!-- 其他问题-->
                <van-collapse-item class="catalog-title-word" title="其他问题" name="4">
                    <div class="help-item">
                        <h5 class="wu">Q：如果对商家服务不满意如何进行投诉？</h5>
                            <h6 class="liu">您可以在该订单完成评价后点击订单详情页中的意见反馈向客服投诉，或者拨打美团外卖的客服电话（10109777）向客服进行投诉。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：如何联系客服解决问题？</h5>
                            <h6 class="liu">您可以拨打美团外卖的客服电话（10109777）或者在“我的”——>“意见反馈”页面提交反馈</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：我用的是手机客户端，为什么无法定位？</h5>
                            <h6 class="liu">请先检查手机的网络以及是否开启定位功能。若确认正常，请试着在户外或wifi环境下进行定位。</h6>
                    </div>
                    <div class="help-item">
                        <h5 class="wu">Q：如何修改自己的账户信息？</h5>
                            <h6 class="liu">美团外卖使用的是美团账号，您可以在“我的”页面修改个人账号信息，也可以在美团网账号页面修改个人账号</h6>
                    </div>
                </van-collapse-item>
            </div>
            </van-collapse>
        </div>
   </div>
</template>

<script>
export default {
   data() {
    return {
      activeName: '1'
    };
   }
   //调用用sql数据库中的值
//    ajax({
//     type:"GET",
//     url:"8080.php",
//     data:{},
//     timeout:3000,
//     success:function (msg) {
//         // console.log(msg.responseText);
//         //注意：如果要返回xml文件，则我们在前端用responseXML来接收数据  如果是json文件，则需要转换为js对象
//         console.log(msg.responseXML);
//         // console.log(document);
//         console.log(msg.responseXML.querySelector("qtitle"));
//         console.log(msg.responseXML.querySelector("answer").innerHTML);
//     },
//     error:function (xhr) {
//         console.log(xhr.status);
//     }
}
</script>
<style scoped>
.bei_one{
    height: 100vh;
    background-color: rgb(239, 239, 239);
}
    .background{
      position: relative;
      min-height: 100%;
      margin:0;
      padding:0;
    }
    .issue{
        background-color: #fff;
    }
    .title{
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        margin: 0 auto;
        text-align:center;
        margin-top:1.5625rem;
        line-height: 2.75rem;
        font-size: 1.0625rem;
        color: #333;
        margin:0;
        padding-right: 36px;
    }
    .return{
        margin-top:1rem;
        margin-left:.9375rem;
        float: left;
        /* display:block; */
    }
    .back{
        margin:1rem;
        position: absolute;
    }
    .bottom_xian{
        border-bottom: 1px solid #E4E4E4;
    }
    .catalog-title-word{
        line-height: .5rem;
        font-size: .875rem;
        color: #2f2f2f;
        border-bottom: 1px solid #E4E4E4;
    }
    /* .help-item{
      padding: 12px ;
      border-top: 1px solid #dddddd;
    } */
    .wu{
      font-size: 1rem;
      font-weight: normal;
      color: #333333;
    }
    .liu{
      font-size: 0.95rem;
      color: #ababab;
    }
</style>