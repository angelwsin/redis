<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<div>
		<x:text property="m.title_" label="标题" />
	</div>
	<div>
		<x:textarea property="m.content" label="内容" />
	</div>
	<div>
		<x:text property="m.sender.username" label="发送人" />
	</div>
	<div>
		<x:text property="m.sendTime_" label="发送时间" />
	</div>
	<div>
		<label>接收用户</label>：<span>${receiveUser}(共发送${m.sendCount}条)</span>
	</div>
	<div class="toolbar">
		<input type="button" onclick="history.back()" value="返回" />
	</div>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
