<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_tendertab.jsp"%>
			<div class="user-content">
				<div class="message">
					投资总额：${AccountTender}
				</div>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标题</th>
							<th>投标金额</th>
							<th>投标时间</th>
							<th>年利率</th>
							<th>状态</th>
							<th>期限</th>
						</tr>
						<c:forEach items="${page.list}" var="borrowTender">
							<tr>
								<td>${borrowTender.borrow.link}</td>
								<td>${borrowTender.tenderAccount_0}</td>
								<td>${borrowTender.addTime_}</td>
								<td>${borrowTender.borrow.apr_0}</td>
								<td>${borrowTender.borrow.status_}</td>
								<td>${borrowTender.borrow.borrowLimit_}</td>
							</tr>
						</c:forEach>
					</table>			
				</div>
				<x:page simple="true" />
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>