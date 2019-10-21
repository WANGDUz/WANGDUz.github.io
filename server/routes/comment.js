// 订单评价路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  //  pno 页码   pageSize 页大小固定10
  var pno = parseInt(req.query.pno);
  var ps = parseInt(req.query.pagesize);
  if (!pno) pno = 1;
  if (!ps) ps = 10;
  var sid = req.query.sid;
  var offset = (pno - 1) * ps;//起始记录数 ?
  var sql = `SELECT * FROM order_comment WHERE sid=? ORDER BY add_time DESC LIMIT ?,?`;
  pool.query(sql, [sid,offset,ps], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'评价查询成功',data:result});
    }
  })
})

module.exports = router;