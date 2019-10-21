// 产品路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var sid = req.query.sid;
  var sql = `SELECT * FROM cate LEFT JOIN product ON cate.cateid=product.cateid WHERE cate.sid=? ORDER BY cateno`;
  pool.query(sql, [sid], (err, result) => {
    if (err){ 
      res.send(err)
    }else{
      res.send({code:1,msg:'商家产品信息查询成功',data:result});
    }
  })
})

module.exports = router;