<template>
    <div class="store_item_container">
        <!-- 单个商家item -->
        <div class="one_store">
            <router-link :to="'/shop/'+item.sid+'/'+item.shop_name">
                <!-- 左侧商家logo -->
                <div class="store_left">
                    <img :src="'http://127.0.0.1:5050/'+item.logo_img" alt="" class="store_left_img">
                </div>
                <!-- 右侧商家的信息 -->
                <div class="store_right">
                    <!-- 右侧商家信息第一行 标题 -->
                    <div class="store_right_title">{{item.shop_name}}</div>
                    <!-- 右侧商家信息第二行 打分  月售  距离 分钟 -->
                    <div class="store_right_two">
                        <div>
                            <!-- 打分 -->
                            <van-rate v-model="value" readonly class="font_size" size="11px" gutter="1px"/>
                            <span class="font_size dafen">{{item.score}}分</span>
                            <!-- 月售 -->
                        <span class="font_size yueshou">月售{{item.month}}</span>
                        </div>
                        <div>
                            <!-- 分钟 -->
                            <span class="font_size minute">{{item.send_time}}分钟</span>
                            <!-- 距离 -->
                            <span class="font_size juli">{{item.testdist}}m</span>
                        </div>
                    </div>
                    <!-- 右侧商家信息第三行 起送 配送 人均  -->
                    <div class="store_right_three">
                        <!-- 起送 -->
                        <span class="font_size qisong">起送￥{{item.floor_send_cost}}</span>
                        <!-- 配送 -->
                        <span class="font_size indexpeisong">配送￥{{item.send_cost}}</span>
                        <!-- 人均 -->
                        <span class="font_size renjun">人均￥{{item.percapita}}</span>
                    </div>
                    <!-- 右侧商家信息第四行 大众点评高分商铺 -->
                    <div class="store_right_four"   v-if = "isdazhong==false">
                        <span class="dazhong" >大众点评高分商铺</span>
                    </div>
                    <!-- 右侧商家信息第五行 折扣 -->
                    <div class="store_right_five">
                        <p class="ptop">
                            <img src="../../../public/lv/zhe.png" alt="" class="zhekouimg">
                            <span class="zhekoutype">
                                折扣商品{{item.zhe}}折起
                            </span>
                        </p>
                        <p class="ptop">
                            <img src="../../../public/lv/jian.png" alt="" class="zhekouimg">
                            <span class="zhekoutype" v-for="(itema,index) of coupon_money" :key="index">
                                满{{itema[0]}}减{{itema[1]}}
                            <span v-if="item.coupon_money[index+1]">;</span>
                            </span>
                        </p>
                        <p class="pbottom">
                            <img src="../../../public/lv/piao.png" alt="" class="zhekouimg">
                            <span class="zhekoutype">
                                本店支持开发票，开票金额0元起
                            </span>
                        </p>
                    </div>
                </div>
            </router-link>
        </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      value: 5,
      isdazhong:true,
      coupon_money:""
    };
  },
  props:["item"],
 created() {
    this.coupon_money=eval(this.item.coupon_money);
},
}
</script>
<style scoped>
.store_item_container{
    margin-top:.625rem
}
/*父元素绝对定位*/
.one_stroe{
    position: relative;
}
/*图片相对定位*/
.store_left{
    position:absolute;
    left:.625rem
}

.store_right{
    padding-left:5.85rem;
    
}
/*商家左侧图片尺寸*/
.store_left_img{
    width:4.75rem;
    height:3.5625rem;
}
/*商家右侧第一行  商家标题样式*/
.store_right_title{
    font-size: 1rem;
    color: #333;
    line-height: 1.4;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-weight: 600;
    margin-bottom: 0.2rem;
}
/*右侧商家信息第二行 打分  月售  距离 分钟*/
.store_right_two{
    display:flex;
    justify-content: space-between;
    padding-right: 0.5rem;
    margin-bottom: 0.2rem;
}
/*字体大小*/
.font_size{
    font-size:.6875rem;
    color: #333;
}
/*打分左外边距 4px*/
.dafen{
    margin-left:.25rem;
}
/*月售左外边距 10px*/
.yueshou{
    margin-left:.625rem;
}
/*分钟加右边框*/
.minute{
    border-right:1px solid #ccc;
    padding-right:0.25rem;
}
/*距离加左内边距*/
.juli{
    padding-left:0.25rem;
}
/*<!-- 右侧商家信息第二行 起送 配送 人均  -->*/
/*起送*/
.qisong{
    border-right:1px solid #333;
    padding-right:0.25rem;
}
/*配送*/
.indexpeisong{
    padding-left:0.25rem;
    border-right:1px solid #ccc;
    padding-right:0.25rem;
}
/*人均*/
.renjun{
    padding-left:0.25rem;
}
/*<!-- 右侧商家信息第四行 大众点评高分商铺 -->*/
/*大众点评字体大小  样式*/
.store_right_four{
    margin-top:.5rem;

}
.dazhong{
    font-size:.6875rem;
    color:#000;
    padding:0.1rem;
    border:1px solid #e4e4e4;
}
/*<!-- 右侧商家信息第五 六行 折扣 发票 -->*/
/*折扣图片*/
.zhekouimg{
    width:.9375rem;
    height:.9375rem;
    margin-right: 0.3rem;
}
/*折扣字体*/
.zhekoutype{
    font-size:.6875rem;
    color:#666;
}
.ptop{
    margin-top:.5rem;
    margin-bottom: 0;
    display: flex;
    height: 1rem;
    align-items: center;
}
.pbottom{
    margin-top:.5rem;
    display: flex;
    height: 1rem;
    align-items: center;
}
</style>

