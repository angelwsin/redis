<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form id="typeForm" method="post">
		<x:hidden property="type.typeId" value="0" />
		<x:hidden property="queryString" />
		<div>
			<x:select property="type.type" items="${creditTypes}" label="所属类型" itemLabel="value.desc" itemValue="value" />
		</div>
		<%-- <div>
			<x:text property="type.typeNo" maxlength="10" label="资料编号" />
		</div> --%>
		<div>
			<x:text property="type.typeName" maxlength="50" label="资料名称" />
		</div>
		<div>
			<x:select property="type.typeFormat" items="['图片文件','文本文件']" itemValue="value" label="资料格式" />
		</div>
		<div>
			<x:text property="type.typeExt" maxlength="250" label="文件后缀" />
			例如：jpg|gif|png(多个后缀以竖线|隔开)
		</div>
		<div>
			<x:text property="type.appWorkday" maxlength="4" label="审核期(天)" />
		</div>
		<div>
			<x:text property="type.point" maxlength="5" label="信用积分" />
		</div>
		<div>
			<x:text property="type.appCost" maxlength="10" label="审核费用" />
			元
		</div>
		<div>
			<x:select property="type.status" metaType="enableStatus" label="状态" />
		</div>
		<div class="toolbar">
			<input id="submit" type="button" onclick="submitForm()" value="提交" /><input type="button" value="返回" onclick="history.back()" />
		</div>
</div>
</form>
</div>
<x:script>
	<script type="text/javascript">
		function submitForm() {
			var flag = $("form").v({
				"type.type" : "required",
				"type.typeName" : "required",
				"type.typeFormat" : "required",
				"type.typeExt" : "required",
				"type.appWorkday" : "int",
				"type.point" : "int",
				"type.appCost" : "money",
				"type.status" : "required"
			});
			if (flag) {
				$.ajaxMessage("${root }/admin/credit-type/edit", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>