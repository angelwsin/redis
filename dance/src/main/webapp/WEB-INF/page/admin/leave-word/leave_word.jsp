<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="reply" method="post">
		<div>
			<x:text property="l.title_0" label="标题" />
			<x:hidden property="l.id" disabled="disabled" />
		</div>
		<div>
			<x:textarea property="l.content_0" label="内容" disabled="disabled" />
		</div>
		<div>
			<label>状态</label>：${empty l.replyContent? '未回复':'已回复'}
		</div>
		<div>
			<x:text property="l.addTime_" label="时间" disabled="disabled" />
		</div>
		<c:if test="${not empty l.replyContent}">
			<div>
				<x:text property="l.replyContent" label="回复内容" />
			</div>
		</c:if>
		<x:ifMode excludes="view">
			<div>
				<x:textarea property="l.replyContent" label="回复内容" />
			</div>
			<div>
				<label></label><input type="submit" value="提交" />
			</div>
		</x:ifMode>
	</form>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>