<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<input type="button" value="添加费用类型" onclick="location.href='${root}/admin/manage-fee/edit'" />
</div>
<div id="manage_fee_table"></div>
<x:script>
	<script>
		var t = new Table("费用类型列表", "name=名称;desc=扣费规则;beginTime=生效开始时间;endTime=生效结束时间;status_=状态",
				${page.JSONForDateTime});
		t.rowLink("编辑", function() {
			return "${root}/admin/manage-fee/edit?fee.id=" + this.id;
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/manage-fee/switchStatus?fee.id=" + this.id;
		});
		t.show("#manage_fee_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
