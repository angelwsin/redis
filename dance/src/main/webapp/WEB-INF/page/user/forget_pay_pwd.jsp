<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<div class="tab-title">
				<ul class="title-list" current=${tabOrder}>
					<li><a href="${root}/user/credit">重置交易密码</a></li>
				</ul>
			</div>
			<div class="user-content">
				<div class="message">
					<p id="message1">将向你的手机号码：${sessionUser.phone}&nbsp;发送一条验证信息，请输入验证码后，点击下一步</p>
					<p id="message2" style="display: none;">密码请不要太过于简单。</p>
				</div>
				<div>
					<div id="phoneDiv" class="post-form">
						<form id="phoneForm" method="post">
							<input type="hidden" name="smsType" value="FORGETPAYPWD"/>
							<div>
								<label>验证码：</label><input type="text" name="phoneCode" maxlength="6" /><input type="button" value="获取验证码" id="sendSMS" />
							</div>
							<div class="toolbar">
								<input type="button" value="下一步" id="next" />
							</div>
						</form>
					</div>	
					<div id="pwdDiv" class="post-form" style="display: none;">
						<form method="post" id="pwdForm">
							<div>
								<x:password property="newpwd" label="支付新密码" />
							</div>
							<div>
								<x:password property="newpwd2" label="支付确认密码" />
							</div>
							<div class="toolbar">
								<input type="button" onclick="subForm()" value="确认修改" id="submitPwd"> <input type="button" onclick="history.back()" value="返回" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		v.define({
			repeatPwd : {
				equalsTo : "newpwd"
			}
		});
		function subForm() {
			var $form = $("#pwdForm")
			var flag = $form.v({
				"newpwd" : "password",
				"newpwd2" : "repeatPwd"
			});
			if (flag) {
				$.ajaxMessage("${root}/user/forgetPayPwd", $form.serialize());
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
		$("#sendSMS").click(function() {
			if (!enabled)
				return false;
			smsCodeTimer($(this), 60);
			$.ajaxMessage("${root}/user/sendPhoneCode", $("#phoneForm").serialize());
		});
		$("#next").click(function() {
			var $phoneForm = $("#phoneForm");
			var flag = $phoneForm.v({
				"phoneCode" : "phoneCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/user/forgetPayPwd", $phoneForm.serialize(), function(msg){
					if (msg.status == "OK") {
						$("#phoneDiv").hide();
						$("#pwdDiv").show();
						$("#message1").hide();
						$("#message2").show();
					}
				});
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>