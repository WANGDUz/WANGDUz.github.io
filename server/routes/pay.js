// 钱包支付路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var price = req.query.price;
  var uid=req.query.uid;
  var mark=req.query.mark;
  var sql = `SELECT ubalance FROM user WHERE uid=?`;
  pool.query(sql, [uid], (err, result) => {
    if (err){ 
      res.send(err)
    }else{
      console.log(result[0].ubalance,price);
      var ubalance=result[0].ubalance-price;
      console.log(ubalance);
      if(ubalance>=0){
        sql=`update user set ubalance=? where uid= ? `;
        pool.query(sql,[ubalance,uid],(err,result)=>{
          if(err){
            res.send(err);
          }else if(result.affectedRows>0){
            ubalance = parseInt(ubalance.toFixed(2));
            sql=`update orders set ostate=1 where mark=?`;
            pool.query(sql,[mark],(err,result)=>{
              if(err)throw err;
              if(result.affectedRows>0){
                res.send({ code: 1, msg: '支付成功', data: ubalance});
              }
            });
          }else{
            res.send({code:-2,msg:'未知错误',data:result});
          }
        })
      }else{
        res.send({code:-1,msg:'余额不足'});
      }
    }
  })
})

module.exports = router;