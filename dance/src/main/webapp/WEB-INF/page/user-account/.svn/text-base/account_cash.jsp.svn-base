<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/account_bank_tab.jsp"%>
			<div class="user-content">
				<div class="message">
					<h3>注意事项：</h3>
					<ol>
						<li>请确保您的银行账号的姓名和您在本站填写的真实姓名一致，信用卡不得设置为提现账户。</li>
						<li>禁止信用卡套现、凡是充值未投标的用户，充值15天以内提现收取1%的手续费，15天以后提现免费。</li>
						<li>处理提现时间：16:00前提现，当天处理，我们将在24小时内转出， 法定节假日除外，如有特殊情况，请联系客服。</li>
						<li>每笔提现金额至少100元（含）。单笔最高不超过4.5万元，每日限额不超过20万元。</li>
					</ol>
				</div>
				<div class="post-form">
					<ul>
						<li><x:text property="sessionUser.realName" label="真实姓名" /></li>
						<li><x:text property="account.totalAccount_" label="账户总额" /></li>
						<li><x:text property="account.activeAccount_" label="可用余额" /></li>
						<li><x:text property="account.frozenAccount_" label="冻结余额" /></li>
						<li><x:text property="account.collectAccount_" label="待收余额" /></li>
						<c:choose>
							<c:when test="${empty bank}">
								<li>您尚未填写银行账号，请先 <a href="${root}/user/bank">补全银行账号信息</a> !
								</li>
							</c:when>
							<c:otherwise>
								<li><label>提现银行</label>：<span style="color:red;">${bank.bank_}</span><span style="margin: 0 10px;">${bank.location}</span><span>${bank.branch}</span></li>
								<li><x:text property="bank.account" label="银行账号" /></li>
								<c:set var="__mode" scope="request" value="edit" />
								<form id="cashForm" method="post">
									<li><x:text name="applyMoney" label="*提现金额" /> <span>元</span></li>
									<li><x:password name="payPassword" label="*支付密码" /></li>
									<li><x:text name="verifyCode" label="*验证码" cssClass="small" /> <img id="verifyCodeImg" class="verify-code" src="${root}/user/createValidateCode" title="点击更换" /></li>
									<div class="toolbar">
										<input class="short" id="btnSubmit" type="button" value="申请提现">
									</div>
								</form>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		function refresh() {
			$("#verifyCodeImg").attr("src", root + "/user/createValidateCode?t=" + Date.now());
		};
		$(function() {
			$("#verifyCodeImg").click(function() {
				refresh();
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
					"payPassword" : "password",
					"verifyCode" : "imageCode"
				});
				if (flag) {
					$.ajaxMessage("${root}/user-account/cashFee", $form.serialize(), function(msg){
						if (msg.status == "OK") {
							$.confirm(msg.message, function() {
								$.ajaxMessage("${root}/user-account/cash", $form.serialize());
							});
						} else if(msg.message){
							alert(msg.message);
						}
					}, false);
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>