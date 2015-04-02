<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>申请提现</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<c:if test="${empty bank}">
	<div style="margin:0 auto;margin-top:200px; width:400px; height:100px;">
		<div>
			<span style="color: red;">您的账户尚未完善银行卡信息，无法完成提现操作！请先到电脑填写银行卡信息</a></span>
		</div>
	</div>
</c:if>
<c:if test="${not empty bank}">
	<div class="cash">
		<ul>
			<li><x:text property="account.totalAccount_0" label="账户总额" /></li>
			<li><x:text property="account.activeAccount_0" label="可用余额" /></li>
			<li><x:text property="account.frozenAccount_0" label="冻结余额" /></li>
			<li><x:text property="account.collectAccount_0" label="待收余额" /></li>
		</ul>
	</div>
	<div class="logins">
		<ul>
			<li><x:text property="sessionUser.realName" label="真实姓名" /></li>
			<li><x:text property="bank.account" label="银行账号" /></li>
			<li><label>开户银行</label><span style="color:red;">${bank.bank_}</span><span style="margin: 0 10px;">${bank.location}</span><span>${bank.branch}</span></li>
			<c:set var="__mode" scope="request" value="edit" />
			<form id="cashForm" method="post">
				<li><x:text name="applyMoney" label="提现金额" /> <span>元</span></li>
				<li><x:text id="phone" name="user.phone" label="手机号码" placeholder="请输入有效的手机号码" maxlength="11" /></li>
				<li><x:text name="phoneCode" label="验证码" id="phoneCode" placeholder="6位数字" maxlength="6" /><a href="javascript:;" id="gainCode"><i id="btnText" class="gain-sms-code">获取验证码</i></a></li>
				<li><x:password name="payPassword" cssClass="medium" label="支付密码" /></li>
			</form>
		</ul>
		<div class="sqtx">
			<a id="btnSubmit">申请提现</a>
		</div>
	</div>
</c:if>
<br />
<br />
<br />
<br />
<x:script>
	<script type="text/javascript">
		$(function() {
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
			$("#gainCode").click(function() {
				if (!enabled)
					return false;
				var reg = /^1\d{10}$/;
				if (!reg.test($("#phone").val())) {
					alert($("#phone").val())
					alert("手机号码错误");
					$("#user.phone").focus();
				} else {
					$.postJSON("${root}/mobile/createPhoneCode?phone=" + $("#phone").val(), function(data) {
						if (data.status == "OK") {
							smsCodeTimer($("#btnText"), 60);
						}
						alert(data.message);
					})
				}
			});
			var maxCash = Math.min("${account.activeAccount}", 45000);
			$("#btnSubmit").click(function() {
				var $form = $("#cashForm");
				var flag = $form.v({
					"applyMoney" : {
						format : "number/money",
						range : "[100," + maxCash + "]",
						message : "{label}不能小于100，并且不能大于可用余额!"
					},
					"user.phone" : "cellphone",
					phoneCode : "phoneCode",
					"payPassword" : "password"
				});
				if (flag) {
					$.ajaxMessage("", $form.serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>