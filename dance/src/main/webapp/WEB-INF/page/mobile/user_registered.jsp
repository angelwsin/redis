<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>用户注册</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<form>
		<div class="reg">
			<ul>
				<li><label>用户名</label>： <input type="text" name="user.username" placeholder="6-16位数字" maxlength="16"></li>
				<li><label>密码</label>： <input type="password" id="password" name="user.password" placeholder="6-16位数字" maxlength="16"></li>
				<li><label>确认密码</label>： <input type="password" placeholder="再次输入密码必须一致" name="password2"></li>
				<li><label>手机号</label>： <input type="text" id="phone" name="user.phone" placeholder="输入您的常用手机号码" maxlength="11"></li>
				<li><label>手机验证码</label>： <input type="text" name="phoneCode" placeholder="输入验证码(6位)"><span class="yzm"><a href="javascript:;" id="gainCode">获取验证码</a></span></li>
				<li><label>注册邀请码</label>： <input type="text" name="inviteUser.id" placeholder="（注册邀请码，可不填）"></li>
			</ul>
			<div class="tk">
				<input name="agree" id="agree" type="checkbox" /> 已阅读并同意 <a href="#">使用条款和隐私条例</a>
			</div>
			<div class="login-wrap blue tj">
				<a href="javascript:void(0)" onclick="submitForm()">立即注册 </a>
			</div>
		</div>
	</form>
</section>
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
		v.define({
			phoneCode : {
				format : "number",
				length : "[6]"
			},
			agree : {
				text : function() {
					return $("#agree").is(':checked');
				},
				message : "请同意服务条款和隐私条款"
			},
			repassword : {
				equalsTo : "user.password"
			}
		});
		v.setLabel("phoneCode", "手机验证码");
		$("#gainCode").click(function() {
			if (!enabled)
				return false;
			var reg = /^1\d{10}$/;
			if (!reg.test($("#phone").val())) {
				alert("手机号码错误");
				$("#phone").focus();
			} else {
				$.postJSON("${root}/mobile/createPhoneCodeRegister?phone=" + $("#phone").val(), function(data) {
					if (data.status == "OK") {
						smsCodeTimer($("#btnText"), 60);
					}
					alert(data.message);
				})
			}
		});
		function submitForm() {
			var flag = $("form").v({
				"agree" : "agree",
				"user.username" : "username",
				"user.phone" : "cellphone",
				"user.password" : "repassword",
				"password2" : "repassword",
				phoneCode : "phoneCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/mobile/register", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>