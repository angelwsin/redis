<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="zTreeStyle/zTreeStyle.css" output="true"/>
<x:js path="ztree"/>
<div>
	<div>
		<input id="btnAddChild" type="button" value="添加子菜单">
	</div>
	<div>
		<div id="menuTree" class="ztree" style="width: 400px; float: left;">
		</div>
		<div id="menuWrapper" class="post-form medium" style="margin-left: 410px;display: none;">
			<form id="menuForm">
				<h3 id="tips" style="margin-left: 40px;">编辑菜单</h3>
				<div id="editMenu">
					<div> <label>菜单名称</label>：<x:text property="menu.name" /><x:hidden property="menu.id" /></div>
					<div> <label>菜单URL</label>：<x:text property="menu.url" /> </div>
					<div> <label>菜单权限码</label>：<x:text property="menu.permissionCode" /> </div>
				</div>
				<div id="addChildMenu" style="display: none;"><label>子菜单</label>：<select id="subMenuId">
				<option value="">==请选择==</option>
				<c:forEach items="${otherMenus}" var="m">
					<option value="${m.id}">${m.name} -- ${m.permissionCode}</option>				
				</c:forEach>
				</select></div>
				<div> <label>菜单状态</label>：<input name="menu.status" type="radio" value="2" checked="checked">启用	<input name="menu.status" type="radio" value="3">启用并停靠菜单 </div>
				<div class="toolbar"> <input id="btnOK" type="button" value="确定" > <input id="btnCancel" type="button" value="取消" > </div>
			</form>
		</div>
	</div>
</div>
<x:script>
<script type="text/javascript">
var currentNode = null, action = null, actionURL = "${root}/admin/system/configMenu";
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onClick: function(event, treeId, treeNode, clickFlag){
			currentNode = treeNode;
			event.preventDefault();
			setForm(treeNode)
			setTips("编辑菜单：" + treeNode.name);
			action = "edit";
			$("#addChildMenu").hide();
			$("#editMenu").show();
		},
		beforeRemove: function(treeId, treeNode){
			if(treeNode.level < 2){
				$.alert("只有三级菜单才能被删除！");
				return false;						
			}
		},
		onRemove: function(event, treeId, treeNode){
			$.ajaxMessage(actionURL + "?action=remove", "menu.id=" + treeNode.id, function(json){
				if(json.status == "OK"){
					$.fn.zTree.getZTreeObj(treeId).removeNode(treeNode);
					$("#subMenuId").append('<option value="' + treeNode.id + '">' + treeNode.name + ' -- ' + treeNode.permissionCode + '</option>');
					$.alert("操作成功！");
				}
			});
		},
		beforeDrag: function(treeId, treeNodes){ // 拖拽之前
			for(var i in treeNodes){
				if(treeNodes[i].level < 2){
					return false;					
				}
			}
		},
		beforeDrop: function(treeId, treeNodes, targetNode, moveType, isCopy){ // 拖拽结束
			if(moveType == "inner" || isCopy || targetNode.level < 2){
				return false;
			}
			var targetParentNodeId = targetNode.getParentNode().id;
			for(var i in treeNodes){
				var node = treeNodes[i];
				if(node.level < 2 || node.getParentNode().id != targetParentNodeId){
					return false;
				}
			}			
		},
		onDrop: function(event, treeId, treeNodes, targetNode, moveType){
			var siblings = targetNode.getParentNode().children;
			var args = "?action=move&chain=";
			for(var i in siblings){
				var node = siblings[i];
				args += node.id + "_";
			}
			$.ajaxMessage(actionURL + args);			
		}
	},
	edit: {
		enable: true,
		showRenameBtn: false,
		removeTitle: "删除",
		drag: {
			autoExpandTrigger: false,
			isCopy: false,
			inner: false
		}
	}
};
var treeNodes = ${nodes};
function setTips(msg){
	$("#tips").html(msg);	
};
function setForm(node){
	$("#menu_id").val(node.id);	
	$("#menu_name").val(node.name);
	$("#menu_url").val(node.url);
	$("#menu_permissionCode").val(node.permissionCode);
	$("[name='menu.status'][value=" + node.status + "]").prop("checked", true);
	$("#menuWrapper").show();
}
$(function(){
	$.fn.zTree.init($("#menuTree"), setting, treeNodes);
	$("#btnAddChild").click(function(){
		if(!currentNode){
			$.alert("请先选中对应的菜单！");
			return false;
		}else if(currentNode.level != 1){
			$.alert("只有二级菜单才能添加子菜单！");
			return false;						
		}
		setTips("添加子菜单：" + currentNode.name);
		action = "add";
		$("#addChildMenu").show();
		$("#editMenu").hide();
	});
	$("#btnCancel").click(function(){
		$("#menuWrapper").hide();		
	});
	$("#btnOK").click(function(){
		var args = null;
		if(action == "add"){
			var id = $("#subMenuId").val();
			if(!id){
				alert("请先选择对应的子菜单！");
				return false;
			}
			var menuStatus = $("[name='menu.status']:checked").val();
			if(!menuStatus) menuStatus = 2;
			args = "menu.id=" + id + "&menu.parentMenu.id=" + currentNode.id + "&menu.menuOrder=" + (currentNode.children && (currentNode.children.length + 1) || 1) + "&menu.status=" + menuStatus;
		}else if(action == "edit"){
			args = $("#menuForm").serialize();
		}
		$.ajaxMessage(actionURL + "?action=" + action, args, function(json){
			if(json.status == "OK"){
				var zTreeObj = $.fn.zTree.getZTreeObj("menuTree");
				if(action == "add"){
					zTreeObj.addNodes(currentNode, json.menu);
					$("#subMenuId option[value=" + json.menu.id + "]").remove();
				}else{
					currentNode.name = json.menu.name;
					currentNode.url = json.menu.url;
					currentNode.permissionCode = json.menu.permissionCode;
					currentNode.status = json.menu.status;
					zTreeObj.updateNode(currentNode);
				}
				$.alert("操作成功！");
			}			
		});
	});
});
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
