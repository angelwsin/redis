<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<x:js path="jsAddress.js" />
<div class="post-form medium">
	<form action="edit" method="post">
		<x:hidden property="v.id" />
		<h2>${__title}</h2>
		<div>
			<x:text property="v.years" label="*申请年份" cssClass="short" />
		</div>
		<div>
			<x:text property="v.cost" label="*认证费用" cssClass="short" />
		</div>
		<div>
			<x:select property="v.status" metaType="enableStatus" label="*启用状态" />
		</div>
		<div class="toolbar">
			<input type="submit" value="确认提交">
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("form").v("submit", {
				"v.years" : "+int",
				"v.cost" : "money",
				"v.status" : "required"
			});
		})
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
