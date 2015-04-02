<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form>
		<x:text property="username" label="投资用户" />
		<x:text property="titleName" label="借款标题" />
		<x:select property="status" metaType="borrowStatus" headerLabel="全部" label="标的状态" />
		<x:text property="beginTime" label="投标时间从" cssClass="date" formatter="date" />
		<x:text property="endTime" label="到" cssClass="date" formatter="date" />
		<input type="submit" value="查询">
	</form>
</div>
<div id="borrow_tender_table"></div>
<x:script>
	<script>
		var t = new Table("投资列表", "username=投资用户;apr=借款年利率;tenderAccount_=投标金额;status=借款状态;repaymentAccount_=应还本息;repaymentYesAccount_=已还本息;addTime=投标时间", ${page.JSONForDateTime});
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		t.rowTemplate("title", function() {
			return '<a target="_blank" href="${root}/borrow/detail?b.id=' + this.borrow.id + '">' + this.borrow.title + '</a>';
		});
		t.rowTemplate("apr", function() {
			return this.borrow.apr_0;
		});
		t.rowTemplate("status", function() {
			return this.borrow.status_;
		});
		t.show("#borrow_tender_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>