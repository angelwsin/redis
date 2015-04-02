<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content">
				<div class="message">
					<c:if test="${sessionUser.phoneCertified}">
					您的手机已经通过认证：${sessionUser.phone}。
					</c:if>
					<c:if test="${!sessionUser.phoneCertified}">
						手机号码认证后无法修改！
					</c:if>
				</div>
				<div class="user-article">
					<c:if test="${!sessionUser.phoneCertified}">
						<form method="post" id="form1">
							<input type="hidden" name="smsType" value="BINDPHONE">
							<ul>
								<li><x:text property="phone" label="手机号码" /></li>
								<li><x:text property="code" name="code" label="手机验证码" maxlength="6" /> <input type="button" id="gainCode" value="获取验证码" /></li>
							</ul>
							<div class="toolbar">
								<input type="button" onclick="phoneActive()" value="认证激活" id="email" />
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function phoneActive() {
			var flag = $("form").v({
				"phone" : "cellphone",
				"code" : "phoneCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/user/phoneActive", $("form").serialize());
			}
		}
		var enabled = true;
		//短信验证码获取的定时器
		function smsCodeTimer($dom, seconds) {
			seconds--;
			if (seconds > 0) {
				$dom.val("重新发送(" + seconds + ")");
				enabled = false;
				setTimeout((function($dom, seconds) {
					return function() {
						smsCodeTimer($dom, seconds);
					};
				})($dom, seconds), 1000);
			} else {
				$dom.val("获取验证码");
				enabled = true;
			}
		}
		$("#gainCode").click(function() {
			if (!enabled)
				return false;
			var $form = $("#form1");
			var flag = $form.v({
				"phone" : "cellphone"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/sendPhoneCode", $form.serialize(), function(msg){
					if (msg.status == "OK") {
						smsCodeTimer($("#btnText"), 60);
					}
				});
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>