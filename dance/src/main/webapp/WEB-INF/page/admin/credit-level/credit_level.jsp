<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form long-label">
	<form action="${root}/admin/credit-level/edit" method="post" enctype="multipart/form-data">
		<x:hidden property="level.levelId" value="0" />
		<x:hidden property="level.levelDesc" />
		<x:hidden property="page.size" />
		<x:hidden property="page.current" />
		<div>
			<x:text property="level.levelName" maxlength="50" label="等级名称" />
		</div>
		<div>
			<label>等级图标</label>：<input type="file" id="file" name="model.upload" value="${level.levelIcon}" />
			<x:hidden property="level.levelIcon" />
			<c:if test="${level.levelIcon!=null}">
				<img class="level-icon" src="${level.levelIcon_}" />
			</c:if>
		</div>
		<div>
			<x:text label="最低信用积分" property="level.minPoint" />
		</div>
		<div>
			<x:select property="level.allowOverdue" metaType="yesOrNo" label="是否允许有逾期" />
		</div>
		<div>
			<x:checkbox property="level.requiredInfo" items="${types}" itemValue="value.typeName" itemLabel="value.typeName" label="必审科目" />
		</div>
		<div>
			<x:select property="level.status" metaType="enableStatus" label="状态" />
		</div>
		<div class="toolbar">
			<input id="submit" type="submit" value="提交" /><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$("#file").bind("change", function() {
			$("input[name='level.levelIcon']").val($(this).val());
		});
		$(function() {
			$("form").v("submit", {
				"level.levelName" : "required",
				"level.levelIcon" : "file",
				"level.minPoint" : "int",
				"level.allowOverdue" : "required",
				"level.status" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>