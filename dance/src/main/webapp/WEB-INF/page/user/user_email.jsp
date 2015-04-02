<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content">
				<div class="post-form">
					<c:choose>
						<c:when test="${sessionUser.emailCertified}">
							<div class="message">您的邮箱已经通过认证：${sessionUser.email}。</div>							
						</c:when>
						<c:otherwise>
							<form method="post" id="form1">
								<ul>
									<li><x:text property="sessionUser.email" name="user.email" label="邮箱地址"/></li>
								</ul>
								<div class="toolbar">
									<input type="button" onclick="emailApprove()" value="认证激活" id="email" />
								</div>
							</form>							
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function emailApprove() {
			var flag = $("#form1").v({
				"user.email" : "email"
			});
			if (flag) {
				$.ajaxMessage("", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>