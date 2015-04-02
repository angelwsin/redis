<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form id="roleForm">
		<div><x:hidden property="role.id" /><x:text property="role.name" label="权限组名称" /></div>
		<div><x:textarea property="role.roleDesc" label="权限组描述" /></div>
		<div class="toolbar">
			<input id="btnOK" type="button" value="保存" >
			<input id="btnBack" type="button" value="返回" >
		</div>
	</form>
</div>
<x:script>
<script type="text/javascript">
$(function(){
	$("#btnOK").click(function(){
		var $form = $("#roleForm");
		var flag = $form.v({
			"role.name": "required",
			"role.roleDesc": "required"
		});
		flag && $.ajaxMessage("", $form.serialize());
	});
	$("#btnBack").click(function(){
		history.back();
	});
});
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
