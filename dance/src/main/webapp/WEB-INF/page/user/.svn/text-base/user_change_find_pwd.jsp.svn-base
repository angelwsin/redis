<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="reg">
		<div class="reg-left">
			<h2>重置密码</h2>
			<form id="form1" method="post">
				<div>
					<em>*</em><label>新的登录密码</label>：<input class="h35" type="password" name="newPwd" maxlength="16">
				</div>
				<div>
					<em>*</em><label>再次输入密码</label>：<input class="h35" type="password" name="newPwd2" maxlength="11">
				</div>
				<div class="toolbar">
					<input type="button" value="下一步" onclick="submitForm()" />
				</div>
			</form>
		</div>
		<div class="reg-right">
			<img src="${root}/public/image/reg-right.png">
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		v.define({
			repeatPwd : {
				equalsTo : "newPwd"
			}
		});
		function submitForm() {
			var flag = $("form").v({
				"newPwd" : "password",
				"newPwd2" : "repeatPwd"
			});
			if (flag) {
				$.ajaxMessage(root + "/user/changeFindPwd", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>