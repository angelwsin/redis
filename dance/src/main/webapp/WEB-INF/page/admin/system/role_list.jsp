<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<a class="btn" href="${root}/admin/system/editRole">添加权限组</a>
</div>
<div id="roleTable"></div>
<x:script>
	<script>
		var t = new Table("权限组列表", "name=权限组;roleDesc=权限组描述", ${page.JSONForDate});
		t.rowLink("编辑", function() {
			return "${root}/admin/system/editRole?role.id=" + this.id;
		});
		t.rowLink("权限设置", function() {
			return "${root}/admin/system/configPermission?role.id=" + this.id;
		});
		t.show("#roleTable");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
