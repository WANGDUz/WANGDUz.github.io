<template>
  <div>
       <!-- 头部start -->
        <div class="indexsearch">
            <a href="javascript:history.go(-1);">
                <van-icon name="arrow-left" class="next"/>
            </a>
            <span class="searchpage">城市列表</span>
        </div>
        <!-- 头部end -->
        <!-- 搜索框start -->
        <van-search
            v-model="value"
            placeholder="城市中文名或拼音"
            show-action
            shape="round"
            @search="onSearch">
            <div slot="action" @click="onSearch">取消</div>
        </van-search>
        <!-- 搜索框end -->
        <!-- 当前定位城市start -->
        <div class="dingwei">
             <van-icon name="location-o" class="icontop"/>
            <span class="dizhi">当前定位城市:</span>
            <span class="jinan">{{this.citya}}</span>
            <P>若定位不准时，可手动选择</P>
        </div>
         <div id="allmap">111{{citya}}</div>
        <!-- 当前定位城市end -->
        <!-- 热门搜索start -->
        <div class="popular_search">
            <div class="popular_searchw">热门搜索</div>
        </div>
        <!-- 热门搜索end -->
        <div class="zhonglei">
            <div class="zhongleitop">
                <a href="">
                    <span class="zhonglei_item">北京</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">上海</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">广州</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">深圳</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">成都</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">杭州</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">南京</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">苏州</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">重庆</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">天津</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">武汉</span>
                </a>
                <a href="">
                    <span class="zhonglei_item">西安</span>
                </a>
            </div>
        </div>
        <!--  -->
        <van-index-bar class="list">
            <van-index-anchor index="A" />
            <van-cell title="安丘" />
            <van-cell title="安阳" />
            <van-cell title="澳门" />

            <van-index-anchor index="B" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="c" />
            <van-cell title="沧州" />
            <van-cell title="长春" />
            <van-cell title="朝阳" />

            <van-index-anchor index="D" />
            <van-cell title="大理" />
            <van-cell title="大连" />
            <van-cell title="稻城" />

            <van-index-anchor index="E" />
            <van-cell title="鄂尔多斯" />
            <van-cell title="鄂州" />
            <van-cell title="洱源" />

            <van-index-anchor index="F" />
            <van-cell title="肥城" />
            <van-cell title="扶苏" />
            <van-cell title="福州" />

            <van-index-anchor index="G" />
            <van-cell title="高青" />
            <van-cell title="高密" />
            <van-cell title="高唐" />

            <van-index-anchor index="H" />
            <van-cell title="海口" />
            <van-cell title="海南" />
            <van-cell title="合肥" />

            <van-index-anchor index="I" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="J" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />
            <van-index-anchor index="K" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="L" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="M" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="N" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="O" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="P" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="Q" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="R" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="S" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="T" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="U" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="V" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="W" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="X" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="Y" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />

            <van-index-anchor index="Z" />
            <van-cell title="北京" />
            <van-cell title="保定" />
            <van-cell title="宝鸡" />
        </van-index-bar>
<!-- </van-index-bar> -->
  </div>
</template>
<script>
export default {
    data() {
    return {
      value:"",
      citya:""
    }
  },
  mounted() {
      this.ipdingwei()
  },
  methods: {
    onSearch() {
    },
    ipdingwei(){
        var map = new BMap.Map("allmap");
	    var point = new BMap.Point(116.331398,39.897445);
        map.centerAndZoom(point,12);
        
        
	      var cityb=(result) => {
        var cityName = result.name;
		map.setCenter(cityName);
        // alert("当前定位城市:"+cityName);
        console.log(cityName)
        this.citya=cityName
        console.log(this.citya)
        }

	    var myCity = new BMap.LocalCity();
	   myCity.get(cityb);
     }
  }
}
</script>
<style scoped>
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
.icontop{
        vertical-align:-0.0625rem;
        line-height:3.1875rem;
    }
.dingwei{
    margin-left:.625rem
}
.jinan{
    color:#ffb000
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
    margin-left: .625rem;
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
.list van-index-anchor{
    background-color: #d7d7d7
}
</style>

