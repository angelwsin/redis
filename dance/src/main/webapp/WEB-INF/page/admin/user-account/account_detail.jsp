<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.td-tradeMoney_,.td-totalAccount_,.td-activeAccount_,.td-frozenAccount_,.td-collectAccount_ {
	text-align: right;
	padding-right: 3px;
}
.td-tradeMoney_ {
	color: #00f;
}
</style>
<div class="search-form">
	<form>
		<x:select property="accountLog.tradeType" items="${tradeTypes}" headerLabel="全部" itemLabel="value.desc" itemValue="value.name" label="交易类别" />
		<x:text value="${accountLog.user.username}" name="accountLog.user.username" label="用户名" />
		<x:text property="beginTime" label="开始时间" formatter="date" cssClass="date" />
		<x:text property="endTime" label="结束时间" formatter="date" cssClass="date" />
		<a class="btn" href="javascript:$('form').submit();">&nbsp&nbsp查询&nbsp&nbsp</a>
	</form>
</div>
<div id="borrowVerify_table"></div>
<x:script>
	<script>
		var t = new Table("账户详情", "desc_=交易类型;username=用户名;tradeMoney_=操作金额;totalAccount_=总金额;activeAccount_=可用金额;frozenAccount_=冻结金额;collectAccount_=待收金额;addTime_=记录时间", ${page.JSONForDate});
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		t.show("#borrowVerify_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>