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
					<ol>
						<li>请注意您的银行卡充值限制，以免造成不便。</li>
						<li>如果充值金额没有及时到账，请和客服联系。</li>
						<li>请选择下面您最便捷的方式进行帐户充值。</li>
					</ol>
				</div>
				<div class="post-form">
				<form id="rechargeForm" action="${root}/pay/" method="post">
						<div><x:text property="money" label="*充值金额" cssClass="short" />元</div>
						<div><label><em>*</em>充值渠道</label>：
						<ul style="padding-left: 110px;">						
							<c:forEach items="${payments}" var="pay">
								<c:if test="${pay.enabled}">
									<li><input name="channel" type="radio" value="${pay.paymentCode}" ><img class="pay-icon" src="${root}${pay.logo}" />${pay.name}</li>							
								</c:if>
							</c:forEach>
						</ul>
						</div>
						<div><x:text name="verifyCode" label="*验证码" cssClass="short" /> <img id="verifyCodeImg" class="verify-code" src="${root}/user/createValidateCode" title="点击更换"/></div>
					<div class="toolbar">
						<input id="btnSubmit" type="submit" value="确认充值">
					</div>
				</form>
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
$(function(){
	$("#verifyCodeImg").click(function(){
		refresh();		
	});
	$("#rechargeForm").v("submit", {
		"money": "+money",
		"channel": {
			text: function(){
				return $("[name=channel]:checked").length == 1; 
			},
			message: "{label}不能为空!"
		},
		"verifyCode": "imageCode"
	});
	var error = "${error}";
	error && $.alert(error);
});
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>