<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<x:js path="date" />
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/account_bank_tab.jsp"%>
			<div class="user-content">
			<c:choose>
				<c:when test="${empty page || page.total == 0}">
				<div class="message">银行账号一经填写不得修改，请注意仔细核对！</div>
				</c:when>
			<c:otherwise>
				<div class="user-table">
					<table class="ui-table">
						<tr>
							<th>提现银行</th>
							<th>银行账号</th>
							<th>提现金额</th>
							<th>到账金额</th>
							<th>手续费</th>
							<th>提现时间</th>
							<th>提现状态</th>
							<th>审核备注</th>
						</tr>
						<c:forEach items="${page.list}" var="log">
							<tr>
								<td>${bank.bank_}</td>
								<td>${bank.account}</td>
								<td class="td-right">${log.applyMoney_}</td>
								<td class="td-right">${log.actualMoney_}</td>
								<td class="td-right">${log.fee_}</td>
								<td>${log.addTime_}</td>
								<td>${log.status_}</td>
								<td>${log.remark_}</td>
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