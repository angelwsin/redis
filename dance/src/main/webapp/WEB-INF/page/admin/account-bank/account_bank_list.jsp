<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form>
		<x:text property="bank.user.username" label="用户名" />
		<x:select property="bank.bank" metaType="bank" label="银行" headerLabel="全部"/>
		<input type="submit" value="查询" >
	</form>
</div>
<table class="ui-table">
	<caption>用户银行账户列表</caption>
	<tr class="tr-head">
		<th>用户名</th>
		<th>姓名</th>
		<th>开户银行</th>
		<th>开户所在地</th>
		<th>开户支行</th>
		<th>银行账号</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${page.list}" var="m" varStatus="v">
		<tr class="${v.count % 2 == 0? 'even' : 'odd'}">
			<td>${m.user.username}</td>
			<td>${m.user.realName}</td>
			<td>${m.bank_}</td>
			<td>${m.location}</td>
			<td>${m.branch}</td>
			<td>${m.account}</td>
			<td><a href="${root}/admin/account-bank/edit?bank.id=${m.id}">编辑</a></td>
		</tr>
	</c:forEach>
</table>
<x:page />
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>