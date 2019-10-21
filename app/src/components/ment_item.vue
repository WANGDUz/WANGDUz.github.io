<template>
  <div>
     <ul class="ping_list">
        <li class="ping_list_on">
          <div>
            <!-- 客户头像 -->
            <div class="list_on_1">
              <img class="list_on_tu" :src="'http://127.0.0.1:5050/'+itempingjia.order_img">
            </div>
            <div class="list_on_2">
              <div class="ping_lun">
                <span class="list_on_2_name">{{itempingjia.uname}}</span>
                <span class="list_on_2_time">{{addtimea}}</span>
              </div>
              <div class="songda">
                <span class="song_da_time">{{pingjia.song_time}}分钟送达</span>
              </div>
              <div class="content_on">{{itempingjia.content}}</div>
              <div class="pl_tupian" v-if="itempingjia.images==0?null:!null">
                <img class="pl_img" :src="'http://127.0.0.1:5050/'+itempingjia.images" >
              </div>
              <div class="go_back">
                <div class="xiao_shou ping_tu_biao"></div>
                <span class="go_back_write">{{itempingjia.add_content}}</span>
              </div>
              <div class="go_back">
                <div class="biao_qian ping_tu_biao"></div>
                <span class="go_back_write_1">{{itempingjia.txt_nr}}</span>
              </div>
            </div>
          </div>
        </li>
      </ul>
  </div>
</template>
<script>
export default {
   data() {
    return {
      addtimea:"",
      pingjia:{
      add_time:""
      },
    }
  },
  created() {
    console.log(this.itempingjia);
    var addtime=this.itempingjia.add_time;
    var arr=addtime.split("T");
    this.addtimea=arr[0];
    this.pingjia=this.itempingjia;
  },
  props:["itempingjia"]
}
</script>
<style scoped>
  .ping_list{
  padding-left: .9375rem;
  background-color: #fff;
  list-style: none;
}
.ping_list_on{
  padding: 15px 15px 10px 0;
  overflow: hidden;
  background-color: #fff;
  list-style: none;
  position: relative;
}
.ping_list_on::after{
  position: absolute;
  content: '';
  width: 100%;
  left: 0;
  bottom: 0;
  height: 1px;
  background-color: #e4e4e4;
  -webkit-transform: scale(1, 0.5);
  transform: scale(1, 0.5);
  transform-origin: center bottom;
}
.list_on_tu{
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.list_on_1{
  float: left;
  width:15%;
}
.list_on_2{
  float:right;
  width:85%;
}
.list_on_2_name{
  color: #2f2f2f;
  font-size: 1rem;
  float: left;
}
.list_on_2_time{
  font-size: .75rem;
  color: #898989;
  float: right;
}
.ping_lun{
  line-height: 15px;
  display: flow-root;
}
.songda{
  margin-top: .4375rem;
  line-height: .75rem;
}
.song_da_time{
  color: #666;
  font-size: .75rem;
  line-height: .75rem;
}
.content_on{
  font-size: .875rem;
  line-height: 20px;
  color: #2f2f2f;
  padding-top: 14px;
  padding-bottom: 8px;
}
.go_back{
  margin: 4px 0;
  font-size: .75rem;
}
.go_back_write,.go_back_write_1{
  color: #999;
  vertical-align: middle;
}
.pl_tupian{
  width: 80px;
  height: 80px;
  background-size: 80px 80px;
}

.pl_img{
  width: 100%;
  height: 100%;
}
.xiao_shou{ 
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAWCAMAAAAYXScKAAAAPFBMVEX///+pqamtra35+fnAwMDLy8vx8fHu7u7b29vExMT8/Pz19fXi4uK7u7u2trbl5eXf39/W1tbPz8+qqqppjO8pAAAAi0lEQVQY02XQ3Q6DIAxA4Z7y79RN9/7vulVMVHpuCB+kIUivNG1Zhgr/viMv7CERn5hYJplWHpdnNB9n9YZh7dvI+6atDwxKuLCiL1s3ehpfx6Nmw6yc2a1Ikkch0cSmDYwKyFBmFa+VJF4bs9dJCV4Li3jd2L327wA/1o5quOH5+R/GihhH5Uqj4Q/pNgLaSP0LZQAAAABJRU5ErkJggg==) no-repeat;
}
.biao_qian{
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAMAAADzapwJAAAAP1BMVEUAAACqqqqqqqqqqqqqqqqrq6uqqqqqqqqqqqqqqqqqqqqqqqqqqqqpqamqqqqqqqqqqqqrq6uqqqqqqqqqqqqapZRHAAAAFHRSTlMAmvmB5xcGous9I0nfcTDPinPVxncLVj8AAACOSURBVBjTXdHRCsMgDIVho2mjtmu77bz/sy7O0gP5b4SPEJCkp359tdaqp7TEBMyoyNaW0VEyGrU8IwUSddTxeXT1d1Pd/FmgVE/hMLj+Fa6BqVzifMwNbO42SFCfPNOOHnQVSFIsQUv2SUMJivHJhvwOs3J/5hU1OpVOndncT6WX3q9b48lcQ8323XjbH38FB9ULfpb4AAAAAElFTkSuQmCC) no-repeat;
}
.ping_tu_biao{
  width: 11px;
  height: 11px;
  margin-right: 10px;
  background-size: contain;
  display: inline-block;
  vertical-align: middle;
}
</style>