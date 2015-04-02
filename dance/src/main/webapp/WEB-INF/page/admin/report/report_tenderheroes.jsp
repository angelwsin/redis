<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form id="form1">
		<x:text property="month" readonly="readonly" cssClass="short" label="投标月份" />
		统计类型：<select name="counttype"><option value="0">累计投资排行榜</option><option value="1" <c:if test="${coutype eq 1}">selected="selected"</c:if>>单笔投资排行榜</option></select>
		<input type="submit" value="查询"> <input type="hidden" name="isExport" id="isExport" /><input type="button" id="export" value="导出">
	</form>
</div>
<div>
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr>
			<th colspan="4">${theMonth}投资排行榜</th>
		</tr>
		<tr class="tr-head">
			<th>排名</th>
			<c:forEach items="${title}" var="t">
				<th>${t}</th>
			</c:forEach>
		</tr>
		<c:forEach items="${totalTenderRank}" var="tender" varStatus="status">
			<tr>
				<td>No ${status.count}</td>
				<td>${tender[0]}</td>
				<td><x:out property="tender[1]" formatter="money" /></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${!empty totalDesc}">
		<div class="total-stat">${totalDesc}</div>
	</c:if>
	<x:page />
</div>
<x:script>
	<script>
		$(function() {
			$("#month").focus(function() {
				WdatePicker({
					dateFmt : "yyyy-MM"
				});
			});
		});
		$("#export").click(function() {
			$("#isExport").val("OK");
			$("#form1").submit();
			$("#isExport").val("");
		});
	</script>
</x:script>

<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
