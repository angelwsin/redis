<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<x:js path="date" />
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<div class="user-title">资金明细</div>
			<div class="search-form account-detail">
				<form>
					<x:select property="accountLog.tradeType" items="${tradeTypes}" headerLabel="全部" itemLabel="value.desc" itemValue="value.name" label="交易类别" />
					<x:text property="beginTime" label="交易时间从" formatter="date" cssClass="date" />
					<x:text property="endTime" label="到" formatter="date" cssClass="date" />
					<input type="submit" value="查询">
				</form>
			</div>
			<div class="user-table">
				<table class="table">
					<tr>
						<th>类型</th>
						<th>操作金额</th>
						<th>总金额</th>
						<th>可用金额</th>
						<th>冻结金额</th>
						<th>待收金额</th>
						<th>记录时间</th>
					</tr>
					<c:forEach var="accountLog" items="${page.list}" varStatus="status">
						<tr>
							<td>${accountLog.tradeType.desc}</td>
							<td class="align-right highlight">${accountLog.tradeMoney_}</td>
							<td>${accountLog.totalAccount_}</td>
							<td>${accountLog.activeAccount_}</td>
							<td>${accountLog.frozenAccount_}</td>
							<td>${accountLog.collectAccount_}</td>
							<td>${accountLog.addTime_}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<x:page simple="true" />
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>