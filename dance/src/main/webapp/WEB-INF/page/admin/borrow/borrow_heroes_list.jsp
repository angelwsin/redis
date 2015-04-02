<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="ad-table">
<h2>投资英雄榜</h2>
	<c:if test="${empty totalTenderRank}">
		<div class="center">
			<tr>
				<label>当月累计投资</label>
			</tr>
		</div>
		<div class="center">
			<tr>暂无记录
			</tr>
		</div>
	</c:if>
	<c:if test="${not empty totalTenderRank}">
		<div class="center-blue">
				<label>当月累计投资排行榜</label>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr class="title">
				<td>排名</td>
				<td>姓名</td>
				<td>金额</td>
			</tr>
			<c:forEach var="tender" items="${totalTenderRank}" varStatus="status">
				<tr class="title">
					<td>No${status.count}</td>
					<td>${tender[0]}</td>
					<td>${tender[1]}元</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${not empty totalTenderRank}">
		<div class="center-blue">
				<label>当月单笔投资排行榜</label>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tbody>
			<thead>
			    <td>排名</td>
				<td>姓名</td>
				<td>金额</td>
			</thead>
			<c:forEach var="tender" items="${totalTenderRank}" varStatus="status">
				<tr height="15px">
					<td>No${status.count}</td>
					<td>${tender[0]}</td>
					<td>${tender[1]}元</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
