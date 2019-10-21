<template>
  <div>
    <van-tabbar v-model="active"   active-color="#f5a64b" inactive-color="#949494" class="tabbar" route>
      <van-tabbar-item to="/home">
        <span>首页</span>
        <img slot="icon" slot-scope="props" :src="props.active?iconi.active:iconi.normal">
      </van-tabbar-item>
      <van-tabbar-item to="/order">
        <span>订单</span>
        <img slot="icon" slot-scope="props" :src="props.active?icono.active:icono.normal">
      </van-tabbar-item>
      <van-tabbar-item to="/mine">
        <span>我的</span>
        <img slot="icon" slot-scope="props" :src="props.active?iconm.active:iconm.normal">
      </van-tabbar-item>
    </van-tabbar>
  </div>
</template>
<script>
export default {
    data() {
    return {
      active: 0,
      iconi: {
        normal: '../../icon/shouye.png',
        active: '../../icon/shouye1.png'
      },
      icono: {
        normal: '../../icon/jilu.png',
        active: '../../icon/jilu1.png'
      },
      iconm:{
        normal: '../../icon/wode.png',
        active: '../../icon/wode1.png'
      }
    }
  }
}
</script>
<style>
.van-tabbar-item__icon img{
  height: 24px !important;
}
.van-tabbar.tabbar{
  /* border:1px solid #ccc; */
  background-color:#fafafa;
}
.van-field__control{
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
</style>