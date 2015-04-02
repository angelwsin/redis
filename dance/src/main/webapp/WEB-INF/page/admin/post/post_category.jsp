<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="editor_config: editor" />
<div class="post-form">
	<form action="${root}/admin/post/edit" method="post" id="form1">
		<div>
			<h2>${post.id==0?'添加':'编辑'}${post.type.value}</h2>
			<div>
				<x:text property="post.title" label="标题" maxlength="100" />
			</div>
			<div>
				<c:if test="${post.id==0}">
					<x:radio property="post.type" items="[{name:'文章',value:'NEWS'},{name:'栏目',value:'CATEGORY'}]" itemLabel="value.name" itemValue="value.value" label="类型" value="NEWS" />(栏目类型下可包含文章，如果栏目下就单篇文章，建议使用文章类型)
				</c:if>
				<c:if test="${post.id!=0}">
					<x:hidden property="post.type" />
				</c:if>
			</div>
			<div>
				<x:text property="post.postOrder" label="排序" />
			</div>
			<div>
				<x:textarea id="content" label="内容" property="post.content" cssClass="editor"></x:textarea>
			</div>
		</div>
		<div>
			<x:hidden property="post.id" value="0" />
			<x:hidden property="post.postParent" value="0" />
			<x:hidden property="post.addTime" />
			<x:hidden property="queryString" />
			<div class="toolbar">
				<input id="submit" type="submit" value="提交" /><input type="button" onclick="history.back();" value="返回" />
			</div>
		</div>
	</form>
</div>
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
			$("#form1").v("submit", {
				"post.title" : "required",
				"post.type" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>