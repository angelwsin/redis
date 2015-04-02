<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form id="roleForm">
		<div><label>管理员</label>：${requestScope.user.username}</div>
		<div>
			<x:checkbox label="所属权限组" property="userRoles" extract="value.id" items="${roles}" itemLabel="value.name" itemValue="value.id" />
		</div>
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
		($("[name=userRoles]:checked").length || confirm("您确认不选中任何权限？")) && $.ajaxMessage("", $form.serialize());
	});
	$("#btnBack").click(function(){
		history.back();
	});
});
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
