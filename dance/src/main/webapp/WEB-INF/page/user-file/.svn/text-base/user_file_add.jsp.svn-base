<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/credentials_tab.jsp"%>
			<div class="user-content">
				<div class="message">请上传真实个人资料,如有虚假,后果自负。</div>
				<div class="post-form">
					<form method="post" action="${root}/user-file/add" enctype="multipart/form-data">
						<ul>
							<li><x:select property="uf.type.typeId" items="${creditTypes}" headerValue="-1" itemLabel="value.typeName" itemValue="value.typeId" label="*资料类型" /> <span id="message" name="message" style="color: red"></span></li>
							<li style="overflow:hidden;">
								<dt>
									<label><em>*</em>上传资料</label>：
								</dt>
								<dt style="text-align:left;"><%@include file="/WEB-INF/page/user-file/upload.jsp"%></dt>
							</li>
							<li><x:textarea property="uf.remark" label="*备注说明" /></li>
							<div class="toolbar">
								<input type="submit" value="确认提交" class="short" />
							</div>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		$(function() {
			$("#uf_type_typeId").bind("change", function() {
				$.post("${root}/user-file/typeList", $(this).serialize(), function(data) {
					$("#message").html("手续费:" + data.tl.appCost + "元");
				}, "json");
			});
			$("form").v("submit", {
				"models[0].upload" : "file",
				"uf.remark" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>