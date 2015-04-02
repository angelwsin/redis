<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.ui-table td.td-action {
	width: 80px;
}
</style>
<div id="vip_fee_table"></div>
<x:script>
	<script>
		var t = new Table("${__title}", "username=用户名;years=申请年份;cost_=认证费用;addTime=申请时间;verifyUser=审核人;verifyTime=审核时间;verifyRemark=审核备注;status_=状态", ${page.JSONForDate});
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		t.rowTemplate("verifyUser", function() {
			return this.verifyUser == null ? null : this.verifyUser.username;
		});
		t.rowLink(function() {
			return this.status == 0 ? "审核" : "";
		}, function() {
			return this.status == 0 ? "${root}/admin/vip-apply/verify?v.id=" + this.id : null;
		});
		t.rowLink("查看", function() {
			return "${root}/admin/vip-apply/view?v.id=" + this.id;
		}), t.show("#vip_fee_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>