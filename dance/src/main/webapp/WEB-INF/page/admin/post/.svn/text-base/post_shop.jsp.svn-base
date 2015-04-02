<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<x:js path="editor_config: editor: editor_zh" />
<div class="post-form">
	<div>
		<h2>积分商城公告</h2>
		<div>
			<form id="form1">
				<div>
					<script type="text/plain" id="leiji" name="post.content" class="editor">${post.content}</script>
				</div>
				<input type="hidden" value="1" name="post.postOrder" /> <input type="hidden" value="${post.id}" name="post.id" /> <input type="hidden" value="${post.addTime}" name="post.addTime" />
				<div class="toolbar">
					<input id="post1" type="button" value="编辑" />
				</div>
			</form>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		//实例化保存器
		//建议使用工厂方法getEditor创建和引用保存器实例，如果在某个闭包下引用该保存器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue1 = UE.getEditor('leiji', {
			initialFrameWidth : 800,
			initialFrameHeight : 320,
			pasteplain : true,
			readonly : true,
			autoHeightEnabled : false,
			toolbars : [ [ 'undo', 'redo', 'bold', 'preview', 'fontsize', 'forecolor', 'formatmatch', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'insertorderedlist', 'insertunorderedlist', ] ]
		});
		var flag1 = false;
		$("#post1").click(function() {
			if (flag1) {
				flag1 = !flag1;
				ue1.setDisabled();
				$(this).val("编辑");
				$.ajaxMessage("${root}/admin/post/shop", $("#form1").serialize());
			} else {
				flag1 = !flag1;
				ue1.setEnabled();
				$(this).val("保存");
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>