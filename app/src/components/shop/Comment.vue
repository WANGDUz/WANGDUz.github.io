<template>
<div class="all_pattern">
  <div>
    <!-- 商家评分 -->
    <div class="ping_fen">
      <div class="pattern">
        <div class="grade list_grade">4.8</div>
        <div class="grade_xia">商家评分</div>
      </div>
      <!-- 口味评分 -->
      <div class="pattern">
        <div style="margin: 3px 0 10px;" class="zi_0">
          <div class="flavor">口味</div>
          <!-- 星星评价 -->
          <van-rate v-model="value" readonly allow-half void-color="#FFB000" size="10px" gutter="0.5px" />
          <div class="fen_shu">4.7</div>
        </div>
        <!-- 包装评分 -->
        <div class="zi_0">
          <div class="flavor">包装</div>
          <!-- 星星评价 -->
          <van-rate v-model="value1" readonly allow-half void-color="#FFB000" size="10px" gutter="0.5px"/>
          <div class="fen_shu">4.9</div>
        </div>           
      </div>
      <!-- 配送评分 -->
      <div class="pattern">
        <div class="grade">4.9</div>
        <div class="grade_xia">配送评分</div>
      </div>   
    </div>
    <!-- 评论数量 -->
    <div class="grade_remark_on" >
      <span class="remark_on_number" :class="textpass[0]" @click="text1(0)">全部(133)</span>
      <span class="remark_on_number" :class="textpass[1]" @click="text1(1)">好评(40)</span>
      <span class="remark_on_number" :class="textpass[2]" @click="text1(2)">有图评价(30)</span>
      <span class="remark_on_number" :class="textpass[3]" @click="text1(3)">一般(38)</span>
      <span class="remark_on_number" :class="textpass[4]" @click="text1(4)">差评(25)</span>
    </div>
    <div>
      <!-- 客户评价列表 -->
     <mentItem v-for= "(itempingjia,index) of pingjia " :key="index" :itempingjia="itempingjia"></mentItem>
    </div>
  </div>
</div>
</template>
<script>
export default {
  data() {
    return {
      value: 4.7,value1:5,
      textpass:[
        {grade_remark_on_1:true},
        {grade_remark_on_1:false},
        {grade_remark_on_1:false},
        {grade_remark_on_1:false},
        {grade_remark_on_1:false}
        ],
        pingjia:[]
    }  
  },
  props:["sid"],
  created() {
    this.loadpingjia();
    var sid=this.sid;
    console.log(sid)
  },
  methods: {
    loadpingjia(){
      console.log(sid)
      var url="comment";
      var sid=this.sid;
      var obj={sid:sid};
      this.axios.get(url,{params:obj}).then(res=>{
            //3.将数据保存在data中
             console.log(res.data.data)
            // this.list=res.data.data
             var rows=res.data.data;
            this.pingjia=rows
      })
    },
    text1(i){
      var checked=this.textpass[i].grade_remark_on_1;
      if(!checked){      
        for(var item of this.textpass){
          item.grade_remark_on_1=false;
        }
        this.textpass[i].grade_remark_on_1=true;
      }
    },
  },
}
</script>
<style scoped>
/* 背景颜色  左对齐*/
.all_pattern{
  background:#f4f4f4;
  flex: 0 0 auto;
  text-align: left;
}
/* 背景颜色 内外边距 */
  .ping_fen{
    display: flex;
    background-color:#fff;
    padding:15px 0;
    margin-bottom: 10px;
  }
  /* 外边距 宽高 */
  .pattern{
    padding:0 6%;
    width:3rem;
    height:3.125rem;
  }
  /* 左外边距清零 */
  .pattern:nth-child(2){
    position: relative;/*相对定位*/
    padding-left:0;
    flex: 1 1 auto;
  }
  /* 竖线 */
  .pattern:nth-child(2):after{
    content: '';
    position: absolute;
    height: 50px;
    width: 1px;
    left: auto;
    right: 0;
    bottom: 0;
    background-color: #e4e4e4;
    transform: scale(0.5, 1);
  }
  /* 字体大小 颜色 */
  .grade{
    font-size: 1.6875rem;
    text-align: center;
    color:#999;
  }
  /* 字体颜色 */
.list_grade{
    color: #FFB000;
  }
  .grade_xia{
    font-size: .75rem;
    color:#999;
  }
  /* 字体大小 颜色 */
  .flavor{
    font-size:.8125rem;
    color:#666;
    display: inline-block;
    margin-right: .9375rem;
  }
  /* 字体大小 颜色 左内边距*/
  .fen_shu{
    font-size: .875rem;
    color:#FFB000;
    margin-left: .625rem;
    display: inline-block;
  }
  .zi_0{
    font-size: 0;
  }
  /* 外边距 背景颜色 字体颜色 */
.grade_remark_on{
    padding: 15px 14px 5px 14px;
    background: #fff;
    margin-top: .625rem;
    color: #666;
    position: relative;
  }
  /* 中间线  */
.grade_remark_on::after{
  position: absolute;
  content: '';
  width: 100%;
  left: 0;
  bottom: 0;
  height: 1px;
  background-color: #e4e4e4;
  transform: scale(1, 0.5);
  transform-origin: center bottom;
}
.remark_on_number{
    display: inline-block;
    vertical-align: middle;
    padding: 0 12px;
    height: 26px;
    line-height: 27px;
    margin: 0 10px 10px 0;
    background: #FFF;
    font-size: .8125rem;
    color: #666;
    text-align: center;
    position: relative;
}
/* 评论数量 边框 */
.remark_on_number::before{
  content: '';
  position: absolute;
  top: -50%;
  bottom: -50%;
  left: -50%;
  right: -50%;
  -webkit-transform: scale(0.5);
  transform: scale(0.5);
  border-style: solid;
  border-width: 1px;
  border-color: #bbb;
  border-radius: 26px;
}
.grade_remark_on_1{
  background: #fffbf1;
  color: #FFB000;
  position: relative;
}

/* 默认边框颜色 */
.grade_remark_on_1::before{
  content: '';
  position: absolute;
  top: -50%;
  bottom: -50%;
  left: -50%;
  right: -50%;
  -webkit-transform: scale(0.5);
  transform: scale(0.5);
  border-style: solid;
  border-width: 1px;
  border-color: #FFB000;
  border-radius: 26px;
} 
</style>
