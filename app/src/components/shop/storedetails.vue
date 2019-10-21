
<template>
    <div>
        <!-- 地址start -->
       <div class="address">
           <div class="addleft">
               <van-icon name="location-o" class="icon"/>
               <span class="dsize">山大路124号一层</span>
           </div>
           <div class="addright">
               <a href="">
                   <van-icon name="phone" class="icon"/>
               </a>
           </div>
       </div>
       <!-- 地址end -->
       <!-- 配送时间start -->
       <div class="time1">
           <van-icon name="clock-o" class="icon"/>
            <span class="dsize">配送时间：08:00--22:00</span>
       </div>
       <!-- 配送时间end -->
        <!-- 公告 start -->
        <div class="notice" type="primary"  @click="Popup">
            <div class="notleft">
                <van-icon name="volume-o" class="icon"/>
                <span class="notgonggao">欢迎光临肯德基急宅送，专业外送，全程保温，准时送达</span>
            </div>
            <div class="notright">
                <van-icon name="arrow" class="icon"/>
            </div>    
        </div>
        <!-- 商家服务start -->
        <div class="store">
            <div>
                <van-icon name="passed" class="icon"/>
                <span >商家服务</span>
            </div>
            <div class="serves">
                <div class="pai">
                    <img src="../../../public/lv/pinpia.png" alt="">
                    <span class="ss">该商家为品牌用户</span>
                </div>
                <div class="pai">
                    <img src="../../../public/lv/zhifu.png" alt="" >
                    <span class="ss">该商家支持在线支付</span>
                </div>
                <div class="pai">
                    <img src="../../../public/lv/piao.png" alt="" >
                    <span class="ss">该商家支持发票</span>
                </div>
            </div>
        </div>
        <!-- 商家服务end -->   
        <!-- 折扣和zhifu  start-->
            <div>
                <div class="manjian">
                    <img src="../../../public/lv/jian.png" alt="" class="">
                   <span>折扣商品3.45折起(在线用户专享)</span>
                </div>
                <div class="zhekoutop">
                    <img src="../../../public/lv/zhe.png" alt="">
                   <span>折扣商品3.45折起(在线用户专享)</span>
                </div>
                <div class="zhekoubottom">
                    <img src="../../../public/lv/zhifu.png" alt="">
                    <span >该用户支持在线支付</span>
                </div>
            </div>
        <!-- 折扣和zhifu  end-->
    </div>
</template>
<script>
export default {
  data() {
    return {

    }
  },
  methods: {
    Popup() {
      this.$emit("showPopup");
    }
  },
  props:["showPopup"]
};
</script>
<style scoped>
/*地址*/
.address{
    display: flex;
    justify-content:space-between;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #f3f3f3;
}
/*定位图片大小*/
.dingwei{
    width:1.2rem;
    height:1.2rem;
    margin-top:0.1rem;
}
.icon{
    margin-top:0.13rem;
    padding-right: 0.3rem;
    color:black;
}
.psize{
    width:1.4rem;
    height:1.4rem;
    border-left:1px solid #f3f3f3;
    padding-left:1rem
}
/*文字大小*/
.dsize{
    font-size:1rem;
}
/**/
.addleft{
    display: flex;
}
/*配送时间*/
.time1{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:1rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #f3f3f3;
}
/*公告*/
.notice{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:1rem;
    padding-bottom: 1.5rem;
    justify-content:space-between ;
    position: relative;
}
.notleft{
    display:flex;
}
.notleft span{
    margin-left:0;
   
}

.notgonggao{
    text-align: justify;
    text-justify: newspaper;
    word-break: break-all;
    margin: 0;
    overflow: hidden;/*超出部分隐藏*/
    text-overflow:ellipsis;/* 超出部分显示省略号 */
    white-space: nowrap;/*规定段落中的文本不进行换行 */
    width: 15.625rem;/*需要配合宽度来使用*/
}
/*弹窗*/

/* 弹窗折扣
.zhekou{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:1rem;
    padding-bottom: 1rem;
    font-size: 0.7rem;
}
.zhekou img{
    width:1rem;
    height:1rem;
    padding-right:0.5rem;
}
配送*//*
.peisong{
    margin-left:2rem;
    margin-right:2rem;
    font-size: 0.7rem;
    margin-bottom: 1rem;
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
/*公告
.gonggao{
    margin-left:2rem;
    display:flex;
    font-size:1.1rem
} */
/*商家服务*/
.store{
    display: flex;
    margin-left: 1.9rem;
}
.store img{
    width:1rem;
    height:1rem;
    padding-right:0.6rem;
    margin-top:0.1rem;
}
.store span{
    margin-right:1rem;
}
.serves{
     text-align: justify;
}
.ss{
    font-size: 0.8rem;
    margin-top:1px;
}
.pai {
    display: flex;
    height: 21px;
    align-items: center;
}

.pai span {
    line-height: 16px;
    vertical-align: top;
}
.zhekoutop{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    padding-bottom: 1rem;
    font-size: 1rem;
}
.zhekoutop img{
    width:1rem;
    height:1rem;
    padding-right:0.6rem;
    margin-top:0.1rem;
}
.zhekoubottom{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top: 0
}
.zhekoubottom img{
    width:1rem;
    height:1rem;
    padding-right:0.6rem;
    margin-top:0.1rem;
}
.manjian{
    display: flex;
    margin-left:2rem;
    margin-right:2rem;
    margin-top:1rem;
    padding-bottom: 1rem;
    font-size: 1rem;
}
.manjian img{
    width:1rem;
    height:1rem;
    padding-right:0.6rem;
    margin-top:0.1rem;
}

</style>

