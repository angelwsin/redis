<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form>
		<x:text property="b.title" label="标题" />
		<c:if test="${b.type!=10}">
			<x:select property="b.type" metaType="borrowType" group="ordinary" headerLabel="全部" label="借款类型" />
		</c:if>
		<c:choose>
			<c:when test="${b.status<0}">
				<x:select property="b.status" metaType="failBorrowStatus" headerLabel="全部" headerValue="-4" label="状态" />				
			</c:when>
			<c:otherwise>
				<x:hidden name="b.status" value="${b.status}" />				
			</c:otherwise>
		</c:choose>
		<x:select property="b.style" metaType="borrowStyle" headerLabel="全部" headerValue="-1" label="还款方式" />
		<input type="submit" value="查询">
	</form>
</div>
<div id="borrowVerify_table"></div>
<x:script>
	<script>
		var status = "${b.status}";
		var t = new Table("${__title}", "username=借款人;title=借款标题;account_=借款金额;accountYes_=实际招标金额;type_=借款类型;status_=状态", ${page.JSON});
		t.rowTemplate("title", function() {
			return '<a  target="_blank" href="${root}/borrow/detail?b.id=' + this.id + '">' + this.title + '</a>';
		});
		if (status == 2) {
			t.rowLink("审核", function() {
				return "${root}/admin/borrow/examine?type=review&b.id=" + this.id;
			});
		} else if (status == 1) {
			t.rowLink("撤标", function() {
				return this.type != 5 ? "javascript:cancelBorrow(" + this.id + ")" : null;
			});
		}
		if(status != -4){
			t.rowLink("详情", function() {
				return "${root}/admin/borrow/detail?b.id=" + this.id;
			});	
		}
		t.rowTemplate("username", function() {
			return this.user.username;
		});
		function cancelBorrow(id) {
			confirm("确定要撤标?") && $.ajaxMessage("${root}/admin/borrow/cancel?b.id=" + id);
		};
		t.show("#borrowVerify_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
