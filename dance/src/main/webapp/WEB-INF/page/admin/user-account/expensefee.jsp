<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<h3>平台扣费申请</h3>
<div class="post-form">
	<form id="addBorrow">
		<div>
			<x:text property="rechargeLog.user.username" label="*扣费用户" />
		</div>
		<div>
			<x:text property="rechargeLog.money" label="*扣费金额" />
		</div>
		<div>
			<x:textarea property="rechargeLog.remark" label="扣费备注" />
		</div>
		<div style="margin-left:106px;">
			<input type="button" id="submit" value="提交" />
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#submit").click(function() {
				$.ajaxMessage("${root}/admin/user-account/expensefee", $("#addBorrow").serialize());
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>