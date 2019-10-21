<template>
    <div class="red_container">
        <!-- 头部 start-->
        <div class="redtop">
            <a href="javascript:history.go(-1);">
                <van-icon name="arrow-left" class="next"/>
            </a>
            <span class="redw">我的钱包</span>
        </div>
        <!-- 头部 end-->
        <!-- 红包兑换码 start -->
        <div class="redeem">
            <span class="">使用兑换码</span>
            <span href="" @click="tianjia" class="tianjiared">添加红包</span>
            <van-icon name="arrow" class="jian"/>
            <van-dialog
              v-model="show"
              title="请输入红包兑换码"
              show-cancel-button
              :beforeClose="beforeClose" @click="redchange"
              >
              <div class="redinput">
                  <van-field
                     v-model="redinput"
                     label="兑换码"
                     placeholder="请输入红包兑换码"/>
              </div>
          </van-dialog>

        </div>
        <div class="yue">
            <span>我的余额</span>
            <span>￥{{yue==null?0.00:yue}}</span>
        </div>
        <!-- 红包兑换码 end -->
        <!-- body start -->
        <div class="redbody">
            <div>
            <img src="../../public/lv/hongbao.png" alt="">
            </div>
            <div class="bodycen">
                暂无红包
            </div>
            <div class="bodystree">
                <span class="noeffective">没有更多有效红包了</span>
                <a href="" class="nored">查看失效红包</a>
            </div>
        </div>

        <div class="bobybottom" v-for="(itemred,index) of redbao" :key="index" :item="itemred">
            <table></table>
            <!-- 会员加量包 -->
            <div class="member">
                <!-- 红包名称  金额 -->
                <div class="amount">
                    <span class="amount1">{{itemred.redname}}</span>
                    <span class="amount2">￥{{itemred.redmoney}}</span>
                </div>
                <!-- 红包时间  有无门槛 -->
                <div class="timea">
                    <span class="timec">有效期至{{youdatea}}</span>
                    <span class="time2">无门槛</span>
                </div>
                <div class="use">限非到店自取订单使用。限登录手机号使用。</div>
            </div>
        </div>
        <!-- body end -->
    </div>
</template>
<script>
export default {
    data(){
        return{
            youdatea:"",
            redbao:[],
            yue:localStorage.getItem('ubalance'),
            show:false,
            redinput:"",
            redexange:""
        }
    },
    created(){
        this.loadmorered();
        this.redchange();
    },
    methods: {
        redchange(){
        },
        beforeClose(action, done) {
            if(action === 'confirm') {
                var redinput=this.redinput;
                console.log(redinput)
                var url="red_envelopes/add"
                var uid=localStorage.uid;
                console.log(uid)
                var obj={uid:uid,exchangecode:redinput}
                this.axios.get(url,{params:obj}).then(res=>{
                    console.log(res.data)
                    var code=res.data.code
                    if(code==1){
                        this.$toast.success('红包兑换成功');
                        this.loadmorered()
                    }else{
                        this.$toast('兑换码失败');
                    } 
                })
                 this.redinput="";
                setTimeout(done, 200)
            }else if(action === 'cancel') {
               done() //关闭
            }
        },
        tianjia(){this.show=true},
        loadmorered(){
             var url="red_envelopes";
             var uid=localStorage.getItem('uid');
                //请求数据
                console.log(uid)
                var obj={uid:uid};
                this.axios.get(url,{params:obj}).then(res=>{
                //3.将数据保存在data中
                 console.log(res.data.data)
                // this.list=res.data.data
                var rows=res.data.data;
                this.redbao=rows;
                this.youxioaqi();
               })
        },
        youxioaqi(){
            //console.log("222")
            //console.log(this.redbao)
            for(var key in this.redbao){
                //console.log(this.redbao[key].ter_mof_validity)
                var youa=this.redbao[key].ter_mof_validity;
                var arr=youa.split("T");
                this.youdatea=arr[0];
                //console.log(this.youdatea)
            }
        }
    },
}
</script>
<style scoped>
.red_container{
    padding-top:3.1875rem;
    min-height: 100vh;
    background-color:#eee; 
    box-sizing: border-box;
}
/*头部导航条*/
.redtop{
    background-color:#333333;
    width:100%;
    height:3.2rem;
    text-align: center;
    line-height:3.2rem;
    position: fixed;
    top:0;
    left:0;
    margin: 0 auto;
    z-index: 10;
    }
.next{
    color:white;
    height:100%;
    width: 2.5rem;
    top:0.1rem;
    text-align: left;
    position: absolute;
    top:1.2rem;
    left:1rem;
}
.redw{
    color:#fff;
    font-size: 0.875rem;
    text-align: center;
    margin: 0 auto;
}
/*红包兑换码*/
.redeem{
    background-color:#fff8e9;
    width:100%;
    height:1.875rem;
    line-height: 1.875rem;
    position: relative;
    align-items: center;
}
.redeem span{
    margin-left:1.25rem;
    margin-right:.3125rem;
    font-size:.8125rem;
}
.tianjiared{
    color:#7b91b0;
    font-size:.8125rem;
    margin-left:0.3rem;
}
.yue{
    display:flex;
    justify-content: space-between;
    background-color:#fff8e9;
}
.yue span{
    margin:1.25rem;
}
.jian{
    font-size:.8125rem;
    margin-top:0.1rem;
    position: absolute;
    top:0.2rem;
    padding-top:0.24rem;
    padding-left: 0.1rem;
}
.redinput{
    text-align: center;
    vertical-align:middel;
    margin-top:.3125rem
}
/*redbody 用户没有红包 */
.redbody{
    background-color: #eee;
    height: 100%;
    padding-top:4.5rem;
    padding-bottom:21.32rem;
    display: none;
}
.redbody img{
    width:6.25rem;
    height:6.25rem;
}
.bodycen{
    font-size: .875rem;
    color:#9a9a9a;
    padding-bottom: 0.2rem;
}
.bodystree{
    padding-top:0.5rem;
    text-align: center;
}
/*没有更多有效红包*/
.noeffective{
    font-size: .875rem;
    color:#9a9a9a;
    padding-right:.625rem;
    border-right:1px solid #9a9a9a
}
/*查看更多失效红包*/
.nored{
    font-size: .875rem;
    color: #466899;
    padding-left:.625rem;
}

/*用户有红包*/
.bobybottom{
    background-color: #eee;
    
}
/*会员加量包*/
.member{
    width: 90%;
    height:8.375rem;
    background-color: #fff;
    margin: 0 auto;
    margin-top: 1rem;
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
.timeb{
    flex-wrap:nowrap ;
    word-break: break-all;
}
.use{
    padding: .625rem;
    color:#000;
    font-size: .875rem;
    text-align: justify;
    text-justify: newspaper;
    word-break: break-all;
}
</style>

