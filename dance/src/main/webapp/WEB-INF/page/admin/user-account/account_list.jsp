<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form>
		<x:text property="account.user.username" label="用户名" />
		<input type="submit" value="查询" >
	</form>
</div>
<table class="ui-table">
	<caption>用户账户列表</caption>
	<tr class="tr-head">
		<th>用户名</th>
		<th>真实姓名</th>
		<th>账户总额</th>
		<th>可用余额</th>
		<th>冻结余额</th>
		<th>待收余额</th>
		<th>账户体验金总额</th>
		<th>体验金可用余额</th>
		<th>体验金冻结余额</th>
		<th>体验金待收余额</th>
	</tr>
	<c:forEach items="${page.list}" var="m" varStatus="v">
		<tr class="${v.count % 2 == 0? 'even' : 'odd'}">
			<td>${m.user.username}</td>
			<td>${m.user.realName}</td>
			<td class="td-right">${m.user.account.totalAccount_}</td>
			<td class="td-right">${m.user.account.activeAccount_}</td>
			<td class="td-right">${m.user.account.frozenAccount_}</td>
			<td class="td-right">${m.user.account.collectAccount_}</td>
			<td class="td-right">${m.user.account.totalAccountExp_}</td>
			<td class="td-right">${m.user.account.activeAccountExp_}</td>
			<td class="td-right">${m.user.account.frozenAccountExp_}</td>
			<td class="td-right">${m.user.account.collectAccountExp_}</td>
		</tr>
	</c:forEach>
</table>
<x:page />
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>