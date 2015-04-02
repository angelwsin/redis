<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content">
				<div class="message">密码请不要太过于简单，支付原始密码默认为注册密码。</div>
				<div class="post-form">
					<form method="post" id="pwdForm">
						<ul>
							<li><x:password property="oldpwd" label="支付原始密码" />&nbsp;<a href="${root}/user/forgetPayPwd">忘记交易密码？</a></li>
							<li><x:password property="newpwd" label="支付新密码" /></li>
							<li><x:password property="newpwd2" label="支付确认密码" /></li>
							<li><x:text property="verifyCode" label="验证码" cssClass="small" maxlength="4" /> <img class="verify-code" title="点击更换" id="createCode" src="${root}/user/createValidateCode" onclick="refresh();" style="cursor: pointer;" /></li>
						</ul>
						<div class="toolbar">
							<input type="button" onclick="subForm()" value="确认修改" id="submitPwd"> <input type="button" onclick="history.back()" value="返回" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function refresh() {
			$("#createCode").attr("src", root + "/user/createValidateCode?" + Math.random());
		};
		v.define({
			repeatPwd : {
				equalsTo : "newpwd"
			}
		});
		function subForm() {
			var flag = $("form").v({
				"oldpwd" : "password",
				"newpwd" : "password",
				"newpwd2" : "repeatPwd",
				"verifyCode" : "imageCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/user/changePayPwd", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>