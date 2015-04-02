<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="reg">
		<div class="reg-left">
			<form id="form1" method="post">
				<input type="hidden" name="smsType" value="FORGETPWD" />
				<ul>
					<li><em>*</em><label>用户名</label><input class="medium h30" type="text" name="username" placeholder="请输入用户名" maxlength="16"></li>
					<li><em>*</em><label>手机号码</label><input class="h30" type="text" id="phone" name="phone" placeholder="用户注册时的手机号码" maxlength="11"></li>
					<li><em>*</em><label>手机验证码</label><input type="text" id="phoneCode" name="phoneCode" class="short h30" placeholder="6位数字" maxlength="6"> <a href="javascript:;" id="gainCode"><font id="btnText" class="short org">获取验证码</font></a></li>
					<li class="pl100"><a href="javascript:submitForm();"><i class="org">下一步</i></a></li>
				</ul>
			</form>
		</div>
		<div class="reg-right">
			<img src="${root}/public/image/reg-right.png">
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		var enabled = true;
		//短信验证码获取的定时器
		function smsCodeTimer($dom, seconds) {
			seconds--;
			if (seconds > 0) {
				$dom.html("重新发送(" + seconds + ")");
				enabled = false;
				setTimeout((function($dom, seconds) {
					return function() {
						smsCodeTimer($dom, seconds);
					};
				})($dom, seconds), 1000);
			} else {
				$dom.html("获取验证码");
				enabled = true;
			}
		}
		v.setLabel("phoneCode", "手机验证码");
		$("#gainCode").click(function() {
			if (!enabled)
				return false;
			var $form = $("#form1");
			var flag = $form.v({
				"username" : "required",
				"phone" : "cellphone"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/sendPhoneCode", $form.serialize(), function(msg) {
					if (msg.status == "OK") {
						smsCodeTimer($("#btnText"), 60);
					}
				});
			}
		});
		function submitForm() {
			var $form1 = $("#form1");
			var flag = $form1.v({
				"username" : "required",
				"phone" : "cellphone",
				phoneCode : "phoneCode"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/findPwd", $form1.serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>