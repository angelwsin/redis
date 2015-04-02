<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>${__title}</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<form>
		<div class="change_password">
			<ul>
				<li><x:password property="newpwd" label="新的登录密码" name="newpwd" maxlength="16" /></li>
				<li><x:password property="newpwd2" label="再次输入密码" name="newpwd2" maxlength="11" /></li>
			</ul>
			<div class="passwrod_btn">
				<input type="button" value="提交" class="tj" onclick="submitForm()">
			</div>
		</div>
	</form>
</section>
<x:script>
	<script type="text/javascript">
		v.define({
			repeatPwd : {
				equalsTo : "newpwd"
			}
		});
		function submitForm() {
			var flag = $("form").v({
				"newpwd" : "password",
				"newpwd2" : "repeatPwd"
			});
			if (flag) {
				$.ajaxMessage("${root}/mobile/changeFindPwd", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>