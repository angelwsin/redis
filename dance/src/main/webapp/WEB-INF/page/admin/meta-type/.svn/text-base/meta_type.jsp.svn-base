<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form method="post">
		<x:hidden property="metaType.id" value="0" />
		<x:hidden property="metaType.typeOrder" value="0" />
		<x:hidden property="queryString" />
		<div>
			<x:text property="metaType.name" label="名称" />
		</div>
		<div>
			<x:text property="metaType.code" label="代码" />
		</div>
		<div>
			<x:radio property="metaType.status" metaType="enableStatus" value="1" label="启用状态" />
		</div>
		<div class="toolbar">
			<input type="button" onclick="submitForm()" value="提交" /><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		function submitForm() {
			var $form = $("form");
			var flag = $form.v({
				"metaType.name" : "required",
				"metaType.code" : "required"
			});
			if (flag) {
				$.ajaxMessage("${root}/admin/meta-type/edit", $form.serialize())
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
