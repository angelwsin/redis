<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<x:js path="date" />
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/account_bank_tab.jsp"%>
			<div class="user-content">
				<div class="message">银行账号一经填写不得修改，请注意仔细核对！</div>
				<div class="post-form">
				<form id="bankForm">
					<ul>
						<li><label>账号</label>：${sessionUser.username}</li>
						<li><label>真实姓名</label>：${sessionUser.realName}</li>
						<li><x:select property="bank.bank" metaType="bank" label="开户银行" /></li>
						<x:ifMode includes="view">
							<li><x:text property="bank.location" label="开户行所在地" /></li>
						</x:ifMode>
						<x:ifMode excludes="view">
							<li><label>开户行所在地</label>： <select id="province" name="bank.province"></select> <select id="city" name="bank.city"></select> <select id="area" name="bank.area"></select></li>
						</x:ifMode>
						<li><x:text property="bank.branch" label="开户支行" placeholder="例如：金田路支行" /></li>
						<li><x:text property="bank.account" label="银行账号" /></li>
					</ul>
					<x:ifMode excludes="view">
						<div class="toolbar">
							<input class="short" id="btnSubmit" type="button" value="确认提交">
						</div>
					</x:ifMode>
				</form>
				</div>				
			</div>
		</div>
	</div>
</div>
<x:ifMode excludes="view">
	<x:js path="jsAddress.js" />
	<x:script>
		<script>
			$(function() {
				addressInit("province", "city", "area");
				$("#btnSubmit").click(function() {
					var $form = $("#bankForm");
					var flag = $form.v({
						"bank.bank" : "required",
						"bank.branch" : "required",
						"bank.account" : {
							format : "number",
							length : "[10,]",
							message : "请输入有效的银行账号，否则可能无法正常提现!"
						},
					});
					flag && $.confirm("银行卡信息一旦提交将无法再次修改，您确认需要提交？", function() {
						$.ajaxMessage(root + "/user/bank", $("#bankForm").serialize());
					});
				});
			});
		</script>
	</x:script>
</x:ifMode>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>