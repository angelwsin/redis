<%@ page language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% pageContext.setAttribute("ignoreHeader", true); %>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
	<form method="post">
		<div class="user-login">
			<div class="user-login-wrap">
				<div class="user-login-logo">
					<img src="${root}/public/image/login-logo.png">
					<h3>后台管理系统-登录</h3>
				</div>
				<div class="user-login-con">
					<ul>
						<li><label>用户名</label><input id="userName" name="u.username" maxlength="20" placeholder="6~16位字符，必须以字母开头" class="login-user"></li>
						<li><label>密码</label><input id="password" type="password" name="u.password" maxlength="16" placeholder="6~16位字符" class="login-pass"></li>
						<li><label>验证码</label><input id="verifyCode" name="verifyCode" maxlength="4" placeholder="请输入验证码" class="w150 h35">
							<div class="user-login-con-span">
								<img class="verify-code" id="changeImg" src="${root}/user/createValidateCode" title="点击更换" />
							</div></li>
					</ul>
				</div>
				<div id="login" class="user-login-login">登录</div>
			</div>
		</div>
	</form>
<x:script>
	<script type="text/javascript">
		function refreshVerifyCode() {
			$("#changeImg").attr("src", "${root}/user/createValidateCode?timestamp=" + Date.now());
		};
		function login() {
			var $form = $("form");
			var flag = $form.v({
				"u.username" : "required",
				"u.password" : "password",
				"verifyCode" : "checkCaptcha"
			});
			if (flag) {
				$.ajaxMessage("${root}/admin/user/login?src=${param.src}", $form.serialize());
			}
		}
		$(function() {
			v.define({
				checkCaptcha : {
					length : "[4]"
				}
			});
			$("#changeImg").click( refreshVerifyCode );
			$("#login").click( login );
			$(document).keydown(function(event) {
				if (event.which == 13) {
					login();
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>