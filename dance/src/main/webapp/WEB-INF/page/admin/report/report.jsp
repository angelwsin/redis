<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form id="form1">
		<x:text property="beginDate" id="beginDate" label="开始时间" formatter="date" readonly="readonly" cssClass="date max-now-1" />
		<x:text property="endDate" id="endDate" label="结束时间" formatter="date" readonly="readonly" cssClass="date max-now-1" />
		<input type="submit" value="查询"> <input type="hidden" name="isExport" id="isExport" /><input type="button" id="export" value="导出">
	</form>
</div>
<div>
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr class="tr-head">
			<th>序号</th>
			<c:forEach items="${title}" var="t">
				<th>${t}</th>
			</c:forEach>
		</tr>
		<c:forEach items="${page.list}" var="o" varStatus="s">
			<tr class="${s.count%2==0?'even':'odd'}">
				<td>${s.count}</td>
				<c:forEach items="${o}" var="c">
					<td>${c}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${!empty totalDesc}">
		<div class="total-stat">${totalDesc}</div>
	</c:if>
	<x:page />
</div>
<x:js path="date" />
<x:script>
	<script type="text/javascript">
		v.define("compareDate", {
			required : false,
			compare : "!this || !#endDate || this <= #endDate",
			format : "date",
			message : "{label}不能大于结束时间"
		});
		$("#form1").v("submit", {
			beginDate : "compareDate"
		});
	<%--增加合计行--%>
		var $tr = $("<tr class='even'></tr>");
		var totalArr = ${totalList};
		for (var i = 0; i < totalArr.length; i++) {
			$tr.append("<td>" + totalArr[i] + "</td>");
		}
		$(".ui-table").append($tr);
		$("#export").click(function() {
			$("#isExport").val("OK");
			$("#form1").submit();
			$("#isExport").val("");
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
