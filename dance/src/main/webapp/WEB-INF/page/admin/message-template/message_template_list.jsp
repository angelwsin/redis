<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/message-template/list" method="get" name="messageTemplateForm">
		<input type="hidden" value="${type}" id="mt.type" name="mt.type" />
		<x:text property="mt.name" label="名称" />
		<x:text property="beginTime" label="添加时间从" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" readonly="readonly" cssClass="date max-now" />
		<x:select property="mt.status" metaType="enableStatus" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a> <a class="btn" href="${root}/admin/message-template/add?mt.type=${type}">添加</a>
	</form>
</div>
<div id="message_template_table"></div>
<x:script>
	<script>
		var t = new Table("短信模板列表", "name_=模板名称;content_=短信内容;status_=状态", ${page.JSON});
		t.rowTemplate("name_", function() {
			return '<a href="${root}/admin/message-template/edit?mode=view&mt.type=' + this.type + '&mt.id= ' + this.id + '">' + this.name_ + '</a>';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/message-template/remove?mt.type=" + this.type + "&mt.id=" + this.id + "&mt.status=" + this.status;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/message-template/edit?mode=edit&mt.type=" + this.type + "&mt.id=" + this.id;
		});
		t.show("#message_template_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
