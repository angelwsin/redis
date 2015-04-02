<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/admin-log/" method="get">
		<label>操作类型</label>： <select name="log.opType">
			<option value="-1">全部</option>
			<c:forEach var="o" items="${opType}">
				<c:if test="${not empty o.desc}">
					<option value="${o}" <c:if test="${log.opType==o}">selected="selected"</c:if>>${o.desc}</option>
				</c:if>
			</c:forEach>
		</select> <label>关联类型</label>： <select name="log.assocType">
			<option value="-1">全部</option>
			<c:forEach var="a" items="${assocType}">
				<c:if test="${not empty a.desc}">
					<option value="${a}" <c:if test="${log.assocType==a}">selected="selected"</c:if>>${a.desc}</option>
				</c:if>
			</c:forEach>
		</select>
		<x:text property="beginDate" label="开始时间" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endDate" label="结束时间" formatter="date" readonly="readonly" cssClass="date" />
		<x:hidden property="type" />
		<a class="btn" href="javascript:void(0);" onclick="javascript:$('form').submit();">查询</a>
	</form>
</div>
<div id="admin_log_table">
	<table class="ui-table">
		<caption>管理员日志</caption>
		<tr class="tr-head">
			<th>序号</th>
			<th>操作用户</th>
			<th>操作类型</th>
			<th>关联类型</th>
			<th>备注</th>
			<th>操作时间</th>
		</tr>
		<c:forEach items="${page.list}" var="log" varStatus="v">
			<tr class="${v.count%2==0?'even':'odd'}">
				<td>${v.count}</td>
				<td>${log.user.username}</td>
				<td>${log.opType.desc}</td>
				<td>${log.assocType.desc}</td>
				<td>${log.remark}</td>
				<td>${log.addTime_}</td>
			</tr>
		</c:forEach>
	</table>
	<x:page />
</div>
<x:js path="date" />
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
