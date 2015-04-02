<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/leave-word/reply?l.id=${l.id}" method="post">
		<div>
			<label>标题</label>：<span>${l.title_0}</span>
		</div>
		<div>
			<label>内容</label>：<span>${l.content}</span>
		</div>
		<div>
			<x:textarea property="l.replyContent" label="回复内容" />
		</div>
		<div class="toolbar">
			<input type="submit" value="提交" />
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
