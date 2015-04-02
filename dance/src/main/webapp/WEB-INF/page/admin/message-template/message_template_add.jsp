<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/message-template/add" method="post">
		<div>
			<x:text property="mt.name" label="模板标题" />
			<input type="hidden" value="${type}" id="mt.type" name="mt.type"/>
		</div>
		<div>
			<x:textarea property="mt.content" label="模板内容"></x:textarea>
		</div>
		<div class="toolbar button">
			<input type="submit" value="提交" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("form").v("submit", {
				"mt.name" : "required",
				"mt.content" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
