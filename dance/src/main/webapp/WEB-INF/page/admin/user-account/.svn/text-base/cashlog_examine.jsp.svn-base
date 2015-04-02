<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form id="examineForm">
		<c:set var="__mode" scope="request" value="view" />
		<div>
			<x:text property="cashLog.applyMoney" label="提现金额" formatter="money" />
		</div>
		<div>
			<x:text property="cashLog.actualMoney" label="实际到账金额" formatter="money" />
		</div>
		<c:set var="__mode" scope="request" value="submit" />
		<div>
			<x:radio name="cashLog.status" metaType="cashStatus" group="${cashLog.status == 0 ? 'verify' : 'review'}" label="是否通过" value="${cashLog.status == 0 ? '1' : '2'}" />
		</div>
		<div>
			<x:textarea property="${cashLog.status == 0 ? 'cashLog.verifyRemark' : 'cashLog.reviewRemark' }" label="审核备注" />
			<x:hidden property="cashLog.id" />
		</div>
		<div class="toolbar">
			<input id="submit" type="button" value="提交" />
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#submit").click(function() {
				var $form = $("#examineForm");
				var flag = $form.v({
					"cashLog.status" : "required"
				});
				if (flag) {
					$.ajaxMessage("${root}/admin/user-account/cashlogExamine", $form.serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
