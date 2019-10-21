<template>
    <div>
         <!-- 头部 start-->
        <div class="redtop">
            <a href="javascript:history.go(-1);">
                <van-icon name="arrow-left" class="next"/>
            </a>
            <span class="redw">暂未上线</span>
        </div>
        <div class="kong">
            暂未上线，还请期待哦……
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
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
}
.kong{
    height:100%;
    position: absolute;
    top:50%;
    left: 30%
}
 </style>

