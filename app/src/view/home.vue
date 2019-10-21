<template>
<div class="container">
    <!-- 顶部 start-->
    <div class="top">
        <van-row type="flex" justify="space-between">
            <!-- 定位  -->
            <van-col span="12" class="dingweia">
                <router-link to="/city" class="dingwei">
                    <van-icon name="location-o" class="icontop"/>
                    <span class="dizhi">数码港大厦(山大路A座107达内科技)</span> 
                    <van-icon name="arrow" class="icontop"/>
                </router-link>
            </van-col>
            <!-- 搜索框 -->
            <van-col span="12" class="indexsearch">
                <router-link to="/indexsearch">
                    <van-search placeholder="请输入商家或商品" v-model="value1" class="search"
                        background="#00000" shape="round"/>
                </router-link>
            </van-col>
        </van-row>
    </div>
    <!-- 顶部 end-->
    <!-- 导航栏  start-->
    <div class="nav">
        <!-- 导航栏 top -->
         <van-row type="flex" justify="space-between" class="navtop">
            <van-col span="4">
                <router-link to="/dfood" :list="list">
                    <img src="../../public/img/meishi.png" alt="">
                    <div>美食</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/chaoshi.png" alt="">
                    <div>美团超市</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/shengxian.png" alt="">
                    <div>生鲜果蔬</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/zhuansong.png" alt="">
                    <div>美团专送</div>
                </router-link>
            </van-col>
            <van-col span="4">
               <router-link to="/kong" >
                    <img src="../../public/img/jiancan.png" alt="">
                    <div>快速简餐</div>
               </router-link>
            </van-col>
        </van-row>
        <van-row type="flex" justify="space-between" class="navbuttom">
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/wancan.png" alt="">
                    <div>晚餐优选</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/yinpin.png" alt="">
                    <div>甜点饮品</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/jiachang.png" alt="">
                    <div>家常菜</div>
               </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/xiawucha.png" alt="">
                    <div>小吃馆</div>
                </router-link>
            </van-col>
            <van-col span="4">
                <router-link to="/kong" >
                    <img src="../../public/img/xianhua.png" alt="">
                    <div>鲜花蛋糕</div>
                </router-link>
            </van-col>
        </van-row>
    </div>
    <!-- 导航栏  end-->
    <!-- 附近商家 start -->
    <div class="fujin">附近商家</div>
    <!-- 附近商家 end -->
    <div class="product">
         <van-tabs v-model="value" class="navigation" line-width="0px"  @click="loadMore">
            <van-tab title="综合排序" class="productleft">
                <storeItem v-for="(item,index) of list" :key="index" :item="item" ></storeItem>
                <van-dropdown-menu class="xiala" active-color="#f5a64b" >
                    <van-dropdown-item v-model="value" :options="option" @change="loadMore" />
                </van-dropdown-menu>
            </van-tab>
            <!-- 代替综合排序的下拉列表 -->
            <!-- 使用 vant组件的 -->
            <van-tab title="销量最高" name="a">
                 <storeItem v-for="(item,index) of list" :key="index" :item="item"></storeItem>
            </van-tab>
            <van-tab title="距离最近" name="b">
                <storeItem v-for="(item,index) of list" :key="index" :item="item"></storeItem>
            </van-tab>
            <van-tab title="筛选">
                 <storeItem v-for="(item,index) of list" :key="index" :item="item" :coupon_money="coupon_money"></storeItem>
            </van-tab>
        </van-tabs> 
    </div>
    <bottomTabbar></bottomTabbar>    
</div>
</template>

<script>
import storeItem from '../components/home/store_item';
export default {
  data() {
    return {
      active:"",
      value1:"",
      value: 0,
      switch1: false,
      switch2: false,
      option: [
        { text: '综合排序', value: 0 },
        { text: '速度最快', value: 1 },
        { text: '评分最高', value: 2 },
        { text: '起送价最低', value: 3 },
        { text: '配送费最低', value: 4 },
        { text: '人均高到低', value: 5 },
        { text: '人均低到高', value: 6 }
      ],
      coupon_money:"",
      list:[],
    }
  },
  created(){
        this.loadMore(); 
    },
    methods:{
        loadMore(){
            // 功能一 当组件创建成功后，获取第一页数据
            //1.创建url地址
            var url="shoplist"
            //1.1将当前页码+1
            // console.log(this.value);
            if(this.value==0){   //综合排序
                this.pno++;
                var obj={pno:this.pno}
            }else if(this.value==1){//按照速度
                var obj={send_time:1}
            }else if(this.value==2){  //评分低到高
                var score=0;
                var obj={score:score}
            }else if(this.value==3){  //起送低到高
                var floor_send_cost=1;
                var obj={floor_send_cost:floor_send_cost}
            }else if(this.value==4){  //配送低到高
                var send_cost=1;
                var obj={send_cost:send_cost}
            }else if(this.value==5){  //人均高到低
                var percapita=0;
                var obj={percapita:percapita}
            }else if(this.value==6){  //人均低到高
                var percapita=1;
                var obj={percapita:percapita}
            }else if(this.value=='a'){  //人均低到高
                var obj={month:1}
            }else if(this.value=='b'){
                var obj={testdist:1}
            }
            // console.log(obj);
            //2.发送ajax请求获取第一页数据
            this.axios.get(url,{params:obj}).then(res=>{
                //3.将数据保存在data中
                // console.log(res.data.data)
               // this.list=res.data.data
                // this.item.coupon_money=eval(this.item.coupon_money);
                var rows=res.data.data;
                this.list=rows;
            })
        },
    },
    onConfirm() {
      this.$refs.item.toggle();
  },
  components:{
    storeItem
  }
};

</script>

<style scoped>
    .container{
        padding-top: 3.1875rem;
        padding-bottom:51px;
    }
    .top{
        background-color: #1c1b20;
        width:100%;
        position: fixed;
        top:0;
        left: 0;
        padding-left:.625rem;
        padding-right:.625rem;
        z-index:66;
    }
    .dizhi{
        font-size:16px;
        overflow: hidden;/*超出部分隐藏*/
        text-overflow:ellipsis;/* 超出部分显示省略号 */
        white-space: nowrap;/*规定段落中的文本不进行换行 */
        /*需要配合宽度来使用*/
        vertical-align:bottom;
        display: inline-block;
    }
    .dingweia{
        vertical-align:bottom;
        line-height: 3.24375rem;
        
    }
    .dingwei{
        font-size: 1rem;
        color:#fff; 
        vertical-align:bottom;
        display: flex;
    }
    .icontop{
        vertical-align:-0.0625rem;
        color: #fff;
        line-height:3.1875rem;
    }

    
    /* 定位图片的大小 */
    .indexsearch{
        padding-right: .625rem;
    }
    /* 搜索框高度 30px */
    .search{
        height:3.2rem; 
    }
    /* 导航栏位置 */
    .nav{
        margin-top: 1rem;
        padding-right: .625rem;
    }
    .nav div{
        text-align: center;
    }
    /* 导航栏图片 */
    .navtop img{
        width:2.7rem;
        height:2.7rem;
    }
    .navbuttom img{
        width:2.7rem;
        height:2.7rem;
    }
    /* 导航栏字体颜色大小 */
    .navtop div{
        color:#000;
        font-size:0.75rem;
    }
    .navbuttom div{
        color:#000;
        font-size:0.75rem;
    }
    /* 导航栏位置 */
    .navtop{
        margin-bottom:1rem;
    }
    .navbuttom{
        margin-bottom:1rem;
    }
    /* 附近商家样式 */
.fujin {
    font-size: 1rem;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    font-weight: 800;
    line-height: 1.4;
    margin-top: 0.95rem;
    margin-bottom: 0.3rem;
}
    .fujin::before {
    content: '';
    height: 1px;
    width: 3.75rem;
    background: #666;
    margin-right: 3px;
    -webkit-transform-origin: 100% 50%;
    transform-origin: 100% 50%;
    -webkit-transform: scale(0.5);
    transform: scale(0.5);
    display: inline-block;
}
.fujin::after {
    content: '';
    height: 1px;
    width: 3.75rem;
    background: #666;
    margin-left: 3px;
    -webkit-transform-origin: 0 50%;
    transform-origin: 0 50%;
    -webkit-transform: scale(0.5);
    transform: scale(0.5);
    display: inline-block;
}

/* 下拉选择框样式 */
.productleft{
    color: #7d7e80;
    font-size: .775rem;
    
}
.xiala{
    width:7.125rem;
    height: 2.75rem;
    position: absolute;
    top:0;
    left:-1rem;
    font-size:.875rem;
    color: #7d7e80;
}
</style>

