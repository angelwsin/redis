<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/account_bank_tab.jsp"%>
			<div class="user-content">
			<c:choose>
				<c:when test="${page.total == 0}">
				<div class="message">
					暂无充值记录，您可以点此 <a href="${root}/user-account/recharge">立即充值</a> !
				</div>
				</c:when>
			<c:otherwise>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>充值类型</th>
							<th>支付方式</th>
							<th>充值金额</th>
							<th>充值时间</th>
							<th>充值状态</th>
							<th>审核备注</th>
						</tr>
						<c:forEach items="${page.list}" var="log">
							<tr>
								<td>${log.type_}</td>
								<td>${log.channel_}</td>
								<td class="td-right">${log.money_}</td>
								<td>${log.addTime_}</td>
								<td>${log.status_}</td>
								<td>${log.verifyRemark}</td>
							</tr>
						</c:forEach>
					</table>					
				</div>
				<x:page simple="true" />
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>