<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="login">
		<div class="login-left"><img src="${root}/public/image/login-left.png"></div>
		<div class="login-right">
		<form method="post">
			<ul>
				<li><em>*</em><label>用户名</label><input class="melong h35" type="text" id="userName" name="user.username" placeholder="6~16位字符，必须以字母开头"></li>
				<li><em>*</em><label>密码</label><input class="melong h35" type="password" type="password" id="password" name="user.password" placeholder="6~16位字符"></li>
				<li><em>*</em><label>验证码</label><input class="short h35" type="text" id="verifyCode" name="verifyCode" placeholder="4位字符" maxlength="4"><img class="verify-code" src="${root }/user/createValidateCode" id="changeImg" title="点击更换"/></li>
				<li class="tr pr20"><a href="${root}/user/findPwd">忘记密码？</a></li>
				<li class="pl70"><a href="javascript:void(0)" onclick="submitForm()"><i class="org">立即登录</i></a></li>
				<li class="tc">没有账号？<a href="${root}/user/register">免费注册</a></li>
			</ul>
		</form>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function refreshVerifyCode() {
			$("#changeImg").attr("src", root + "/user/createValidateCode?t=" + Date.now());
		};
		function submitForm() {
			var $form = $("form");
			var flag = $form.v({
				"user.username" : "required",
				"user.password" : "password",
				"verifyCode" : "imageCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/user/login?src=${param.src}", $form.serialize());
			}
		};
		$("#changeImg").click( refreshVerifyCode );
		$(document).keydown(function(event) {
			if (event.which == 13) {
				submitForm();
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
