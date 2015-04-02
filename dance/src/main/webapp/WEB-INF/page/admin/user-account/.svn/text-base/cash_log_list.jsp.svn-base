<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form>
		<x:text property="cashLog.user.username" label="用户名" />
		<x:select property="cashLog.status" metaType="cashStatus" headerLabel="全部" headerValue="3" label="状态" />
		<x:text property="beginTime" label="申请时间从" formatter="date" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" cssClass="date" />
		<input type="submit" value="查询" >
	</form>
</div>
<div id="borrowVerify_table"></div>
<x:script>
	<script>
		var t = new Table("提现审核列表", "user.username=申请人;applyMoney_=提现金额;actualMoney_=到账金额;fee_=手续费;addTime_=提现申请时间;verifyUser=初审人;reviewUser=复审人;verifyTime=初审时间;reviewTime=复审时间;remark_=审核备注;status_=提现状态", ${page.JSONForDate});
		t.rowTemplate("user.username", function() {
			return this.user.username;
		});
		t.rowTemplate("verifyUser", function() {
			return this.verifyUser && this.verifyUser.username || "";
		});
		t.rowTemplate("reviewUser", function() {
			return this.reviewUser && this.reviewUser.username || "";
		});
		t.rowLink("审核", function() {
			if (this.status == 0) {
				return "${root}/admin/user-account/cashlogExamine?cashLog.id=" + this.id + "&mode=edit";
			}
		});
		t.rowLink("到账", function() {
			if (this.status == 1) {
				return "${root}/admin/user-account/cashlogExamine?cashLog.id=" + this.id + "&mode=edit";
			}
		});
		t.show("#borrowVerify_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
