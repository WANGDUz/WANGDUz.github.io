SET NAMES UTF8;
DROP DATABASE IF EXISTS orange;
CREATE DATABASE orange CHARSET=UTF8;
USE orange;
#吕 商家表
CREATE TABLE  shoplist(
  sid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,                       # 商店ID ,
  shop_name VARCHAR(20),                             #商店名称,
  contact_mobile VARCHAR(11),                  # 联系电话,
  s_cate VARCHAR(20),                   # 门店类型,
  begin_time  DATE ,                 # 营业开始时间,
  end_time  DATE ,                   # 营业结束时间,
  store_img VARCHAR(500),                    #门店图片,
  month INT ,                       # 月售,
  logo_img VARCHAR(500),                    # logo图片,
  province VARCHAR(20) ,                     # 省,
  city VARCHAR(20),                        # 市,
  district VARCHAR(20),                     # 区,
  street VARCHAR(100),                  # 街道/门牌号,
  address  VARCHAR(200),                       # 详细地址,
  mobile VARCHAR(11),                # 外卖电话,
  notice VARCHAR(500),               # 商家公告,
  percapita DECIMAL(6,2),                  #人均,
  score DECIMAL(2,1),                    # 平均评分,5分制
  send_time INT,                   #配送时间,保存分钟数
  send_cost DECIMAL(6,2) ,           #配送费用,
  floor_send_cost DECIMAL ,      #起送消费,
  coupon_money VARCHAR(50) ,       #红包满减金额,
  zhe           DECIMAL(6,2),          #折扣
  zeng          VARCHAR(50),            #满赠
  fan           VARCHAR(50),             #支付满，反代金券
  Special_delivery  BOOLEAN,             #是否美团专送,
  isonline_payment  BOOLEAN,             #是否在线支付,
  isinvoice   BOOLEAN,                   #是否有发票,
  testdist  INT                          #测试使用的商家距离，保存记录的米数
);
INSERT INTO shoplist VALUES (NULL, '肯德基宅急送', '18245617582', '快餐', '06:00:00', '22:59:00', 'img/shoplogo/kfc.jpg', 2000, 'img/shoplogo/kfc.jpg', '山东省', '济南市', '历下区', '山大路', '山大路124号一层', '15502662775', '欢迎肯德基宅急送，专业外送，全程保温，准时送达！', 38, 4.9,30,9,20, '[[69,10],[91,20]]',5,NULL,NULL, 0, 1,1,666);

INSERT INTO shoplist VALUES (NULL, '九块九小厨', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 522, 'img/shoplogo/shoplogo_jiukuaijiu.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 20, 4.9, 33,1,2, '[[25,12],[40,20],[60,30]]',5.62,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,699);

INSERT INTO shoplist VALUES (NULL, '麦当劳麦乐送', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 529, 'img/shoplogo/mdl.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 16, 4.8, 28,2,1, '[[25,12],[40,20],[60,30]]',3.87,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,722);

INSERT INTO shoplist VALUES (NULL, '三可手工虾仁水饺', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 666, 'img/shoplogo/sk.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 7, 4.7, 25,1,2, '[[25,12],[40,20],[60,30]]',6.52,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,677);

INSERT INTO shoplist VALUES (NULL, '汉堡王', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 999, 'img/shoplogo/hbw.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 55, 4.5, 41,3,15, '[[25,12],[40,20],[60,30]]',8.2,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,833);

INSERT INTO shoplist VALUES (NULL, '一桶干拌冒菜', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 459, 'img/shoplogo/mc.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 41, 4.5, 33,5,12, '[[25,12],[40,20],[60,30]]',7.5,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,688);

INSERT INTO shoplist VALUES (NULL, '三点把子肉', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 888, 'img/shoplogo/bazirou.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 16, 4.5, 20,1,4, '[[25,12],[40,20],[60,30]]',8.9,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,521);

INSERT INTO shoplist VALUES (NULL, '黄焖鸡米饭', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 9999, 'img/shoplogo/jimifan.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解', 18, 4.5, 19,5,15, '[[25,12],[40,20],[60,30]]',9.9,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,777);

INSERT INTO shoplist VALUES (NULL, '重庆鸡公煲', '1550266277', '快餐', '08:40:00', '22:30:00', 'img/shoplogo/shoplogo_jiukuaijiu.jpg', 777, 'img/shoplogo/jigongbao.jpg', '山东省', '济南市', '历下区', '山大路', '67号210档口（逸乐美食城二楼）', '15502662775', '欢迎来到九块九小厨(济南店)在此感谢小主们对本店一直以来的支持和信任，为了回馈小主们，我们坚持追求用心，责任，高品质，高效率，让小主们看到我们的努力，打心底觉得吃的安全，放心！温馨提醒:1高峰期提前下单，保障用餐时间2下雨天稍有延误请谅解',31, 4.5, 15,2,9, '[[25,12],[40,20],[60,30]]',4.2,'[66,"满66元赠送冰红茶一罐"]','[128,3]', 1, 1,0,448);

#吕   红包表
CREATE TABLE red_envelopes(
   rid  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,   #红包id
   uid INT ,
   ter_mof_validity DATE DEFAULT '2019-12-31',   #有效期
   redname VARCHAR(50) DEFAULT '新用户红包',   #红包名称
   redmoney DECIMAL(4,2) DEFAULT 10,  #红包金额
   exchangecode VARCHAR(10)      #红包兑换码
 );

INSERT INTO red_envelopes
values
  (NULL, '1', '2019-10-30', '新人红包', '5','aa123456aa'),
  (NULL, '1', '2019-10-25', '新人红包', '7','bb123456bb'),
  (NULL, '1', '2019-10-10', '新人红包', '5','cc123456cc' ),
  (NULL, '2', '2019-10-30', '新人红包', '30','dd123456dd' ),
  (NULL, NULL, '2019-10-30', '兑换红包', '30','ee123456ee' ),
  (NULL, NULL, '2019-10-30', '兑换红包', '30','ff123456ff' ),
  (NULL, NULL, '2019-10-30', '兑换红包', '30','gg123456gg' );

#保存不同的分类的名称
CREATE TABLE cate(
  cateid INT PRIMARY KEY AUTO_INCREMENT,
  catename VARCHAR(20),
  cateno TINYINT,
  sid INT
);
INSERT INTO cate VALUES(NULL,'热销',1,1);
INSERT INTO cate VALUES(NULL,'折扣',2,1);
INSERT INTO cate VALUES(NULL,'串串/卤味',3,1);
INSERT INTO cate VALUES(NULL,'新品上市',4,1);
INSERT INTO cate VALUES(NULL,'桶',5,1);
INSERT INTO cate VALUES(NULL,'美味汉堡',6,1);
INSERT INTO cate VALUES(NULL,'鸡翅/鸡排',7,1);
INSERT INTO cate VALUES(NULL,'原味鸡',8,1);
INSERT INTO cate VALUES(NULL,'小食/配餐',9,1);
INSERT INTO cate VALUES(NULL,'炸鸡啤酒',10,1);

INSERT INTO cate VALUES(NULL,'甜品/冰激凌',11,1);
INSERT INTO cate VALUES(NULL,'缤纷饮料',12,1);
INSERT INTO cate VALUES(NULL,'儿童套餐',13,1);
INSERT INTO cate VALUES(NULL,'咖啡',14,1);
INSERT INTO cate VALUES(NULL,'粥',15,1);
INSERT INTO cate VALUES(NULL,'美味早餐',16,1);
INSERT INTO cate VALUES(NULL,'夜宵套餐',17,1);
INSERT INTO cate VALUES(NULL,'夜宵单品',18,1);
INSERT INTO cate VALUES(NULL,'自选餐具',19,1);
INSERT INTO cate VALUES(NULL,'满减优惠专区',20,1);
INSERT INTO cate VALUES(NULL,'主食（单点不配送）',21,1);
INSERT INTO cate VALUES(NULL,'美味五折佳肴',22,1);
INSERT INTO cate VALUES(NULL,'虎邦辣酱(鲁西牛肉微辣)',23,1);

#王    产品表
CREATE TABLE product(
  pid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  #主键产品编号
  pname VARCHAR(40) NOT NULL,                   #产品名称
  cateid INT,                  #所属产品分类id
  price DECIMAL(8,2) NOT NULL,                  #产品价格
  oprice DECIMAL(8,2),             #原价
  sid INT,                               #所属商家
  pdesc  VARCHAR(100),                     #商品描述
  cover VARCHAR(500),           #封面图
  ulike  INT,            #点赞
  option  VARCHAR(500),   #规格
  sale INT,   #销量
  isrecommend BOOL,  #是否网友推荐,
  discount VARCHAR(12)  #产品页面红框中显示的内容
);
INSERT INTO product VALUES (NULL,'劲脆鸡腿堡ST',1,19,NULL,1,'整块无骨鸡腿肉,浓郁汉堡酱，香脆鲜嫩多汁。主要原料:鸡腿肉，面包，生菜','img/product/jituibao.jpg',4,'["大","中","小"]',2000,0,NULL);
INSERT INTO product VALUES (NULL,'香辣鸡腿堡(汉堡)ST',1,19,NULL,1,'整块无骨鸡腿肉,浓郁汉堡酱，香脆鲜嫩多汁。主要原料:鸡腿肉，面包，生菜','img/product/jituibao1.jpg',4,'["大","中","小"]',900,1,NULL);
INSERT INTO product VALUES (NULL,'二块新奥尔良烤翅T',1,12.9,NULL,1,'鲜嫩多汁，具烧烤香和甜辣味,主要原料:鸡翅','img/product/jichi.jpg',4,'["大","中","小"]',800,1,NULL);
INSERT INTO product VALUES (NULL,'黄金鸡块5块装T',1,11.5,NULL,1,'精选鸡肉烹炸，搭配调味酱，口感香鲜酥脆。,主要原料:黄金鸡块','img/product/jikuai.jpg',2,'["大","中","小"]',800,1,NULL);
INSERT INTO product VALUES (NULL,'老北京鸡肉卷T',1,17,NULL,1,'选用无骨鸡腿柳条、搭配传统甜面酱和新鲜爽脆黄瓜，酱香浓郁的老北京味。,主要原料:面饼，鸡腿肉条，黄瓜段，京葱丝','img/product/jiroujuan.jpg',3,'["大","中","小"]',700,1,NULL);
INSERT INTO product VALUES (NULL,'百事可乐(中)T',1,9.5,NULL,1,'主要原料：水，百事可乐糖浆，二氧化碳','img/product/kele.jpg',1,'["大","中","小"]',600,1,NULL);
INSERT INTO product VALUES (NULL,'鸡肉卷九珍套餐T',2,12.9,29,1,'老北京鸡肉卷1个+九珍果汁1杯','img/product/taocan1.jpg',0,'["大","中","小"]',75,1,'五折 限购1份');
INSERT INTO product VALUES (NULL,'老北京鸭肉卷套餐T',2,42.9,55,1,'老北京香辣鸭肉卷1个+热辣香骨鸡3块+薯条大1份+九珍果汁1杯','img/product/taocan2.jpg',0,'["大","中","小"]',86,0,'7.8折 限购1份');
INSERT INTO product VALUES (NULL,'卷堡双人餐ST',2,76,97,1,'升级版香辣鸡腿堡1个+老北京鸡肉卷1个+香辣鸡翅2块+新奥尔良烤翅2块+土豆泥1份+红豆派1块+九珍2杯','img/product/taocan3.jpg',1,'["大","中","小"]',200,0,'7.84折 限购1份');
INSERT INTO product VALUES (NULL,'精选多人套餐ST',2,121,150,1,'新奥尔良烤鸡腿堡1份+香辣鸡腿堡1份+老北京鸡肉卷1份+藤椒肯大大鸡排1份+香辣鸡翅4块+新奥尔良烤翅2块+醇香土豆泥2份+九珍果汁饮料3杯','img/product/taocan4.jpg',0,'["大","中","小"]',61,0,'7.91折 限购1份');
INSERT INTO product VALUES (NULL,'炸鸡分享桶T',2,60,74,1,'2块香辣鸡翅+2块新奥尔良烤翅+黄金鸡块(5块)+劲爆鸡米花（大）1份+2九珍果汁饮料','img/product/taocan5.jpg',1,'["大","中","小"]',82,0,'8.11折 限购1份');
INSERT INTO product VALUES (NULL,'炸鸡百威啤酒超级桶T',2,136,156,1,'八块香辣鸡翅+八块新奥尔良烤翅+百威啤酒4罐未成年人请勿饮酒，孕妇和身体不适者不宜饮酒。喝酒请勿驾车，请适度享用美酒，产品及包装以实物为准。','img/product/taocan5.jpg',0,'["大","中","小"]',0,0,'8.72折 限购1份');
INSERT INTO product VALUES (NULL,'香卤系列百威啤酒餐T',3,89,NULL,1,'香卤手撕鸡1份+香卤鸡翅尖1份+香卤鸡心1份+香卤鸡肫1份+香辣鸡翅2块+新奥尔良烤翅2块+百威啤酒2罐,未成年人请勿饮酒，孕妇和身体不适者不宜饮酒。喝酒请勿驾车，请适度享用美酒，产品及包装以实物为准。','img/product/luwei.jpg',0,'["大","中","小"]',13,0,NULL);
INSERT INTO product VALUES (NULL,'香卤系列可乐餐T',3,79,NULL,1,'香卤手撕鸡1份+香卤鸡翅尖1份+香卤鸡心1份+香卤鸡肫1份+香辣鸡翅2块+新奥尔良烤翅2块+百事可乐（中）2杯','img/product/luwei1.jpg',0,'["大","中","小"]',0,0,NULL);
INSERT INTO product VALUES (NULL,'香卤系列辣翅烤翅T',3,69,NULL,1,'香卤手撕鸡1份+香卤鸡翅尖1份+香卤鸡心1份+香卤鸡肫1份+香辣鸡翅2块+新奥尔良烤翅2块省是指比菜单单品总价省的金额','img/product/luwei2.jpg',0,'["大","中","小"]',6,0,NULL);
INSERT INTO product VALUES (NULL,'手撕鸡鸡翅尖辣翅T',3,39,NULL,1,'香卤手撕鸡1份+香卤鸡翅尖1份+香辣鸡翅2块
,香卤手撕鸡主要原料：带骨鸡肉，红油，芝麻,香卤鸡翅尖主要原料：鸡翅尖，红油，芝麻','img/product/luwei3.jpg',0,'["大","中","小"]',13,0,NULL);
INSERT INTO product VALUES (NULL,'手撕鸡鸡心辣翅T',3,39,NULL,1,'香卤手撕鸡1份+香卤鸡心1份+香辣鸡翅2块,香卤手撕鸡主要原料：带骨鸡肉，红油，芝麻,香卤鸡心主要原料：鸡心，红油，芝麻','img/product/luwei4.jpg',0,'["大","中","小"]',0,0,NULL);
INSERT INTO product VALUES (NULL,'辣堡可乐套餐T',4,28.5,NULL,1,'香辣鸡腿堡1份+百事可乐（中）1杯','img/product/hanbao1.jpg',1,'["大","中","小"]',37,1,NULL);
INSERT INTO product VALUES (NULL,'精选欢聚拾光桶T',4,131.5,NULL,1,'吮指原味鸡4块+香辣鸡翅4块+大份波纹霸王薯条+黄金鸡块5块装+醇香土豆泥1份+百事可乐（中）3杯','img/product/taocan7.jpg',1,'["大","中","小"]',20,1,NULL);
INSERT INTO product VALUES (NULL,'精选辣堡单人餐T',4,49,NULL,1,'香辣鸡腿堡1份+香辣黄金鸡柳4条+红豆派1份+九珍果汁饮料1杯','img/product/hanbao2.jpg',1,'["大","中","小"]',44,1,NULL);
INSERT INTO product VALUES (NULL,'超级外送全家桶ST',5,128,NULL,1,'升级版香辣鸡腿堡2个+升级版新奥尔良烤鸡腿堡1个+吮指原味鸡3块+香辣鸡翅2块+新奥尔良烤翅4块+醇香土豆泥2份+红豆派2个+1.25升百事可乐1瓶','img/product/tong1.jpg',0,'["大","中","小"]',200,1,NULL);
INSERT INTO product VALUES (NULL,'六味小吃桶T',5,69,NULL,1,'4块烤翅+2块辣翅+1块原味鸡+5块黄金鸡块+1份劲爆鸡米花（小）+2个红豆派','img/product/tong1.jpg',0,'["大","中","小"]',75,0,'8.17折 限1份');
INSERT INTO product VALUES (NULL,'鸡肉火腿帕尼尼ST',6,14,NULL,1,'升级版鸡肉火腿帕尼尼','img/product/hanbaojuan1.jpg',1,'["大","中","小"]',200,0,NULL);
INSERT INTO product VALUES (NULL,'鸡肉卷薯条套餐T',6,35,NULL,1,'老北京鸡肉卷1份+波纹霸王薯条(中)1份+九珍果汁饮料1杯','img/product/hanbaojuan2.jpg',0,'["大","中","小"]',61,0,NULL);
INSERT INTO product VALUES (NULL,'鸡肉火腿帕尼套餐ST',6,33,NULL,1,'升级版鸡肉火腿帕尼尼1份+波纹霸王薯条(中)1份+九珍果汁饮料1杯','img/product/hanbaojuan3.jpg',0,'["大","中","小"]',89,0,NULL);
INSERT INTO product VALUES (NULL,'辣翅九珍套餐T',6,23.5,NULL,1,'香辣鸡翅2块+九珍果汁1杯','img/product/jichi1.jpg',0,'["大","中","小"]',13,0,NULL);
INSERT INTO product VALUES (NULL,'藤椒肯大大鸡排T',7,13,NULL,1,'主要原料:鸡排，小麦粉','img/product/jichi2.jpg',0,'["大","中","小"]',82,0,NULL);
INSERT INTO product VALUES (NULL,'热辣香骨鸡T',7,11.5,NULL,1,'热辣香骨鸡','img/product/jichi3.jpg',1,'["大","中","小"]',99,0,NULL);
INSERT INTO product VALUES (NULL,'二块香辣鸡翅(炸鸡)T',7,11.5,NULL,1,'香辣多汁，口感鲜美。主要原料:鸡翅，小麦粉','img/product/jichi4.jpg',1,'["大","中","小"]',500,0,NULL);
INSERT INTO product VALUES (NULL,'20块香辣鸡翅T',7,89,NULL,1,'香辣鸡翅20块','img/product/jichi5.jpg',1,'["大","中","小"]',6,1,NULL);
INSERT INTO product VALUES (NULL,'十块新奥尔良烤翅T',7,49,NULL,1,'10块新奥尔良烤翅','img/product/jichi6.jpg',0,'["大","中","小"]',72,1,NULL);

INSERT INTO product VALUES (NULL,'吮指原味鸡套餐AST',8,37,NULL,1,'升级版香辣鸡腿堡1个 + 吮指原味鸡1块 + 九珍果汁饮料1杯','img/product/ji1.jpg',0,'["大","中","小"]',75,1,NULL);
INSERT INTO product VALUES (NULL,'吮指原味鸡套餐BT',8,45,NULL,1,'吮指原味鸡2块+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯','img/product/ji2.jpg',1,'["大","中","小"]',13,0,NULL);
INSERT INTO product VALUES (NULL,'吮指原味鸡套餐BT',8,12,NULL,1,'具有神秘配方浓郁的香料所散发的风味，鲜嫩多汁。,主要原料:鸡肉，小麦粉','img/product/ji3.jpg',1,'["大","中","小"]',600,0,NULL);
INSERT INTO product VALUES (NULL,'波纹霸王薯条T',9,12,NULL,1,'波纹霸王薯条T','img/product/xiaochi1.jpg',1,'["大","中","小"]',600,0,NULL);
INSERT INTO product VALUES (NULL,'劲爆鸡米花T',9,11.5,NULL,1,'劲爆鸡米花T','img/product/xiaochi2.jpg',1,'["大","中","小"]',300,1,NULL);
INSERT INTO product VALUES (NULL,'芙蓉荟蔬汤T',9,8.5,NULL,1,'选用蔬菜配以蛋花精制而成,主要原料:鸡蛋、蔬菜（菠菜、裙带菜、胡萝卜、香菇）、水','img/product/xiaochi3.jpg',2,'["大","中","小"]',300,0,NULL);
INSERT INTO product VALUES (NULL,'醇香土豆泥T',9,6.5,NULL,2,'细腻香浓的土豆泥加上润滑可口的鸡汁,主要原料:土豆泥粉，鸡汁粉，淡奶油，黄油','img/product/xiaochi.jpg',1,'["大","中","小"]',200,1,NULL);

INSERT INTO product VALUES (NULL,'酸辣土豆丝',NULL,4.9,8,2,'一样的大众菜，不一样的口味，欢迎品尝','img/product/product_tudousi.jpg',179,'["大","中","小"]',11000,2,'6.2折 限10份');
INSERT INTO product VALUES (NULL,'辣椒炒鸡蛋',NULL,8.9,10,2,NULL,'img/product/product_lajiao.jpg',99,'["大","中","小"]',800,1,'8.9折 限10份');
INSERT INTO product VALUES (NULL,'老厨白菜',NULL,6.99,8,2,'味道鲜美！欢迎品尝','img/product/product_baicai.jpg',68,'["大","中","小"]',5000,0,'8.74折 限10份');
INSERT INTO product VALUES (NULL,'老醋花生',NULL,6.9,NULL,2,'味道很棒','img/product/product_huasheng.jpg',750,'["大","中","小"]',6759,0,NULL);
INSERT INTO product VALUES (NULL,'五香凤爪',NULL,9.9,NULL,2,'味道很棒','img/product/product_fengzhua.jpg',9,'["大","中","小"]',8971,0,NULL);
INSERT INTO product VALUES (NULL,'口水鸡',NULL,16.9,NULL,2,'味道很棒','img/product/product_koushuiji.jpg',654,'["大","中","小"]',4352,0,NULL);
INSERT INTO product VALUES (NULL,'武汉麻辣酱鸭',NULL,6.9,NULL,2,'味道很棒','img/product/product_yazi.jpg',324,'["大","中","小"]',2350,0,NULL);
INSERT INTO product VALUES (NULL,'虎皮辣椒',NULL,2.6,NULL,2,'味道很棒','img/product/product_hupilajiao.jpg',955,'["大","中","小"]',4550,0,NULL);
INSERT INTO product VALUES (NULL,'川香毛血旺',NULL,30,NULL,2,'味道很棒','img/product/product_maoxuewang.jpg',1002,'["大","中","小"]',8545,0,NULL);
#王     用户表（大）
CREATE TABLE user(
  uid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  #主键用户id
  uname VARCHAR(20) NOT NULL DEFAULT '新用户',                   #用户名
  upwd VARCHAR(32) NOT NULL,                  #用户密码
  phone VARCHAR(11) NOT NULL UNIQUE,                  #用户手机号
  ava VARCHAR(500)     DEFAULT 'fox.png'    ,                      #头像
  ubalance  DECIMAL(8,2) DEFAULT 0
);

INSERT INTO user VALUES (NULL,'李白','123456j','13345678910','img/ava/libai.jpg',1000.00);
INSERT INTO user VALUES (NULL,'杜甫','123456','17865175555','img/ava/libai.jpg',200.00);
INSERT INTO user VALUES (NULL,'骆宾王','123456','17865112345','img/ava/libai.jpg',200.00);
INSERT INTO user VALUES (NULL,'李清照','123456','13215175055','img/ava/libai.jpg',200.00);
INSERT INTO user VALUES (NULL,'海子','123456','17863589055','img/ava/libai.jpg',200.00);
#朱   美团支付方式表（银行卡）（小）
CREATE TABLE bankcart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  bimg VARCHAR(1000),     #卡图标
  bid  VARCHAR(19) NOT NULL,       # 卡号
  bname VARCHAR(20)      # 银行名
);
INSERT INTO bankcart VALUES (NULL,'img/57b12a31N8f4f75a3.jpg', '666666666666', '中国建设银行');
INSERT INTO bankcart VALUES (NULL,'img/57b12a31N8f4f75a3.jpg', '777777777777', '中国农业银行');
INSERT INTO bankcart VALUES (NULL,'img/57b12a31N8f4f75a3.jpg', '777777777777', '邮政储蓄银行');
INSERT INTO bankcart VALUES (NULL,'img/57b12a31N8f4f75a3.jpg', '777777777777', '中国工商银行');
INSERT INTO bankcart VALUES (NULL,'img/57b12a31N8f4f75a3.jpg', '777777777777', '中国光大银行');
#朱   地址列表 （小）
CREATE TABLE address_list(
  aid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  roadname VARCHAR(200),   #街道
  streets VARCHAR(100),   #门牌号
  alname VARCHAR(20),       #姓名
  phone VARCHAR(20),     #电话
  uid INT NOT NULL       #对应用户id
);
INSERT INTO address_list VALUES (NULL,'历城区山大路', '数码港大厦A座一层', '李白', '17512345678',1);
INSERT INTO address_list VALUES (NULL,'历城区山大南路', '山东大学A楼', '杜甫', '17512345678',1);
INSERT INTO address_list VALUES (NULL,'历城区山大南路', '山东大学B楼', '老李', '17512345678',1);
INSERT INTO address_list VALUES (NULL,'历城区山大南路', '山东大学C楼', '老杜', '17512345678',1);
INSERT INTO address_list VALUES (NULL,'历城区山大南路', '山东大学D楼', '老白', '17512345678',1);
INSERT INTO address_list VALUES (NULL,'历城区山大南路', '山东大学E楼', '老甫', '17512345678',1);

# 于  订单列表（小）
CREATE TABLE orders(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,        #订单编号
order_time  DATETIME NOT NULL ,        #下单时间
sid INT NOT NULL ,               #商家编号
pname    VARCHAR(125) ,       #商品名称
num         VARCHAR(50) NOT NULL ,                 #数量
total DECIMAL(8,2) NOT NULL,       #总价
ostate INT NOT NULL DEFAULT 0 ,           #状态 0待付款 1等待接单 2商家已接单 3配送中  4订单已完成
uid INT     ,                              #用户id
mark INT UNIQUE                         #订单标识
);
INSERT INTO orders VALUES(NULL,'2019-9-17 ', 1,'["劲脆鸡腿堡ST","黄金鸡块5块装T"]', '[1,2]',45.5,4,1,123456789);
INSERT INTO orders VALUES(NULL,'2017-9-21 ', 1, '["香辣鸡腿堡(汉堡)ST"]', '[2]',31.4,4,1,121456789);


#于  用户评价列表（小）
CREATE TABLE order_comment(
  ocid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,    #主键,
  sid INT,                                      #商家id
  uname      VARCHAR(50),                          #客户昵称
  order_img   VARCHAR(500),                     #客户头像
  content     VARCHAR (250),                    #评论内容,
  add_content VARCHAR (200),                    #追加评论内容,
  txt_nr      VARCHAR (200),                    #服务
  images      VARCHAR (1000),                   #评论图片,
  song_time   INT ,                         #送餐花费时间 存分钟数，前台进行转换
  add_time    DATE,                             #评论时间,
  class       TINYINT                        #点赞类型  0好评 1差评 
 );
INSERT order_comment VALUES(NULL,1,'云鬟轻挽小犀簪','img/pltx/01.jpg','大写的好评！送的很快可乐还有加冰，土豆泥还是热的！','小清新聚神双人餐T,劲脆鸡腿堡套餐T,奥尔良烤鸡腿堡套餐T','礼貌热情,快速准时','img/pltx/01_active.jpg',28,'2019-9-16',0);
INSERT order_comment VALUES(NULL,1,'郭郭爱吃肉肉','img/pltx/02.jpg','丰盛的大餐，很过瘾','新堡堡双人餐T,双层鸡排堡蜘蛛侠单人餐T','礼貌热情,货品完好,仪表整洁,快速准时','',30,'2019-9-15',0);
INSERT order_comment VALUES(NULL,1,'都市心','img/pltx/03.jpg','一直订他家的，很完美！每次外卖都是一样的百吃不厌的鸡肉卷和蛋挞，偶尔来一份薯条，不过外送好像只有波纹的薯条，个人感觉没有最原始的薯条好吃.最爱肯德基的鸡肉卷其次就是蛋挞蛋挞原来有黄桃的，现在就只有原味的了.','鸡肉卷九珍套餐T,新奥尔良烤鸡腿堡ST,拿铁(中)T,葡式蛋挞(经典)1只T,红豆派T','礼貌热情,货品完好,风雨无阻,仪表整洁,快速准时','',35,'2019-9-3',0);
INSERT order_comment VALUES(NULL,1,'忙碌的人411','img/pltx/04.jpg','#手撕鸡鸡翅尖辣翅T# 拿到手万脸懵逼。39元？？ 分量不说了还难吃 刚在油桶里捞出来？','劲脆鸡腿堡S豆泥餐T,二块香辣鸡翅(炸鸡)T','风雨无阻','img/pltx/04_active.jpg',27,'2019-9-1',1);

#程  常见问题表 问题归类  0支付问题  1订单问题  2优惠问题  3其他问题
CREATE TABLE question(
  qid SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,   #问题编号
  qbl TINYINT NOT NULL,           #问题归属
  qtitle VARCHAR(200),    #问题内容
  answer   VARCHAR(250)    #回答 
);
INSERT INTO question VALUES (NULL,0,'Q：为什么提示我“账户存在异常，无法下单”？','包含（但不仅限于）以下行为者，系统将自动予以封禁（客服无权解封）：<br>i）有过虚假交易（编造不存在真实买卖的订单）；<br>ii）有过恶意下单行为；');
INSERT INTO question VALUES (NULL,0,'Q：在线支付取消订单后钱怎么返还？','订单取消后，款项会在一个工作日内，直接返还到您的账户余额。');
INSERT INTO question VALUES (NULL,0,'Q：怎么查看退款是否成功？','退款会在一个工作日之内到账户余额，可在“账号管理——我的账号”中查看是否到账。');
INSERT INTO question VALUES (NULL,0,'Q：在线支付的过程中，订单显示未支付成功，款项却被扣了，怎么办？','这个情况属于第三方交易平台付款延迟问题，我们会立即将扣款退回到您的账户余额。');
INSERT INTO question VALUES (NULL,1,'Q：如何取消订单?','如果商家尚未接单，您可以在订单详情页通过“取消订单”功能进行取消;如果商家已接单，则需要您电话联系后由商家取消订单。');
INSERT INTO question VALUES (NULL,1,'Q：我的订单为什么被取消了？','如果商家5分钟（部分品牌商家8分钟）未接您的订单，为了保障您的权益，系统将会为您自动取消订单；商家接单后可能由于无法联系到您、菜品售完等原因无法配送，因而取消了您的订单，具体原因可查看系统发送的短信或通知。');
INSERT INTO question VALUES (NULL,1,'Q：如何进行催单？','您可以在订单状态页面点击“电话催单”按钮向商家催单。');
INSERT INTO question VALUES (NULL,1,'Q：刚下单发现信息填错了怎么办？','如果商家尚未接单，您可以自主取消订单；如果商家已经接单，您可以电话联系商家后由对方取消订单。然后重新下一单。');
INSERT INTO question VALUES (NULL,2,'Q：哪些商家有优惠？都有些什么优惠？','有优惠的商家在商家列表页均含有优惠标识；具体的优惠可以查看活动详情或者商家详情页中的描述');
INSERT INTO question VALUES (NULL,2,'Q：在新用户享受的优惠中，新用户的条件是什么？','新用户是指第一次在美团外卖下单的用户（同一设备、同一手机号、同一账户、同一支付账号仅可享受一次）。');
INSERT INTO question VALUES (NULL,2,'Q：我达到了满赠、满减的优惠的金额，为什么没有享受相关的优惠？','满赠与满减优惠是以订单内菜品的总额及餐盒费来计算的，不包含配送费。');
INSERT INTO question VALUES (NULL,2,'Q：超时赔付是什么意思？','超时赔付模式即：商家承诺一个送达时间和一个折扣,从用户下单时间开始计算,如果外卖超过了承诺时间才送到,该份外卖按照折扣价收取费用。由于恶劣天气、某些美食烹调时间过长、或者其他因素,商家会选择性的延长承诺时间或者不做承诺。预订单不参与超时赔付');
INSERT INTO question VALUES (NULL,3,'Q：如果对商家服务不满意如何进行投诉？','您可以在该订单完成评价后点击订单详情页中的意见反馈向客服投诉，或者拨打客服电话向客服进行投诉。');
INSERT INTO question VALUES (NULL,3,'Q：如何联系客服解决问题？','您可以拨打客服电话或者在“我的”——>“意见反馈”页面提交反馈');
INSERT INTO question VALUES (NULL,3,'Q：我用的是手机客户端，为什么无法定位？','请先检查手机的网络以及是否开启定位功能。若确认正常，请试着在户外或wifi环境下进行定位。');
INSERT INTO question VALUES (NULL,3,'Q：如何修改自己的账户信息？','您可以在“我的”页面修改个人账号信息');
INSERT INTO question VALUES (NULL,3,'Q：为什么有时需要输入短信验证码？','为了保障您的账号安全及商家利益，对于新用户及一些有异常行为的下单系统会提示您输入短信验证码。如果迟迟未接收到短信验证码，您同样可以选择接听语音验证码。');