<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/user-file/list" method="get">
		<x:text property="u.username" label="用户名" />
		<x:text property="beginTime" label="上传时间从" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" readonly="readonly" cssClass="date" />
		<x:hidden property="type" />
		<a class="btn" href="javascript:void(0);" onclick="javascript:$('form').submit();">查询</a>
	</form>
</div>
<div id="user_file_table"></div>
<c:if test="${not empty infoUrl}">
	<div class="toolbar">
		<input type="button" value="返回" onclick="history.back()">
	</div>
</c:if>
<x:script>
	<script>
		var t = new Table("${__title}", "user=上传用户;typeName=类型名称;point=积分;appCost=审核费用;uploadTime=上传时间;status_=状态;remark=上传备注", ${page.JSONForDateTime});
		t.rowTemplate("user", function() {
			return this.user.username;
		});
		t.rowTemplate("typeName", function() {
			return this.type.typeName;
		});
		t.rowTemplate("point", function() {
			return this.type.point;
		});
		t.rowTemplate("appCost", function() {
			return this.type.appCost_;
		});
		t.rowLink(function() {
			return this.status == 0 ? "审核" : "查看";
		}, function() {
			return "${root}/admin/user-file/verify?queryString=${queryString}&uf.id=" + this.id;
		});
		t.rowLink("删除", function() {
			return "javascript:remove('" + this.id + "','" + this.user.id + "')";
		});
		t.show("#user_file_table");
		function remove(id, userId) {
			$.confirm("确认删除？", function() {
				$.ajaxMessage("${root}/admin/user-file/remove?type=${type}&uf.id=" + id + "&uf.user.id=" + userId);
			});
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
