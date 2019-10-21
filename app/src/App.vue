<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
#app{
  min-height:100vh;
  font-family: "Hiragino Sans GB", Arial, Helvetica, '\5B8B\4F53', sans-serif;
}
.van-sidebar-item--select{
  border:0 !important;
}
/* 修改侧边栏小红点位置 */
.van-sidebar-item__text{
  position:initial !important;
}
.van-sidebar-item{
  position: relative;
}
.van-info{
  top:10px !important;
  right:10px !important;
  transform: scale(0.8) !important;
  background-color:#FB4E44 !important;
}
</style>
