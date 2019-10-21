<template>
    <div>
        <!-- 头部start -->
        <div class="indexsearch">
            <a href="javascript:history.go(-1);">
                <van-icon name="arrow-left" class="next"/>
            </a>
            <span class="searchpage">搜索页</span>
        </div>
        <!-- 头部end -->
        <!-- 搜索框start -->
        <van-search
            v-model="value"
            placeholder="请输入商家或商品名称"
            show-action
            shape="round"
            @search="onSearch">
            
            <div slot="action" @click="onSearch">
                <router-link to="/dfood"  class="soucuocolor">
                搜索
                </router-link>
                </div>
            
        </van-search>
        <!-- 搜索框end -->
        <!-- 热门搜索start -->
        <div class="popular_search">
            <div class="popular_searchw">热门搜索</div>
        </div>
        <!-- 热门搜索end -->
        <!--  -->
        <div class="zhonglei">
            <div class="zhongleitop">
                <router-link to="/dfood" >
                    <span class="zhonglei_item">粥</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">豆腐脑</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">煎饼果子</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">包子</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">见鲜包子</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">牛肉烧饼</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">驴肉火烧</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">面</span>
                </router-link>
                <router-link to="/dfood" >
                    <span class="zhonglei_item">披萨</span>
                </router-link>
                <router-link to="/dfood">
                    <span class="zhonglei_item">肉夹馍</span>
                </router-link>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
    return {
      value:"",
    }
  },
  methods: {
    onSearch() {
     
    }
  }
}
</script>
<style scoped>
.soucuocolor{
    color:#000
}
/*搜索页头部div*/
.indexsearch{
    width:100%;
    height:3.2rem;
    text-align: center;
    line-height:3.2rem;
    position: relative;
}
.next{
    height:100%;
    width: 2.5rem;

    top:0.1rem;
    text-align: left;
    color:black;
    position: absolute;
    top:1.2rem;
    left: 1rem;
}
.searchpage{
     font-size: 0.875rem;
    text-align: center;
    margin: 0 auto;
    margin-left:-2.5rem;
}
/*热门搜索字体颜色*/
.popular_searchw{
    color:#999;
    font-size: .875rem;
    height: 40px;
    margin-left: 10px;
    line-height: 40px;
    border-bottom: 1px solid #E4E4E4;
}
/*种类列表样式*/
.zhonglei{
    margin-top:.8125rem;
    margin-bottom:.8125rem;
    margin-left: 1.25rem;
    margin-right: .625rem;
}
.zhongleitop{
    width: 100%;
   display: flex;
   justify-content:flex-start;
   flex-wrap: wrap;
}
.zhonglei a{
 margin-right: .625rem;
}
.zhonglei_item{
    display: block; 
    color:#000;
    border: 1px solid #d7d7d7;
    border-radius: 2px;
    padding: 5px;
    white-space: nowrap;
    margin-bottom:.625rem;
}
</style>

