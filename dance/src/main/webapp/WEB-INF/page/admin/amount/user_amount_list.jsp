<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.td-oldAmount_,.td-applyAmount_,.td-newAmount_ {
	text-align: right;
	padding-right: 3px;
}
</style>
<div class="search-form">
	<form action="${root}/admin/amount/list" method="get" name="userForm">
		<x:text property="minAmount" placeholder="最小额度" label="借款额度范围"/>&nbsp;&nbsp;
		<x:text property="maxAmount" placeholder="最大额度"/>
		<x:text property="beginTime" label="申请时间从" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" readonly="readonly" cssClass="date" />
		<a class="btn" href="javascript:$('form').submit();">查询</a>
	</form>
</div>
<div id="user_table"></div>
<x:script>
	<script>
		var t = new Table("额度申请列表", "user.username=申请人;oldAmount_=原来额度;applyAmount_=申请额度;newAmount_=新的额度;addTime=申请时间;applyRemark=申请备注;verifyRemark=审核备注;status_=状态", ${page.JSONForDate});
		t.rowTemplate("user.username", function() {
			return this.user.username;
		});
		t.rowLink(function() {
			return this.status == 0 ? "审核" : "";
		}, function() {
			return this.status == 0 ? "${root}/admin/amount/verify?uaa.id=" + this.id + "&&uaa.applyAmount=" + this.applyAmount : null;
		});
		t.show("#user_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
