// 红包路由
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var pno = parseInt(req.query.pno);
  var ps = parseInt(req.query.pagesize);
  if (!pno) pno = 1;
  if (!ps) ps = 10;
  var uid=req.query.uid;
  var offset = (pno - 1) * ps;//起始记录数 ?
  var sql = `SELECT * FROM red_envelopes WHERE uid=? ORDER BY rid DESC LIMIT ?,?`;
  pool.query(sql, [uid,offset,ps], (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.send({code:1,msg:'用户红包查询成功',data:result});
    }
  })
})

router.get("/add",(req,res)=>{
  var exchangecode=req.query.exchangecode;
  console.log(exchangecode)
  var uid=parseInt(req.query.uid);
  console.log(uid)
  var sql=`SELECT rid FROM red_envelopes WHERE exchangecode = ? `;
  pool.query(sql,[exchangecode],(err,result) =>{
    if (err) {
      res.send(err);
    } else {
      console.log(result)
      if(result.length>0){
        sql=`update red_envelopes set  uid=? where exchangecode = ? `
        // console.log(sql)
        pool.query(sql,[uid,exchangecode],(err,result)=>{ 
          if(err){
            res.send(err)
          }else{
            res.send({code:1,msg:"验证码正确",data:result})
            // console.log(res.data.code)
          }
        })
      }else{
        res.send({code:-1,msg:"兑换码不正确",data:result})
      }
    }
  })
})
module.exports = router;