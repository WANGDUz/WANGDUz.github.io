// 用户地址路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var uid=req.query.uid;
  var sql = `SELECT * FROM address_list WHERE uid=?`;
  pool.query(sql, [uid], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'成功获取用户地址',data:result});
    }
  })
})
  
router.get("/regadd", (req, res) => {
  var roadname=req.query.roadname;
  var streets=req.query.streets;
  var alname=req.query.alname;
  var phone=req.query.phone;
  var uid=req.query.uid
  var sql=`INSERT INTO address_list(roadname,streets,alname,phone,uid) VALUES(?,?,?,?,?)`;
  pool.query(sql,[roadname,streets,alname,phone,uid],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      if(result.affectedRows>0){
        res.send({code:1,msg:'成功'});
      }else{
        res.send({code:-1,msg:'失败'});
      }
    }
  });
});

router.get("/deladr", (req, res) => {
  var aid=req.query.aid
  var sql=`DELETE FROM address_list WHERE aid=?`;
  pool.query(sql,[aid],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      if(result.affectedRows>0){
        res.send({code:1,msg:'成功'});
      }else{
        res.send({code:-1,msg:'失败'});
      }
    }
  });
});

module.exports = router;



  