<template>
  <div class="procount">
    <button class="subbtn" v-if="count[i.ord]>0" @click.stop="Countx(-1,i.ord,i.cateno)">-</button>
    <span class="count" v-if="count[i.ord]>0">{{count[i.ord]}}</span>
    <button class="addbtn" @click.stop="Countx(1,i.ord,i.cateno)">+</button>
  </div>  
</template>
<script>
export default {
  
}
</script>
<style scoped>

</style>