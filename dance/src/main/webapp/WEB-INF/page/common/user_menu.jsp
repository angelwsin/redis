<%@ page language="java" pageEncoding="UTF-8"%>
<x:css path="layout.css" output="true" />
<x:js path="tab.js" />
<div class="user-left">
	<h3>基本信息</h3>
	<ul>
		<li><a href="${root}/user/edit">填写个人资料</a></li>
		<li><a href="${root}/user/safe">安全认证</a></li>
	</ul>
	<h3>资金管理</h3>
	<ul>
		<li><a href="${root}/user/accountInfo">账户详情</a></li>
		<li><a href="${root}/user/bank">银行账户</a></li>
		<li><a href="${root}/user/accountDetail">资金明细</a></li>
	</ul>
	<h3>投资管理</h3>
	<ul>
		<li><a href="${root}/user-borrow/tenderList?b.status=3">已投资的借款</a></li>
		<li><a href="${root}/user-borrow/tenderList?b.status=-4">失败的投资借款</a></li>
		<li><a href="${root}/user-borrow/collectionList?bc.status=0">未收款明细</a></li>
		<li><a href="${root}/user-borrow/collectionList?bc.status=1">已收款明细</a></li>
		<li><a href="${root}/user-borrow/autoTenderList">自动投标设置</a></li>
		<!--  <li><a href="${root}/user-borrow/tenderList?b.type=10">我购买的债权</a></li>
		<li><a href="#">自动投标设置</a></li>
		<li><a href="#">金联宝投资明细</a></li>-->
	</ul>
	<h3>借款管理</h3>
	<ul>
		<li><a href="${root}/user-borrow/borrowList?b.status=1">正在招标的借款</a></li>
		<li><a href="${root}/user-borrow/borrowList?b.status=0">尚未发布的借款</a></li>
		<li><a href="${root}/user-borrow/borrowList?b.status=3">正在还款的借款</a></li>
		<li><a href="${root}/user-borrow/borrowList?b.status=4">已还完的借款</a></li>
		<li><a href="${root}/user-amount/apply">额度申请</a></li>
		<li><a href="${root}/user-file/add">证明材料</a></li>
	</ul>
	<h3>互动管理</h3>
	<ul>
		<li><a href="${root}/user/invite">邀请好友</a></li>
		<li><a href="${root}/leave-word/list">互动留言</a></li>
		<li><a href="${root}/message-log/list">站内信</a></li>
	</ul>
</div>