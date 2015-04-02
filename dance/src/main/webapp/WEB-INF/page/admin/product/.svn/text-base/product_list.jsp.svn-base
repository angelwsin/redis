<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<a class="btn" href="${root }/admin/product/edit">添加项目</a>
</div>
<div id="product_table"></div>
<x:script>
	<script>
		var t = new Table("项目列表", "name=名称;desc_=描述;status_=状态", ${page.JSON});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/product/switchStatus?product.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/product/edit?page.current=${page.current}&page.size=${page.size}&product.id=" + this.id;
		});
		t.show("#product_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>