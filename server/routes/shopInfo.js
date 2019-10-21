// 获取当前商家的所有信息路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var sid=req.query.sid;
  var sql = `SELECT * FROM shoplist WHERE sid=?`;
  pool.query(sql, [sid], (err, result) => {
    if (err) {
      res.send(err);
    } else if(result.length>0){
      res.send({ code: 1, msg: '查询成功', data: result });
    }else{
      res.send({code:-1,msg:"没有此商家"});
    }
  })
})
module.exports = router;