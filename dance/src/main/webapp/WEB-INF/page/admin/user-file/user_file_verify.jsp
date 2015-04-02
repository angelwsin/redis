<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<h2>${uf.status==0?'审核':'查看'}认证资料</h2>
	<form action="${root}/admin/user-file/verify" method="post">
		<input type="hidden" name="uf.id" value="${uf.id}" /> <input type="hidden" name="uf.status" value="${uf.status}" /> <input type="hidden" name="queryString" value="${queryString}" />
		<div>
			<label>资料名称</label>：${uf.type.typeName}
		</div>
		<div>
			<label>用户名</label>：${uf.user.username}
		</div>
		<div>
			<label>姓名</label>：${uf.user.realName}
		</div>
		<c:if test="${uf.type.type=='REALNAME'}">
			<%--只有实名认证显示以下信息--%>
			<div>
				<label>性别</label>：${uf.user.sex_}
			</div>
			<div>
				<label>出生日期</label>：${uf.user.birthday_}
			</div>
			<div>
				<x:select property="uf.user.certType" metaType="certType" label="证件类型" />
			</div>
			<div>
				<label>籍贯</label>：${uf.user.location}
			</div>
		</c:if>
		<div>
			<label>身份证号</label>：${uf.user.certNo}
		</div>
		<div>
			<label>资料图片</label>：
			<c:forEach var="file" items="${uf.fileInfos}">
				<img src="${file.fileURI}">
			</c:forEach>
		</div>
		<div class="toolbar">
			<c:if test="${uf.status==0}">
				<input id="verifyYes" type="button" value="审核通过" onclick="verifyYes1()" />
				<input id="verifyNo" type="button" onclick="verifyNo1()" value="审核不通过" />
			</c:if>
			<input type="button" value="返回" onclick="history.back()" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		function verifyYes1() {
			$("input[name='uf.status']").val(1);
			$("form").submit();
		}
		function verifyNo1() {
			$("input[name='uf.status']").val(-1);
			$("form").submit();
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>