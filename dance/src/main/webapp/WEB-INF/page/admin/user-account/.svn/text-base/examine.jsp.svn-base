<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form id="examineForm">
		<div>
			<x:text id="money" property="rechargeLog.money_" label="申请金额" disabled="true" />
		</div>
		<div>
			<x:radio name="rechargeLog.status" metaType="rechageFeeStatus" label="审核状态" value="2" />
		</div>
		<div>
			<x:textarea property="rechargeLog.verifyRemark" label="审核备注" />
			<x:hidden property="rechargeLog.id" />
		</div>
		<input id="submit" type="button" value="提交" />
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#submit").click(function() {
				var $form = $("#examineForm");
				var flag = $form.v({
					"rechargeLog.status" : "required",
					"rechargeLog.verifyRemark" : "required"
				});
				if (flag) {
					$.ajaxMessage("${root}/admin/user-account/examine", $form.serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
