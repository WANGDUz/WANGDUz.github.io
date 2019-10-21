 <template>
     <div>
         <!-- 头部 start-->
        <div class="redtop">
            <a href="javascript:history.go(-1);">
                <van-icon name="arrow-left" class="next"/>
            </a>
            <span class="redw">美食</span>
        </div>
        <div class="gao"></div>
          <storeItem v-for="(item,index) of list" :key="index" :item="item"></storeItem>
     </div>
 </template>
 <script>
 import storeItem from '../components/home/store_item';
 export default {
      data() {
    return {
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
            console.log(this.value);
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
            console.log(obj);
            //2.发送ajax请求获取第一页数据
            this.axios.get(url,{params:obj}).then(res=>{
                //3.将数据保存在data中
                console.log(res.data.data)
               // this.list=res.data.data
                // this.item.coupon_money=eval(this.item.coupon_money);
                var rows=res.data.data;
                this.list=rows;
            })
        },
    },
components:{
storeItem
  }
 }
 </script>
 <style scoped>
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
.gao{
    height:3.2rem;
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
    margin-left:-2.5rem;
}
 </style>
 
 