<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="zTreeStyle/zTreeStyle.css" output="true"/>
<x:js path="ztree"/>
<div>
	<div>
		<x:hidden property="role.id" />
		<h3>权限设置：${role.name}</h3>
		<div>
			<input id="checkAll" type="checkbox" value="1" > 全选
		</div>
		<div id="menuTree" class="ztree"></div>
		<div style="position: fixed;left: 700px; bottom: 20px; width: 200px; height: 50px;">
			<input id="btnOK" type="button" value="保存"> <input id="btnBack" type="button" value="返回列表">
		</div>
	</div>
</div>
<x:script>
<script type="text/javascript">
var currentNode = null, action = null;
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	check: {
		enable: true
	},
	callback: {
		onClick: function(event, treeId, treeNode, clickFlag){
			event.preventDefault();
		}
	}
};
var treeNodes = ${nodes};
$(function(){
	$.fn.zTree.init($("#menuTree"), setting, treeNodes);
	var zTreeObj = $.fn.zTree.getZTreeObj("menuTree");
	$("#btnOK").click(function(){
		var nodes = zTreeObj.getCheckedNodes();
		var args = "role.id=" + $("#role_id").val();
		for(var i in nodes){
			args += "&menuId=" + nodes[i].id;
		}
		$.ajaxMessage("${root}/admin/system/configPermission", args);
	});
	$("#btnBack").click(function(){
		history.back();		
	});
	$("#checkAll").click(function(){
		$.fn.zTree.getZTreeObj("menuTree").checkAllNodes(this.checked);
	});
});
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
