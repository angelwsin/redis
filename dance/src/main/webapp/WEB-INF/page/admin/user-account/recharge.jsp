<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<h3>平台充值申请</h3>
<div class="post-form">
	<form id="addBorrow">
		<div>
			<x:text property="rechargeLog.user.username" label="*充值用户" />
		</div>
		<div>
			<x:text property="rechargeLog.money" label="*充值金额" />
		</div>
		<div>
			<x:textarea property="rechargeLog.remark" label="充值备注" />
		</div>
		<div style="margin-left:106px;">
			<input type="button" id="submit" value="提交" />
		</div>
	</form>
</div>
</div>
<x:script>
	<script>
		$(function() {
			$("#submit").click(function() {
				var flag = $("form").v({
					"rechargeLog.user.username" : "required",
					"rechargeLog.money" : "+money"
				});
				if (flag) {
					$.ajaxMessage("${root}/admin/user-account/recharge", $("#addBorrow").serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>