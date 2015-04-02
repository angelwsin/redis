<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form medium">
	<form method="post" id="ajaxForm">
		<x:hidden property="meta.id" id="metaId" value="0" />
		<x:hidden property="queryString" />
		<div>
			<x:select property="meta.metaType.id" id="metaType" items="${metaTypes}" itemValue="value.id" itemLabel="value.name" label="所属类型" />
		</div>
		<div>
			<x:text property="meta.value" id="value" label="代码值" />
		</div>
		<div>
			<x:text property="meta.label" label="标签文本" escape="true" />
		</div>
		<div>
			<x:text property="meta.metaOrder" label="顺序" />
		</div>
		<div>
			<x:text property="meta.group" label="所属群组" />
		</div>
		<div>
			<x:radio property="meta.status" metaType="enableStatus" value="1" label="状态" />
		</div>
		<div class="toolbar">
			<input type="button" onclick="submitForm()" value="提交" /> <input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		function submitForm() {
			var flag = $("form").v({
				"meta.value" : "required",
				"meta.label" : "required"
			});
			if (flag) {
				$.ajaxMessage("${root}/admin/meta/edit", $("#ajaxForm").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
