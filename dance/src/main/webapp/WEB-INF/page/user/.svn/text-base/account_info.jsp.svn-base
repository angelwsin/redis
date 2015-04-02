<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<div class="user-title">账户详情</div>
			<div class="user-content">
				<div class="message">
					个人资金详情
				</div>
				<div class="user-lines">
					<ul>
						<li><dl>账户总额：</dl><dt><em>${account.totalAccount_0}</em></dt></li>
						<li><dl>可用金额：</dl><dt><em>${account.activeAccount_0}</em></dt></li>
						<li><dl>冻结金额：</dl><dt><em>${account.frozenAccount_0}</em></dt></li>
						<li><dl>待收金额：</dl><dt><em>${account.collectAccount_0}</em></dt></li>
						<li><dl>充值总额：</dl><dt><em>${rechargeSum}</em></dt></li>
						<li><dl>提现总额：</dl><dt><em>${cashSum}</em></dt></li>
						<li><dl>扣费总额：</dl><dt>${feeSum}</dt></li>
						<li><dl>提现手续费：</dl><dt>${cashFeeSum}</dt></li>
						<li><dl>&nbsp;</dl><dt></dt></li>
						<li><dl>&nbsp;</dl><dt></dt></li>
						<li><dl>投标总额：</dl><dt>${tenderSum}</dt></li>
						<li><dl>已收总额：</dl><dt>${ysSum['account']}</dt></li>
						<li><dl>已收本金：</dl><dt>${ysSum['capital']}</dt></li>
						<li><dl>已收利息：</dl><dt>${ysSum['interest']}</dt></li>
						<li><dl>投标奖励总额：</dl><dt>${tbjlSum}</dt></li>
						<li><dl>推荐奖励总额：</dl><dt>${tjjlSum}</dt></li>
						<li><dl>待收总额：</dl><dt>${dsSum['account']}</dt></li>
						<li><dl>待收本金：</dl><dt>${dsSum['capital']}</dt></li>
						<li><dl>待收利息：</dl><dt>${dsSum['interest']}</dt></li>
						<li><dl>最近回款日期：</dl><dt>${zjhkDate}</dt></li>
						<li><dl>逾期收入总额：</dl><dt>${yqsrSum}</dt></li>
						<li><dl>&nbsp;</dl><dt></dt></li>
						<li><dl>&nbsp;</dl><dt></dt></li>
						<li><dl>&nbsp;</dl><dt></dt></li>
						<li><dl>借款总额：</dl><dt>${jkSum}</dt></li>
						<li><dl>已还总额：</dl><dt>${yhwhSum['yesAccount']}</dt></li>
						<li><dl>未还总额：</dl><dt>${yhwhSum['noAccount']}</dt></li>
						<li><dl>逾期利息总额：</dl><dt>${yqlxSum}</dt></li>
						<li><dl>最近还款日期：</dl><dt>${zjhkDate2}</dt></li>
						<li><dl>最近需还金额：</dl><dt>${zjxhSum}</dt></li>
					</ul>			
				</div>
				<div class="message">最近一周资金统计</div>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>日期</th>
							<th>成功借款</th>
							<th>成功还款</th>
							<th>充值</th>
							<th>投标</th>
							<th>新增待收</th>
							<th>投标奖励</th>
							<th>收到还款</th>
							<th>提现</th>
							<th>提现手续费</th>
						</tr>
						<c:forEach var="item" items="${weekDetail}">
							<tr>
								<td>${item.key}</td>
								<c:forEach var="d" items="${item.value}">
									<td>${d.value}</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>