<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<x:js path="jsAddress.js" />
<div class="user-form post-form medium">
	<form method="post">
		<div>
			<x:hidden property="u.id" />
			<label>用户名</label>：<span>${u.username}</span>
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
			<x:select property="u.certType" metaType="certType" label="证件类型" />
		</div>
		<div>
			<x:text property="u.certNo" label="证件号码" />
		</div>
		<x:ifMode excludes="view">
			<div>
				<label>会员头像</label>：<input type="file" id="u.avatar" />
			</div>
		</x:ifMode>
		<x:ifMode excludes="edit">
			<div>
				<label>会员头像</label>：
				<c:choose>
					<c:when test="${empty u.avatar}">
						无
					</c:when>
					<c:otherwise>
						<img src="${u.avatar}" />
					</c:otherwise>
				</c:choose>
			</div>
		</x:ifMode>
		<div>
			<x:text property="u.nickname" label="用户昵称" />
		</div>
		<x:ifMode excludes="view">
			<div>
				<x:password property="u.password" label="登录密码" />
			</div>
			<div>
				<x:password property="rePassword" label="确认密码" />
			</div>
		</x:ifMode>
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
		<c:if test="${u.type == 1}">
			<div>
				<x:select property="u.kefuUser.id" items="${users}" itemLabel="value.username" itemValue="value.id" label="选择客服" />
			</div>
		</c:if>
		<div>
			<x:text property="u.birthday" label="用户生日" cssClass="date max-now" />
		</div>
		<x:ifMode excludes="view">
			<div>
				<label>用户籍贯</label>：<select id="province" name="u.province"></select> <select id="city" name="u.city"></select> <select id="area" name="u.area"></select>
			</div>
		</x:ifMode>
		<x:ifMode excludes="edit">
			<div>
				<x:text property="u.location" label="用户籍贯" />
			</div>
		</x:ifMode>
		<div>
			<x:radio property="u.sex" metaType="sex" label="性别" />
		</div>
		<x:ifMode excludes="view">
			<div class="toolbar button">
				<input id="registerBtn" type="button" value="确认提交">
			</div>
		</x:ifMode>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			addressInit("province", "city", "area", "${u.province}" || "北京", "${u.city}" || "东城区", "${u.area}" || "密云县");
			$("#u_certType").change(function() {
				$("#u_certNo").prop("disabled", !this.value);
			});
			$("#u_password").val("");
		});
		v.define({
			password1 : {
				required : false,
				password : true
			},
			rePassword : {
				equalsTo : "u.password",
				required : false
			},
			num : {
				preFilter : function() {
					return $("#u_certType").val() != "";
				},
				text : /^[A-Za-z0-9]+$/,
				message : {
					text : "{label}只能输入数字或者字母"
				}
			}
		});
		$("#registerBtn").click(function() {
			var $form = $("form");
			var flag = $form.v({
				"u.realName" : "required",
				"u.nickname" : "required",
				"u.certNo" : "num",
				"u.password" : "password1",
				"rePassword" : "rePassword",
				"u.phone" : "cellphone",
				"u.email" : "email"
			});
			if (flag) {
				$.ajaxMessage("edit", $form.serialize());
			}
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
