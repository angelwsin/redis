<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content">
				<div class="message">注意：某些资料可能需要上传多张图片(例如：身份证的正面和反面)。</div>
				<div class="user-article">
					<form action="${root}/user/uploadCreditInfo" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${type.typeId}" name="userFile.type.typeId" />
						<ul>
							<li>
								<p id="typeDesc"></p> <label>资料类型</label>：${type.typeName}<span id="typeCost" style="margin-left: 10px">(请上传【${type.typeExt}】格式的文件)</span>
							</li>
							<c:if test="${type.appCost>0}">
								<li><label>审核费用</label>：审核该资料需要支付${type.appCost_}元手续费</li>
							</c:if>
							<li><label name="files">上传资料</label>：<input type="file" name="upload" /><input type="button" value="添加上传资料" id="addFileBtn" />
								<div id="uploadFiles"></div></li>
							<li class="toolbar"><input type="button" onclick="submitForm()" value="提交" /><input type="button" value="返回" onclick="history.back()" /></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		var $uploadFiles = $("#uploadFiles");
		// 添加文件
		$("#addFileBtn").click(function() {
			var fileItemHtml = "<div><label/>：<input name='upload' type='file' /><input type='button' value='删除' name='delBtn' /></div>";
			$uploadFiles.append(fileItemHtml);
		});
		// 删除文件
		$uploadFiles.on("click", "[name='delBtn']", function() {
			var $item = $(this).parent();
			$item.remove();
		});
		v.define({
			checkFile : {
				text : function() {
					var ext = "${type.typeExt}";
					var formats = ext.split("|");
					var count = 0;
					var flag = false;
					$("[name='upload']").each(function(index, file) {
						var value = $(this).val();
						if (value) {
							value = value.toLowerCase();
							var lastPos = value.lastIndexOf(".");
							if (lastPos > -1) {
								var suffix = value.substr(lastPos + 1);
								if ($.inArray(suffix, formats) > -1) {
									count++;
									flag = true;
									return;
								}
							}
						}
						flag = false;
						$.alert("第" + (index + 1) + "个文件的格式不正确！");
						return flag;
					});
					return flag;
				}
			}
		});
		//提交表单
		function submitForm() {
			var flag = $("form").v({
				"upload" : "checkFile"
			});
			if (flag) {
				if (${type.appCost} > 0) {
					flag = confirm("上传资料需要支付审核费用：" + ${type.appCost} + "元，是否继续？");
				}
				if (flag) {
					$.post(root + "/user/checkAmountForType?typeId=${type.typeId}", function(data) {
						if (data.status == "OK") {
							$("form").submit();
						} else {
							alert(data.message);
						}
					}, "json");
				}
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
