<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="reg">
		<div class="reg-left">
			<form id="form1">
				<ul>
					<input type="hidden" name="smsType" value="REGISTER">
					<li><em>*</em><label>用户名</label><input class="medium h30" type="text" name="user.username" placeholder="6~16位字符" maxlength="16"></li>
					<li><em>*</em><label>密码</label><input class="medium h30" type="password" id="password" name="user.password" placeholder="6~16位字符" maxlength="16"></li>
					<li><em>*</em><label>确认密码</label><input class="medium h30" type="password" id="password2" name="password2" placeholder="两次密码输入必须一致" maxlength="16"></li>
					<li><em>*</em><label>手机号码</label><input class="medium h30" type="text" id="phone" name="user.phone" placeholder="输入您的常用手机号码" maxlength="11"></li>
					<li><em>*</em><label>手机验证码</label><input class="short h30" type="text" id="phoneCode" name="phoneCode" placeholder="输入验证码" maxlength="6"><a href="javascript:;" id="gainCode"><font id="btnText" class="org">获取验证码</font></a></li>
					<li><em>&nbsp;</em><label>注册邀请码</label><input type="text" id="inviteUserId" name="invite" value="${invite}" class="short h35" placeholder="注册邀请码" maxlength="11">&nbsp;(注册邀请码，可不填)</li>
					<li class="pl100"><input id="agree" name="agree" type="checkbox"> 我同意 <a href="#">服务条款</a> 和 <a href="#">隐私条款</a></li>
					<li class="pl100"><a href="javascript:void(0)" onclick="submitForm()"><i class="org">立即注册</i> </a></li>
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
		v.define({
			repassword : {
				equalsTo : "user.password"
			},
			agree : {
				text : function() {
					return $("#agree").prop("checked");
				},
				message : "请同意服务条款和隐私条款"
			},
			username : {
				pre : "trimAll,lower,flush",
				text : /^[\u2E80-\u9FFFa-z][\u2E80-\u9FFFa-z0-9_]{5,15}$/i,
				message : "用户名只能由中文、英文、数字和下划线组成的6~16位字符，并且必须以字母或中文开头!"
			}
		});
		v.setLabel("phoneCode", "手机验证码");
		$("#gainCode").click(function() {
			if (!enabled)
				return false;
			var $form = $("#form1");
			var flag = $form.v({
				"user.phone" : "cellphone"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/sendPhoneCode", $form.serialize(), function(msg){
					if (msg.status == "OK") {
						smsCodeTimer($("#btnText"), 60);
					}
				});
			}
		});
		function submitForm() {
			var $form = $("#form1");
			var flag = $form.v({
				"user.username" : "username",
				"user.password" : "password",
				password2 : "repassword",
				"user.phone" : "cellphone",
				phoneCode : "phoneCode",
				"agree" : "agree"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/register", $form.serialize());
			}
		}
		$("#form1").v("focusout", {
			"user.username" : "username",
			"user.password" : "password",
			password2 : "repassword",
			"user.phone" : "cellphone",
			phoneCode : "phoneCode",
			"agree" : "agree"
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
