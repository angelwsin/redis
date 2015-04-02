<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>我的钱包</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<div class="name">您好，${user.username}</div>
	<div class="member">
		<ul>
			<li>投资金额
				<p>
					<font class="fc3"><x:out property="tenderMoney" formatter="money" />元</font>
				</p>
			</li>
			<li>可用金额
				<p>
					<font class="fc3">${user.account.activeAccount_0}</font>
				</p>
			</li>
			<li>待收金额
				<p>
					<font class="fc3">${center['collAccount']}</font>
				</p>
			</li>
			<li>待收利息
				<p>
					<font class="fc3">${center['collInterest']}</font>
				</p>
			</li>
			<li>用户积分
				<p>
					<font class="fc3">${center['activePoint']}</font>
				</p>
			</li>
			<li>最近还款
				<p>${center['lateRepayAccount']}</p>
			</li>
		</ul>
	</div>
	<div class="login-wrap blue tj">
		<a href="${root}/mobile/cash">提现</a>
	</div>
	<div class="member_list">
		<ul>
			<li><a href="${root}/mobile/collectionList?bc.status=0"><i class="ds_detail">待收明细</i><span class="next"></span></a></li>
			<li><a href="${root}/mobile/updatePsd"><i class="password">修改密码</i><span class="next"></span></a></li>
			<li><a href="${root}/mobile/loginOut"><i class="exit">安全退出</i><span class="next"></span></a></li>
		</ul>
	</div>
</section>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>