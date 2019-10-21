// 登录
// 目前登录注册需要测试，暂时使用get传参，上线前需要更改
const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
  var phone=req.query.phone;
  var upwd=req.query.upwd;
  var sql=`SELECT uid FROM user WHERE phone=?`;
  pool.query(sql,[phone],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      if(result.length==0){
        res.send({code:-1,msg:'手机号不存在'});
      }else{
        sql =`SELECT uid,uname,phone,ubalance,ava FROM user WHERE phone=? AND upwd=?`;
        pool.query(sql,[phone,upwd],(err,result)=>{
          if(err){
            res.send(err)
          }else if(result.length==0){
            res.send({code:-2,msg:'密码不正确'});
          }else{
            req.session.uid = result[0].uid;
            req.session.userMsg=result[0];
            res.send({code:1,msg:'登陆成功',data:result});
          }
        });
      }
    }
  });
});
router.get("/reg", (req, res) => {
  var phone=req.query.phone;
  var upwd=req.query.upwd;
  var sql=`INSERT INTO user(phone,upwd) VALUES(?,?)`;
  pool.query(sql,[phone,upwd],(err,result)=>{
    if(err){
      res.send(err);
    }else{
      if(result.affectedRows>0){
        sql=`SELECT uid FROM user WHERE phone=?`
        pool.query(sql, [phone], (err, result) => {
          if(err){
            throw err
          }else{
            var uid=result[0].uid;
            var letters = [];
            for (var i = 0; i < 4; i++) {
              var ranNum = Math.floor(Math.random() * 26);
              var type = Math.floor(Math.random() * 2);
              letters.push(String.fromCharCode(type == 0 ? 65 : 97 + ranNum));
            }
            var num = Math.floor(Math.random() * 1000000);
            var newred= letters[0] + letters[1] + num + letters[2] + letters[3];
            sql = `INSERT INTO red_envelopes(uid,exchangecode) VALUES(?,?)`;
            pool.query(sql, [uid,newred], (err, result) => {
              if(err) throw err;
              res.send({ code: 1, msg: '注册成功' });
            })
          }
        })
      }else{
        res.send({code:-1,msg:'注册失败'});
      }
    }
  });
});
module.exports = router;
