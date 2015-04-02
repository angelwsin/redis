<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/message-template/edit" method="post">
		<div>
			<x:hidden property="mt.id" />
			<x:hidden property="mt.type" />
			<x:text property="mt.name" label="模板标题" />
		</div>
		<div>
			<x:textarea property="mt.content" label="模板内容" />
		</div>
		<x:ifMode excludes="view">
			<div>
				<label>模板创建人</label> ${mt.addUser.username }
			</div>
			<div>
				<label>创建时间</label> ${ mt.addTime_}
			</div>
			<div class="toolbar button">
				<input type="submit" value="修改" />
			</div>
		</x:ifMode>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("form").v("submit", {
				"mt.name" : "required",
				"mt.content" : "required"
			});
		})
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
