<%@ page language="java" pageEncoding="UTF-8"%>
<div id="uploadFilePanel">
		<input id="addFileBtn" type="button" value="添加" />
	<div id="uploadFiles">
		<div>
			<input name="models[0].upload" type="file" /> <input class="btn-remove" type="button" id="btn" value="删除">
		</div>
	</div>
</div>
<x:script>
	<script>
		var fileSize = 1;
		var fileInputName = "models[index].upload";
		// 获取文件上传的input的name属性值
		function getInputName(index) {
			return fileInputName.replace("index", index);
		};
		// 验证
		function isValidFiles(format, minCount) {
			format = format || "jpg,gif,jpeg,png";
			minCount = minCount || 0;
			var formats = format.split(",");
			var count = 0, alreadyAlert = false;
			$("#uploadFiles :file").each(function(i) {
				var $me = $(this);
				var value = $me.val();
				if (value) {
					value = value.toLowerCase();
					var lastPos = value.lastIndexOf(".");
					if (lastPos > -1) {
						var suffix = value.substr(lastPos + 1);
						if ($.inArray(suffix, formats) > -1) {
							count++;
							return;
						}
					}
					alert("第" + (i + 1) + "个文件的格式不正确，必须是\"" + format + "\"等格式!");
					alreadyAlert = true;
					return false;
				}
			});
			if (alreadyAlert) {
				return false;
			} else if (count < minCount) {
				alert("必须上传至少" + minCount + "个文件!");
				return false;
			}
			return true;
		};
		$(function() {
			var $uploadFiles = $("#uploadFiles");
			// 添加文件
			$("#addFileBtn").click(function() {
				var fileItemHtml = '<div class="file-item"> <input name="' + getInputName(fileSize++) + '" type="file" /> <input class="btn-remove" type="button" value="删除" ></div>';
				$uploadFiles.append(fileItemHtml);
			});
			// 删除文件
			$uploadFiles.on("click", ":button.btn-remove", function() {
				var $me = $(this), $item = $me.parent();
				var currentIndex = $item.index();
				$item.nextAll().children(":file").attr("name", function(index, attrValue) {
					return getInputName(currentIndex + index);
				});
				$item.remove();
				fileSize--;
			});
		});
	</script>
</x:script>