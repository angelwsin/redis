<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form long">
	<form method="post">
		<div>
			<x:text property="m.title" label="${mType}标题" maxlength="20" />
			<input type="hidden" value="${mt.type}" id="m.type" name="m.type" />
		</div>
		<div>
			<label>发送选项</label>：<input type="radio" id="sel" name="sel" value="0" checked="checked" /><label class="radioLabel">给指定人</label><input type="radio" id="sel" name="sel" value="1" /><label class="radioLabel">给所有人</label>
		</div>
		<div id="personDiv">
			<div class="toolbar">
				<span style="color: red">注：多个用户名之间使用 ","分割，例如"zhangsan,lisi,wangwu"</span>
			</div>
			<x:textarea property="persons" label="用户名" />
		</div>
		<div>
			<x:select property="mt.id" id="mtName" items="${messageTemplates}" itemLabel="value.name" itemValue="value.id" values="请选择" label="选择模板" />
		</div>
		<div class="notice" style="margin-left:115px;width:485px;">注：内容中可以使用占位符"{username}"或者"{realname}"(不含引号)来表示接收用户对应的用户名和真实姓名</div>
		<div>
			<x:textarea property="m.content" label="${mType}内容" />
		</div>
		<div class="toolbar">
			<input id="btnSend" type="button" value="确认提交">
		</div>
	</form>
</div>
<x:script>
	<script>
		$("input:radio").click(function() {
			$("#personDiv").toggle($(this).val() == 0);
		});
		$("#btnSend").click(function() {
			var flag = $("form").v({
				"m.title" : "required",
				"m.content" : "required"
			});
			if (flag) {
				$.ajaxMessage("", $("form").serialize());
			}
		});
		$("#mtName").bind("change", function() {
			$.post("${root}/admin/message/getMessageTemp", $(this).serialize(), function(data) {
				$("#m_content").val(data.mc);
			}, "json");
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>