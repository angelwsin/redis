<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.ui-table td.td-action {
	width: 80px;
}
</style>
<a class="btn" href="${root}/admin/vip-fee/edit">添加费用规则</a>
<div id="vip_fee_table"></div>
<x:script>
	<script>
		var t = new Table("${__title}", "years=申请年份;cost_=认证费用;status_=认证状态", ${page.JSON});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/vip-fee/switchStatus?v.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/vip-fee/edit?v.id=" + this.id;
		});
		t.show("#vip_fee_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
