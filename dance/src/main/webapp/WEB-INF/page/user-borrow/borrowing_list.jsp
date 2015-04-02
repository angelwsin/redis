<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_borrowtab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标题</th>
							<th>类型</th>
							<th>金额</th>
							<th>年利率</th>
							<th>期限</th>
							<th>审核时间</th>
						</tr>
						<c:forEach items="${page.list}" var="borrow">
							<tr height="35px">
								<td>${borrow.link}</td>
								<td>${borrow.type_}</td>
								<td>${borrow.account_0}</td>
								<td>${borrow.apr_0}</td>
								<td>${borrow.borrowLimit_}</td>
								<td>${borrow.verifyTime_}</td>
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