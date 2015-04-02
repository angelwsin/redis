
<%@ page language="java" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="error.css" output="true" />
<div class="wrapper">
	<h5>系统提示</h5>
	<div class="content">
		<div class="message">
			<div class="icon warn">&nbsp;</div>
				<div class="text">${errorMessage}</div>
				<div class="remark">${remark}</div>			
		</div>
	</div>
	<div class="foot">
		<input type="button" value="返回首页" onclick="gotoHome()">
		<input type="button" value="返回上一页" onclick="history.back()">
		<input type="button" value="关闭" onclick="closeWin()">
	</div>
</div>
<x:script>
<script type="text/javascript">
// 回到首页
function gotoHome(){
	location.href = "${root}/";
}
//兼容IE6-8、无弹出提示框的关闭窗口函数
function closeWin(){
	window.opener = null;
	window.open("", "_self");
	window.close();
}
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>