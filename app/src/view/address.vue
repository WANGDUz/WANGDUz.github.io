<template>
<!-- 选择地址页面 -->
  <div class="add">
    <div class="container">
      <!-- 顶层 -->
      <div class="top">
        <a href="javascript:history.go(-1)">
          <i style="width:40px; text-align: center;">
            <img style="padding: 18px 0;" src="../../public/img/arrow.png">
          </i> 
        </a>
        <span>地址列表</span>
      </div>
      <!-- 中层 -->
      <div class="list"  v-for="(item,index) of list" :key="index" >
        <div class="address">
          <!-- 地址 -->
          <a href="javascript:history.go(-1)">
          <div style="width:100%;">
            <div @click="dianji(index)"> 
              <div class="address_top">
                <span class="top1">{{item.roadname}}</span>
                <span class="top2">{{item.streets}}</span>
              </div>
              <div class="address_bottom">
                <span class="bottom1">{{item.alname}}</span>
                <span>{{item.phone}}</span>
              </div>
            </div>
          </div>
          </a>
          <!-- 地址修改功能 -->
          <router-link to="/changeadd"><div @click="newress(index)" class="correct"></div></router-link>
        </div>
      </div>
      <!-- 底层新增地址按钮 -->
      <div class="new">
        <router-link to="/newadd">
          <i></i>  
          新增收货地址
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list:[],
      uid:localStorage.getItem('uid')
    }
  },
  computed: {
    
  },
  methods:{
    dianji(i){
      this.$store.commit('changeCAdr',i);
      
      
    },
    newress(i){
      this.$store.commit('changeAadr',i)
    },
    address:function(){
      var url='address';
      var uid=this.uid;     
      this.axios.get(url,{params:{uid}}).then(res=>{
        // console.log(res.data.data)
        var a=res.data.data;
        this.list=a;
        this.$store.commit('initadr')
        for(var i in this.list){
          var a=this.list[i]
          var name=a.alname
          var streets=a.streets
          var roadname=a.roadname
          var phone=a.phone
          var aid=a.aid
          this.$store.commit('changeadr',{name,streets,roadname,phone,aid})
          // console.log(this.$store.getters.getReviseadr)
        }
      })
    },
  },
  created(){
    this.address();
  }
}
</script>

<style scoped>
  .add{
    text-align: inherit
  }
  .container{
    background: #fff;
    position: relative;
    padding-bottom: 5.625rem;
    box-sizing: border-box;
    min-height: 100vh;
  }
  .top{
    height: 3.125rem;
    position: relative;
    background-color:#fff;
    max-height: 3.125rem;
    display: flex;    
    z-index: 1;
    border-bottom: .0625rem solid rgb(204,204,204);
  }
  .top i{
    width: 2.5rem;
    height: 3.125rem;
    position: absolute;
  }
  .top span{
    transform: translateX(-50%);
    position: absolute;
    left: 50%;
    top: 0;
    padding: 1.125rem 0;
    align-items: center;
  }
  .list{
    overflow-x: hidden;
  }
  .address{
    height: 4.09375rem;
    margin: 0 0 0 .9375rem;
    padding: 0 .9375rem 0 0;
    display: flex;
    align-items: center;
    position: relative;
    top: 0;
    left: 0;
    border-bottom: .0625rem solid #E4E4E4;
    transition: transform .2s;
  }
  .address_top{
    font-size: 1rem;
    white-space: nowrap;
    overflow: hidden;         /*隐藏 */
    text-overflow: ellipsis;/* 变点 ... */
    line-height: 1.40625rem;
    max-width: 95%;
    color: #666;
  }
  .top1{
    margin-right: .625rem;
  }
  .address_bottom{
    font-size: .875rem;
    line-height: 1.25rem;
    margin-top: .1875rem;
    color: #666;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .bottom1{
    margin-right: .625rem;
  }
  .correct{
    width: 3.4375rem;
    height: 100%;
    background-image: url(../../public/img/xinzeng.png);
    background-repeat: no-repeat;
    background-size: .9375rem .9375rem;
    background-position: 1.25rem;
    position: absolute;
    right: 0;
    top: .0625rem;
  }  
  .new{
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 2.75rem;
    display: flex;
    align-items: center;
    justify-items: center;
    border-top: .0625rem solid #d7d7d7;
    background: #fff;
    justify-content: center;
  }
  .new a{
    height: 2.75rem;
    font-size: 1rem;
    color: #000;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    cursor: pointer;
    background: #fff;
    
  }
  .new i{
    background: url(../../public/img/jiahao.png) no-repeat;
    width: .9375rem;
    height: .9375rem;
    background-size: 100%;
    margin-right: .3125rem;
  }
</style>