<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_tendertab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标题</th>
							<th>类型</th>
							<th>年利率</th>
							<th>应该还款时间</th>
							<th>期数</th>
							<th>待收金额</th>
							<th>待收利息</th>
							<th>逾期天数</th>
							<th>逾期利息</th>
						</tr>
						<c:forEach items="${page.list}" var="bc">
							<tr>
								<td>${bc.borrow.link}</td>
								<td>${bc.borrow.type_}</td>
								<td>${bc.borrow.apr_0}</td>
								<td>${bc.repaymentTime_}</td>
								<td>${bc.period_}</td>
								<td>${bc.repaymentAccount_0}</td>
								<td>${bc.repaymentInterest_0}</td>
								<td>${bc.overdueDays}天</td>
								<td>${bc.overdueInterest_0}</td>
							</tr>
						</c:forEach>
					</table>					
				</div>
				<x:page simple="true" />
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>