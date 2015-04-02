<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>待收明细</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<div class="ds_list">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="20%" class="title">标题</td>
				<td width="30%" class="title">金额</td>
				<td width="20%" class="title">利息</td>
				<td width="30%" class="title">时间</td>
			</tr>
			<c:forEach items="${page.list}" var="bc">
				<tr>
					<td>${bc.borrow.link}</td>
					<td>${bc.repaymentAccount_0}</td>
					<td>${bc.repaymentInterest_0}</td>
					<td>${bc.repaymentTime_}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section> 
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>