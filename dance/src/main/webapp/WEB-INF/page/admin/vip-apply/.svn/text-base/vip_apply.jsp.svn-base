<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<h3>${__title}</h3>
	<form name="form" method="post">
		<x:hidden property="v.id" />
		<div>
			<x:text property="v.user.username" label="申请用户" />
		</div>
		<div>
			<x:text property="v.years" label="申请年份" />
		</div>
		<div>
			<x:text property="v.cost_" label="认证费用" />
		</div>
		<c:choose>
			<c:when test="${mode == 'verify'}">
				<c:set var="__mode" scope="request" value="verify" />
				<x:hidden property="v.id" />
			</c:when>
			<c:otherwise>
				<div>
					<x:text property="v.verifyUser.username" label="审核人" />
				</div>
			</c:otherwise>
		</c:choose>
		<div>
			<x:radio name="v.status" value="1" metaType="verifyStatus" label="审核操作" />
		</div>
		<div>
			<x:textarea property="v.verifyRemark" label="审核备注" />
		</div>
		<c:choose>
			<c:when test="${mode == 'verify'}">
				<div id="kefuUserWrap">
					<x:select name="v.kefuUser.id" items="${kefuList}" label="专属客服" />
				</div>
			</c:when>
			<c:when test="${v.status == 1}">
				<x:text property="v.kefuUser.username" label="专属客服" />
			</c:when>
		</c:choose>
		<x:ifMode excludes="view">
			<div class="toolbar">
				<input type="button" id="submit" value="提交" />
			</div>
		</x:ifMode>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("[name='v.status']").click(function() {
				$("#kefuUserWrap").toggle(this.value == "1");
			}).triggerHandler("click");
			$("#submit").click(function() {
				var $form = $("form");
				var flag = $form.v({
					"v.status" : {
						text : function(value, s) {
							return s.dom.filter(":checked").length == 1;
						},
						message : "必须选择对应的审核操作！"
					},
					"v.kefuUser.id" : {
						preFilter : function() {
							return $("#v_status-1").prop("checked");
						}
					},
					"v.verifyRemark" : "required"
				});
				if (flag)
					$.ajaxMessage("verify", $form.serialize());
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>