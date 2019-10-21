<template>
    <div>
        <div class="ding_dan">
            <div class="bei_jing">
                    <ul>
                        <orderItem v-for="(item,index) of list1" :item="item" :key="index" ></orderItem>
                    </ul>
                    <div class="more_shuju">
                        <span>没有更多数据了</span>
                    </div>
                </div>
            </div>
        <bottomTabbar></bottomTabbar>  
    </div>
</template>
<script>
import orderItem from '../view/order_item';
export default {
    data(){
        return{
            list1:[]
        }
    },
    created(){
        this.loadMore(); 
    },
    methods:{
        loadMore(){
            // 获取url地址
            var url="orders"
            // 创建uid
            var uid=localStorage.getItem("uid");
            // console.log(uid)
            var obj={uid:uid}
            // 发送请求
            this.axios.get(url,{params:obj}).then(res=>{
                //3.将数据保存在data中
                 console.log(res.data.data)
               // this.list=res.data.data
                var rows=res.data.data;
                this.list1=rows
            })
        },
    },
    components:{
    orderItem
  }
}
</script>
<style scoped>
p, div, ul, ol, li, i {
    margin: 0;
    padding: 0;
}
/* 页面背景颜色 内边距 */
.ding_dan{
    background: #f0f0f0;
    border-top: none;
    overflow: scroll;
}
.bei_jing{
  background: #f0f0f0;
  padding: 0;
  height: 100vh;
}
.more_shuju{
    font-size: .875rem;
    background: #fff;
    text-align: center;
    line-height: 45px;
    justify-content: center;
    padding-bottom: 34px;
    color:#333;
}
</style>