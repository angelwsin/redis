<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/post/edit" method="post" enctype="multipart/form-data" class="long">
		<div>
			<h2>${post.id==0?'添加':'编辑'}${post.type.value}</h2>
			<div>
				<x:hidden property="post.id" value="0" />
				<x:hidden property="post.type" />
				<x:hidden property="queryString" />
				<x:select items="${categorys}" property="post.postParent" itemLabel="value.title" itemValue="value.id" label="所属栏目" />
			</div>
			<div>
				<x:text property="post.title" label="标题" maxlength="250" />
			</div>
			<div>
				<x:text property="post.author" maxlength="50" label="作者" />
			</div>
			<div>
				<x:text property="post.source" maxlength="250" label="来源" />
			</div>
			<div>
				<x:text property="post.publishDate" readonly="readonly" cssClass="datetime" label="发布时间" />
			</div>
			<div>
				<x:text property="post.postOrder" label="排序" />
			</div>
			<div>
				<x:textarea id="content" label="内容" property="post.content" cssClass="editor" />
			</div>
		</div>
		<div class="toolbar">
			<input id="submit" type="submit" value="提交" /><input type="button" onclick="javascript:history.back();" value="返回" />
		</div>
	</form>
</div>
<x:js path="date" />
<x:js path="editor_config: editor: editor_zh" />
<x:script>
	<script type="text/javascript">
		$(function() {
			//
			//实例化编辑器
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('content', {
				initialFrameWidth : 800,
				initialFrameHeight : 320
			});
			// TODO: 编辑对象时，文件的编辑。
			$("form").v("submit", {
				"post.postParent" : "required",
				"post.title" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>