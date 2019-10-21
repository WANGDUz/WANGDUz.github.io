import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
		// 当前登录的用户信息
		user:{
			uname:"",
			ava:"",
			uid:"",
			ubalance:0
		},
		// 当前激活的产品卡片
		activeCard:{},
		// 保存当前激活的购物车编号
		activeCartId:-1,
		// 测试当前购物车中的所有信息
		activeCart:{
			count:[],
			price:[],
			pid:[],
			pname:[],
			alCount:0,
			alPrice:0,
			cateCount:[],
			img:[]
		},
		// 订单待付款
		needCost:0,
		// 用户点击结算进入提交订单的值
		commitMsg:{
			sid:'',
			sname:'',
			proName:[],
			proPrice:[],
			proCount:[],
			proImg:[],
			sendCost:0,
			alPrice:0
		},
		//
		reviseadr:{
			roadname:[],
			streets:[],
			name:[],
			phone:[],
			aid:'',
		},
		// 激活的修改地址页面
		activeadr:-1,
		// 选中的地址
		chooseadr:-1,
		// 当前订单值
		ordMark:0
	},
	getters: {
		// 获取当前提交的订单内的数据
		getCommitMsg:state=>{
			return state.commitMsg;
		},
		// 获取产品卡片信息
		getActiveCard:state=>{
			return state.activeCard;
		},
		// 获取激活购物车id
		getActiveCartId:state=>{
			return state.activeCartId;
		},
		// 获取当前登录用户信息
		getUser: state => {
			return state.user;
		},
		getActiveCart:state=>{
			return state.activeCart;
		},
		getReviseadr:state=>{
			return state.reviseadr;
		},
		getActiveadr:state=>{
			return state.activeadr;
		},
		getChooseAdr:state=>{
			return state.chooseadr;
		},
		getNeedCost:state=>{
			return state.needCost;
		},
		// 获取mark值
		getOrdMark(state){
			return state.ordMark;
		}
	},
  mutations: {
		// 改变待付款金额
		createNeedCost(state,price){
				state.needCost=price;
		},
		// 当前订单mark
		createMark(state,mark){
			state.ordMark=mark;
		},
		// 生成提交信息			sid:'',sname: '',			sendCost:0,alPrice: 0			proName:[],	proPrice: [],	proCount: [],
		createCommitMsg(state,msg){
				state.commitMsg.sid=msg.sid;
				state.commitMsg.sname=msg.sname;
				state.commitMsg.sendCost=msg.sendCost;
				state.commitMsg.alPrice=msg.alPrice;
				state.commitMsg.proName=msg.proName;
				state.commitMsg.proPrice=msg.proPrice;
				state.commitMsg.proCount=msg.proCount;
				state.commitMsg.proImg=msg.proImg;
		},
		// 将提交的购物车信息初始化
		initCommitMsg(state){
			state.commitMsg={
				sid: '',
				sname: '',
				proName: [],
				proPrice: [],
				proCount: [],
				proImg:[],
				sendCost: 0,
				alPrice: 0
			}
		},
		// 为当前产品卡片赋值
		updateCard(state,msg){
			state.activeCard=msg;
		},
		// 初始当前购物车信息
		initActiveCart(state,msg){
			state.activeCart.price.push(msg.price);
			state.activeCart.count.push(0);
			state.activeCart.pid.push(msg.pid);
			state.activeCart.img.push(msg.img);
			state.activeCart.pname.push(msg.pname);
		},
		// 初始当前购物车分类数量
		initActiveCartcc(state){
			state.activeCart.cateCount.push(0);
		},
		// 记录用户登录信息
    changeUser(state,user){
			user.uid?state.user.uid=user.uid:'';
			user.uname?state.user.uname=user.uname:'';
			user.ava?state.user.ava=user.ava:'';
			user.ubalance?state.user.ubalance=user.ubalance:'';
		},
		// 增加选入购物车中的商品
		changeChoosePro(state,{num,ord,n}){
			if(state.activeCart.count[ord]<1&&num<1){
        return;
      }
			state.activeCart.count.splice(ord,1,state.activeCart.count[ord]+num);
			// 更改购物车商品数量
			num>0?state.activeCart.alCount++:state.activeCart.alCount--;
			// 更改购物车中的总价格，排除计算误差
			state.activeCart.alPrice=	parseFloat((state.activeCart.alPrice+num*state.activeCart.price[ord]).toFixed(2));
			// console.log(typeof state.activeCart.alPrice);
			// 更改当前购物车每个分类中的数量
			num > 0 ? state.activeCart.cateCount[n]++ : state.activeCart.cateCount[n]--;
		},
		changeadr(state,adr){
			state.reviseadr.name.push(adr.name);
			state.reviseadr.roadname.push(adr.roadname);
			state.reviseadr.streets.push(adr.streets);
			state.reviseadr.phone.push(adr.phone);
			state.reviseadr.aid.push(adr.aid)
		},
		initadr(state){
			state.reviseadr={roadname:[],streets:[],name:[],phone:[],aid:[]}
		},
		changeAadr(state,i){
			state.activeadr=i
		},
		newttt(state,msg){
			state.activeadr=msg
		},
		// 更改选择使用的地址
		changeCAdr(state, i) {
			state.chooseadr = i
		},
	},
  actions: {
		
  }
})
