<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form"></div>
<div id="content_table"></div>
<input type="button" value="返回" onclick="history.back()" />
<x:script>
	<script>
		var t = new Table("认证资料", "id=编号;metaName=类型;content=描述;addTime=上传时间", ${page.JSONForDate});
		t.rowLink(function() {
			return this.fstatus == 1 ? "已通过" : "审核";
		}, function() {
			return "${root}/admin/credentials/verify?id=" + this.id;
		});
		t.show("#content_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
