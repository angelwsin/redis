<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<a class="btn" href="${root }/admin/institution/edit">添加担保机构</a>
</div>
<div id="credit_level_table"></div>
<x:script>
	<script>
		var t = new Table("担保机构列表", "name=名称;desc_=描述;status_=状态", ${page.JSON});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/institution/switchStatus?institution.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/institution/edit?page.current=${page.current}&page.size=${page.size}&institution.id=" + this.id;
		});
		t.show("#credit_level_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
