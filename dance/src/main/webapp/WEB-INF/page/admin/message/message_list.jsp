<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/message/list" method="get" name="messageForm">
		<input type="hidden" value="${type}" id="m.type" name="m.type" />
		<x:text property="m.title" label="标题" />
		<x:text property="beginTime" label="发送时间从" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" readonly="readonly" cssClass="date" />
		<x:select property="m.isDelete" metaType="isDelete" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a> <a class="btn" href="${root}/admin/message/add?mt.type=${type}">发送</a>
	</form>
</div>
<div id="message_table"></div>
<x:script>
	<script>
		var t = new Table("信息列表", "title=标题;content_=内容;sendTime=发送时间;isDelete_=状态", ${page.JSONForDate});
		t.rowTemplate("title", function() {
			return '<a href="${root}/admin/message/view?m.type=' + this.type + '&m.id= ' + this.id + '">' + this.title_0 + '</a>';
		});
		t.rowLink(function() {
			return this.isDelete == 0 ? "删除" : "";
		}, function() {
			return this.isDelete == 0 ? "javascript:remove('" + this.id + "','" + this.type + "')" : null;
		});
		t.rowLink("查看", function() {
			return "${root}/admin/message/view?m.type=" + this.type + "&m.id=" + this.id;
		});
		t.show("#message_table");
		function remove(id, type) {
			$.confirm("确认删除？", function() {
				$.ajaxMessage("${root}/admin/message/remove?m.type=" + type + "&m.id=" + id);
			});
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
