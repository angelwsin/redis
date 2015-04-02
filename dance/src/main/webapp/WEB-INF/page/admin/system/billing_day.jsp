<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<form method="post">
	<div class="post-form">
		<h3>账单催收天数设置</h3>
		<div class="message" style="display: inline-block;">请设置账单催收提前提醒的天数，系统将会在借款人应还款时间之前，提前几天发送短信提醒借款人还款。</div>
		<div>
			<x:text property="day" label="提前" cssClass="small" />
			<span>天提醒借款人应准时还款</span>
		</div>
		<div class="toolbar">
			<input id="registerBtn" type="button" value="确认修改">
		</div>
	</div>
</form>
<x:script>
	<script>
		$(function() {
			v.define({
				num : {
					format : "number/int",
					range:"[1,30]",
					message : "账单催收提醒天数必须在1~30天之间"
				}
			});
			$("#registerBtn").click(function() {
				var $form = $("form");
				var flag = $form.v({
					"day" : "num"
				});
				if (flag) {
					$.ajaxMessage("billingDay", $form.serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
