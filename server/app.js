//使用express构建web服务器
const express = require('express');
const bodyParser = require('body-parser');
const session = require("express-session");
const cors=require("cors");
const questions=require("./routes/questions");
const address = require("./routes/address");
const orders=require("./routes/orders");
const products=require("./routes/products");
const red_envelopes = require("./routes/red_envelopes");
const comment = require("./routes/comment");
const shoplist = require("./routes/shoplist");
const login = require("./routes/login");
const shopInfo = require("./routes/shopInfo");
const pay = require("./routes/pay");
/*引入路由模块*/


var app = express();
app.listen(5050);//部署新浪云，硬性要求必须监听5050端口
app.use(cors({
  origin: ["http://localhost:8080", "http://127.0.0.1:5500"],
  credentials: true
}));
app.use(bodyParser.urlencoded({extended:false}));


app.use(session({
  secret: "128位字符串",    //#安全字符串
  resave: true,            //#每次请求保存数据 
  saveUninitialized: true, //#保存初始化数据
  rolling:true,
  cookie:{
    maxAge:5000
  }
}));
//托管静态资源到public目录下
app.use(express.static('public'));

// 常见问题API
app.use("/questions",questions);
// 用户地址API
app.use("/address",address);
// 订单列表
app.use("/orders",orders);
// 产品
app.use("/products",products);
// 红包
app.use("/red_envelopes",red_envelopes);
// 评价
app.use("/comment",comment);
// 商家列表
app.use("/shoplist", shoplist);
// 商家
app.use("/shopInfo",shopInfo);
// 登录
app.use("/login", login);
// 钱包支付
app.use('/pay',pay);


