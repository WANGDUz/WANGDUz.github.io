// 商家信息路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  // 获取客户端传参，判断排序类型,0为降序，1为升序
  var str;
  if(req.query.month){//月售
    str='month DESC';
  }else if(req.query.percapita){
    if (req.query.percapita==1){//人均0/1
      str='percapita';
    }else{
      str='percapita DESC';
    }
  }else if (req.query.score==0){ //评分
    str='score DESC';
  }else if(req.query.send_time==1){//配送时间
    str='send_time';
  } else if (req.query.send_cost==1){//配送费
    str='send_cost';
  } else if (req.query.floor_send_cost==1){//起送价
    str ='floor_send_cost';
  }else if(req.query.testdist==1){
    str='testdist';
  }else{
    str='sid';
  }
  //  pno 页码   pageSize 页大小固定10
  var pno = parseInt(req.query.pno);
  var ps = parseInt(req.query.pagesize);
  if (!pno) pno = 1;
  if (!ps) ps = 10;
  var offset = (pno - 1) * ps;//起始记录数 ?
  var sql = `SELECT * FROM shoplist ORDER BY `
  sql+=str+` LIMIT ?,?`;
  pool.query(sql, [offset, ps], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'商家列表查询成功',data:result});
    }
  })
})

module.exports = router;