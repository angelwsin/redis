<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/user-account/rechargeList">
		<x:select property="rechargeLog.status" metaType="rechargeStatus" headerLabel="全部" label="状态" />
		<x:select property="rechargeLog.channel" metaType="channel" headerLabel="全部" label="充值扣费渠道" />
		<x:text value="${requestScope.user.username}" name="user.username" label="用户名" cssClass="short" />
		<x:text property="rechargeLog.tradeNo" label="订单号" />
		<x:text property="beginTime" label="记录时间从" formatter="date" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" cssClass="date" />
		<input type="submit" value="查询" >
	</form>
</div>
<div id="borrowVerifyTable"></div>
<x:script>
	<script>
		var t = new Table("账户充值/提现列表-审批", "username=用户名;type_=充值类型;money_=充值/扣费金额;tradeNo=订单号;addTime_=申请时间;channel_=渠道;status_=状态;remark=备注;verifyTime=审核时间;verifyRemark=审核备注", ${page.JSONForDate});
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		t.rowLink("审核", function() {
			return this.status == 0 ? "${root}/admin/user-account/examine?rechargeLog.id=" + this.id + "&mode=edit" : null;
		});
		t.show("#borrowVerifyTable");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>