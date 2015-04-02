<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="ad-table">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>借款标标题：${b.title}</td>
			<td>标的类型：${b.type_}</td>
			<td>期限: ${b.borrowLimit_}</td>
			<td>借款金额：${b.account_}元</td>
			<td>年利率：${b.apr_0}</td>
			<td>还款方式：${b.style_}</td>
		</tr>
		<tr>
			<td>最小投金额：${b.minAccount_0}</td>
			<td>最大投金额：${b.maxAccount_0}</td>
			<td>是否奖励：${b.award_0}</td>
			<td>计息方式：${b.interestMethod_}</td>
			<td>是否定向标：${b.dxbPwd_}</td>
			<td>状态：<span>${b.status_}</span></td>
		</tr>
		<c:if test="${b.type==5}">
			<tr>
				<td colspan="6">流转期限： ${b.validTime}个月</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="6">用途：${b.use_}</td>
		</tr>
		<tr>
			<td colspan="6">内容：${b.summary_}</td>
		</tr>
		<tr>
			<td colspan="6">介绍：${b.projectIntro_}</td>
		</tr>
		<tr>
			<td colspan="6">还款来源：${b.repaySource}</td>
		</tr>
		<tr>
			<td colspan="6">风控措施：${b.riskControl_}</td>
		</tr>
	</table>
	<div class="center">
		<tr>投标记录
		</tr>
	</div>
	<c:if test="${empty borrowTenders}">
		<div class="center">
			<tr>暂无投标记录
			</tr>
		</div>
	</c:if>
	<c:if test="${not empty borrowTenders}">
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr class="title">
				<td>投资人</td>
				<td>年利率</td>
				<td>投标金额</td>
				<td>投标时间</td>
			</tr>
			<c:forEach items="${borrowTenders}" var="borrowTender">
				<tr class="title">
					<td>${borrowTender.user.username}</td>
					<td>${borrowTender.borrow.apr_0}</td>
					<td>${borrowTender.tenderAccount_0}</td>
					<td>${borrowTender.addTime_0}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${not empty repayments}">
		<div class="center">
			<tr>
				<c:if test="${b.status==4}">还款详情</c:if>
				<c:if test="${b.status==3}">回款计划</c:if>
			</tr>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tbody>
			<thead>
				<td>标题</td>
				<td>类型</td>
				<td>年利率</td>
				<td>期限</td>
				<td>期数</td>
				<td>待还总额</td>
				<td>待还利息</td>
				<td>状态</td>
				<td>还款时间</td>
			</thead>
			<c:forEach items="${repayments}" var="repayments">
				<tr height="15px">
					<td>${repayments.borrow.title}</td>
					<td>${repayments.borrow.type_}</td>
					<td>${repayments.borrow.apr_}</td>
					<td>${repayments.borrow.borrowLimit_}</td>
					<td>${repayments.period_}</td>
					<td>${repayments.repaymentAccount_}</td>
					<td>${repayments.repaymentInterest_}</td>
					<td>${repayments.status_}</td>
					<td>${repayments.repaymentTime_}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
