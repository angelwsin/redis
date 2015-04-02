<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<x:js path="jsAddress.js" />
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_tab.jsp"%>
			<div class="user-content">
				<div class="message">请认真填写用户信息。</div>
				<div class="post-form">
					<form method="post" name="form">
						<ul>
							<li><label>用户名</label>：<x:hidden property="user.id" /> ${user.username}</li>
							<li><x:select property="user.certType" metaType="certType" label="证件类型" /></li>
							<li><x:text property="user.certNo" label="证件号码" /></li>
							<li><x:text property="user.nickname" label="*用户昵称" /></li>
							<li><x:text property="user.birthday" label="用户生日" cssClass="date" formatter="date" readonly="readonly" /></li>
							<li><label><em>*</em>用户籍贯</label>：<select id="province" name="user.province"></select> <select id="city" name="user.city"></select> <select id="area" name="user.area"></select></li>
							<li><x:radio property="user.sex" metaType="sex" label="性别" value="1" /></li>
						</ul>
						<x:ifMode excludes="view">
							<div class="toolbar">
								<input type="button" id="sub" value="确认提交">
							</div>
						</x:ifMode>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		$(function() {
			addressInit("province", "city", "area", "${user.province}" || "北京", "${user.city}" || "东城区", "${user.area}" || "密云县");
			$("#user_certType").change(function() {
				$("#user_certNo").prop("disabled", !this.value).val("");
			});
			$("#sub").click(function() {
				var flag = $("form").v({
					"user.nickname" : "required",
					"user.birthday" : "required"
				});
				if (flag) {
					$.ajaxMessage("edit", $("form").serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
