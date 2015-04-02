<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<x:js path="jsAddress.js" />
<div class="user-form post-form medium">
	<form method="post" name="form">
		<div>
			<x:text property="u.username" label="用户名" />
		</div>
		<div>
			<x:text property="u.realName" label="真实姓名" />
		</div>
		<div>
			<x:radio property="u.realNameStauts" metaType="yesOrNo" label="实名认证" />
		</div>
		<c:choose>
			<c:when test="${u.type != 1}">
				<div>
					<x:select property="u.type" metaType="type" label="用户类型" group="admin" />
				</div>
			</c:when>
			<c:otherwise>
				<x:hidden property="u.type" />
			</c:otherwise>
		</c:choose>
		<div>
			<x:text property="u.QQ" label="QQ" maxlength="12" />
		</div>
		<div>
			<x:select property="u.certType" metaType="certType" label="证件类型" />
		</div>
		<div>
			<x:text property="u.certNo" label="证件号码" />
		</div>
		<div>
			<label>头像路径</label>：<input type="file" id="u.avatar" />
		</div>
		<div>
			<x:text property="u.nickname" label="用户昵称" />
		</div>
		<div>
			<x:password property="u.password" label="登录密码" />
		</div>
		<div>
			<x:password property="rePassword" label="确认密码" />
		</div>
		<div>
			<x:text property="u.email" label="邮箱地址" />
		</div>
		<div>
			<x:radio property="u.emailStatus" metaType="yesOrNo" label="邮箱认证" />
		</div>
		<div>
			<x:text property="u.phone" label="手机号码" />
		</div>
		<div>
			<x:radio property="u.phoneStatus" metaType="yesOrNo" label="手机认证" />
		</div>
		<div>
			<x:radio property="u.vest" metaType="yesOrNo" label="设为马甲" />
		</div>
		<div>
			<x:text property="u.birthday" label="用户生日" cssClass="date max-now" />
		</div>
		<div>
			<label>用户籍贯</label>：<select id="province" name="u.province"></select> <select id="city" name="u.city"></select> <select id="area" name="u.area"></select>
		</div>
		<div>
			<x:radio property="u.sex" metaType="sex" label="性别" value="0" />
		</div>
		<div class="toolbar button">
			<input id="registerBtn" type="button" value="确认提交">
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			addressInit("province", "city", "area", "${u.province}" || "北京", "${u.city}" || "东城区", "${u.area}" || "密云县");
			$("#u_certType").change(function() {
				$("#u_certNo").prop("disabled", !$(this).val());
			});
			$("#u_type").change(function() {
				$("#u_QQ").val("").prop("disabled", $(this).val() != 3);
			})
		});
		v.define({
			rePassword : {
				equalsTo : "u.password"
			},
			num : {
				preFilter : function() {
					return $("#u_certType").val();
				},
				text : /^[A-Za-z0-9]*$/,
				message : {
					text : "{label}只能输入数字或者字母"
				}
			},
			QQ : {
				preFilter : function() {
					return $("#u_type").val() == 3;
				}
			}
		});
		$("#registerBtn").click(function() {
			var $form = $("form");
			var flag = $form.v({
				"u.username" : "username",
				"u.realName" : "required",
				"u.type" : "required",
				"u.QQ" : "QQ",
				"u.certType" : "required",
				"u.certNo" : "num",
				"u.nickname" : "required",
				"u.password" : "password",
				"rePassword" : "rePassword",
				"u.email" : "email",
				"u.phone" : "cellphone"
			});
			if (flag) {
				$.ajaxMessage("add", $form.serialize());
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
