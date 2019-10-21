// 订单路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var pno = parseInt(req.query.pno);
  var ps = parseInt(req.query.pagesize);
  var uid = req.query.uid;
  if (!pno) pno = 1;
  if (!ps) ps = 10;
  var offset = (pno - 1) * ps;//起始记录数 ?
  var sql = `SELECT * FROM orders WHERE uid=? ORDER BY id DESC LIMIT ?,?`;
  pool.query(sql, [uid,offset,ps], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'评价查询成功',data:result});
    }
  })
})

router.get("/delord", (req, res) => {
  var id =req.query.id;
  var sql =`DELETE FROM orders WHERE id=?`;
  pool.query(sql, [id], (err, result) => {
    if (err) {
      res.send(err);
    } else if(result.affectedRows>0){
      res.send({ code: 1, msg: '删除成功', data: result });
    }else{
      res.send({code:-1,msg:'删除失败',data:result});
    }
  })
})
// 新创建订单
router.get("/new", (req, res) => {
  var uid = req.query.uid;
  var order_time = req.query.order_time;
  var sid = req.query.sid;
  var pname = req.query.pname;
  var num = req.query.num;
  var total = req.query.total;
  var mark = req.query.mark;
  var sql = `INSERT  INTO orders(order_time,sid,pname,num,total,uid,mark) VALUES(?,?,?,?,?,?,?)`;
  pool.query(sql, [order_time,sid,pname,num,total,uid,mark], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      console.log(result);
      if(result.affectedRows>0){
        res.send({code:1,msg:'订单创建成功',data:result});
      }else{
        res.send({code:-1,msg:'订单创建失败',data:result});
      }
    }
  })
})

module.exports = router;