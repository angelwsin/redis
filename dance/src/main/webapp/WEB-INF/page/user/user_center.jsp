<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<div class="user-right-info">
				<div class="user-right-info-title"><h2>我的个人信息</h2><span>修改个人信息</span></div>
				<div class="user-right-info-wrap">
					<div class="user-info-left"><img src="${root}/public/upload/image/touxing.png" /></div>
					<div class="user-info-mid">
						<ul>
							<li><dl><strong>${user.username}</strong>欢迎你!</dl><dl>信用等级：</dl><dl><img class="level-icon" src="${center['levelIcon']}" /></dl></li>
							<li>用户类型：<strong class="cblue">${user.vip ? 'VIP':'普通'}会员</strong></li>
							<li><dl>注册时间：${user.addTime_}</dl><dl>最后登录时间：${center['loginTime']}</dl></li>
							<li><dl>个人统计：<strong class="cred">${center['borrowCount']}</strong>条借款记录</dl><dl><strong class="cred">${center['tenderSum']}</strong>条投标记录</dl></li>
						</ul>
					</div>
					<div class="user-info-right">
					<h3>快捷通道</h3>
						<ul>
							<li><em class="user-info-right-1"></em><a href="${root}/user-account/recharge">账户充值</a></li>
							<li><em class="user-info-right-2"></em><a href="${root}/user-account/cash">申请提现</a></li>
							<li><em class="user-info-right-3"></em><a href="${root}/user-borrow/tenderList?b.status=3">投资记录</a></li>
							<li><em class="user-info-right-4"></em><a href="${root}/user-borrow/borrowList?b.status=1">借款统计</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="user-right-stat">
				<ul>
					<li>可用余额：<em>${user.account.activeAccount_0}</em></li>
					<li><a href="${root}/user-account/recharge"><div class="deepred">充值</div></a><a href="${root}/user-account/cash"><div class="bice">提现</div></a></li>
					<li>待收款金额：<em>${center['collAccount']}</em></li>
				</ul>
			</div>
			<div class="user-right-content">
				<ul>
					<li><dl>净赚利息：
						</dl>
						<dt>${center['gainInterest']}</dt></li>
					<li><dl>冻结金额：
						</dl>
						<dt>${user.account.frozenAccount_0}</dt></li>
					<li><dl>投标奖励：
						</dl>
						<dt>${center['tenderAward']}</dt></li>
					<li><dl>推荐奖励：
						</dl>
						<dt>${center['recommendAward']}</dt></li>
					<li><dl>待收总额：
						</dl>
						<dt>${center['collAccount']}</dt></li>
					<li><dl>待收利息：
						</dl>
						<dt>${center['collInterest']}<a href="${root}/user-borrow/collectionList?bc.status=0">待收明细</a>
						</dt></li>
					<li><dl>积分等级：
						</dl>
						<dt>
							<img src="${center['levelIcon']}" width="25" height="25" />
						</dt></li>
					<li><dl>可用积分：
						</dl>
						<dt>${center['activePoint']}<a href="${root}/user/pointLog">积分日志</a>
						</dt></li>
					<li><dl>待还总额：
						</dl>
						<dt>${center['repayAccount']}<a href="${root}/user-borrow/borrowList?b.status=3">还款明细</a>
						</dt></li>
					<li><dl>最近还款金额：
						</dl>
						<dt>${center['lateRepayAccount']}</dt></li>
					<li><dl>借款额度：
						</dl>
						<dt>${user.userAmount.totalAmount_}</dt></li>
					<li><dl>剩余额度：
						</dl>
						<dt>${user.userAmount.activeAmount_}</dt></li>
					<li><dl>最近收款日期：
						</dl>
						<dt>${center['collDate']}</dt></li>
					<li><dl>最近还款日期：
						</dl>
						<dt>${center['repayDate']}</dt></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>