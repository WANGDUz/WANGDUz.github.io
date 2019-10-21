// 问题路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var sql = `SELECT * FROM question`;
  pool.query(sql, [], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'问题获取成功',data:result});
    }
  })
})
module.exports = router;