<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form>
		<x:hidden property="b.status" />
		<x:text property="b.title" label="标题" />
		<c:if test="${b.type!=10}">
			<x:select property="b.type" metaType="borrowType" group="ordinary" headerLabel="全部" label="借款类型" />
		</c:if>
		<x:select property="b.style" metaType="borrowStyle" headerLabel="全部" headerValue="-1" label="还款方式" />
		<input type="submit" value="查询">
	</form>
</div>
<div id="borrowVerify_table"></div>
<x:script>
	<script>
		var t = new Table("初审列表", "username=借款人;title=借款标题;account_=借款金额;accountYes_=实际招标金额;type_=借款类型;status_=状态", ${page.JSON});
		t.rowTemplate("title", function() {
			return '<a target="_blank" href="${root}/borrow/detail?b.id=' + this.id + '">' + this.title + '</a>';
		});
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		t.rowLink("审核", function() {
			return "${root}/admin/borrow/examine?type=verify&b.id=" + this.id;
		});
		t.rowLink("修改", function() {
			return this.type != 10 ? "${root}/admin/borrow/edit?b.id=" + this.id : null;
		});
		t.show("#borrowVerify_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
