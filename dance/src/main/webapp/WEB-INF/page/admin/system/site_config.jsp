<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form long">
	<h3>${__title}</h3>
	<form>
		<c:forEach items="${map}" var="siteMap">
			<div>
				<c:if test="${siteMap.key ne 'ssl'}">
					<x:text property="siteMap.value" name="siteMap.${siteMap.key}" label="${siteMap.value.group}" />
				</c:if>
				<c:if test="${siteMap.key eq 'port'}">
					<span style="color: red">(不填默认为25)</span>
				</c:if>
				<c:if test="${siteMap.key eq 'ssl'}">
					<x:checkbox name="siteMap.${siteMap.key}" items="{'true':'启用'}" label="${siteMap.value.group}" values="${siteMap.value.label}" />
				</c:if>
			</div>
		</c:forEach>
		<div class="toolbar button">
			<input type="button" id="registerBtn" value="修改">
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#registerBtn").click(function() {
				$.ajaxMessage("${metaType}", $("form").serialize());
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>