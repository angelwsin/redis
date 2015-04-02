
<%@ page language="java" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="error.css" output="true" />
<div class="wrapper">
	<h5>系统提示</h5>
	<div class="content">
		<div class="message">
			<div class="icon ${icon}">&nbsp;</div>
			<div class="text">${message}</div>
		</div>
	</div>
	<div class="foot">
		<a class="btn" href="${root}/" >回到首页</a>
		<c:if test="${not empty url}">
			<a class="btn" href="${url}" >${anchor}</a>
		</c:if>
		<a class="btn" href="javascript:;" onclick="closeWin()">关闭</a>
	</div>
</div>
<x:script>
<script type="text/javascript">
//兼容IE6-8、无弹出提示框的关闭窗口函数
function closeWin(){
	window.opener = null;
	window.open("", "_self");
	window.close();
}
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>