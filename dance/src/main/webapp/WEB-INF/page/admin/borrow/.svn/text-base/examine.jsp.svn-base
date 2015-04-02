<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="ad-table">
	<form method="post" id="examineForm">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>借款标标题：${b.title}</td>
				<td>标的类型：${b.type_}</td>
				<td>期限: ${b.borrowLimit_}</td>
				<td>借款金额：${b.account_}元</td>
				<td>年利率：${b.apr_0}</td>
				<td>还款方式：${b.style_}</td>
			</tr>
			<tr>
				<td>最小投金额：${b.minAccount_0}</td>
				<td>最大投金额：${b.maxAccount_0}</td>
				<td>是否奖励：${b.award_0}</td>
				<td>计息方式：${b.interestMethod_}</td>
				<td>是否定向标：${b.dxbPwd_}</td>
				<td>状态：<span>${b.status_}</span></td>
			</tr>
			<c:if test="${b.type==5}">
				<tr>
					<td colspan="6">流转期限： ${b.validTime}个月</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="6">用途：${b.use_}</td>
			</tr>
			<tr>
				<td colspan="6">内容：${b.summary}</td>
			</tr>
			<tr>
				<td colspan="6">介绍：${b.projectIntro}</td>
			</tr>
			<tr>
				<td colspan="6">还款来源：${b.repaySource}</td>
			</tr>
			<tr>
				<td colspan="6">风控措施：${b.riskControl}</td>
			</tr>
			<tr>
				<td colspan="6"><x:radio name="b.status" metaType="borrowStatus" label="是否通过" value="${b.status == 0 ? '1' : '3'}" group="${b.status == 0 ? 'verify' : 'review'}" /> <c:if test="${b.type == 6}">
						<x:radio property="auto" metaType="yesOrNo" label="是否允许自动投标" />
					</c:if> <c:if test="${b.type ne 6}">
						<x:hidden property="auto" value="1" />
					</c:if></td>
			</tr>
			<tr>
				<td colspan="6"><x:textarea property="${b.status == 0 ? 'b.verifyRemark' : 'b.reviewRemark' }" label="审核备注" /></td>
			</tr>
			<x:hidden property="b.id" />
			</form>
		</table>
		<p class="submit">
			<input type="button" id="submit" value="提交" />
		</p>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("#submit").click(function() {
				var $form = $("#examineForm");
				var flag = $form.v({
					"b.status" : "required"
				});
				if (flag) {
					var status = "${b.status}";
					var type = "${b.type}";
					$.ajaxMessage("${root}/admin/borrow/examine?type=${param.type}", $form.serialize(), function(json) {
						if (json.status == "OK") {
							if (type != 10) {
								window.location.href = "${root}/admin/borrow/verifyList?b.status=" + (status == 0 ? "1" : "2");
							} else {
								window.location.href = "${root}/admin/borrow/verifyTransList?b.status=" + (status == 0 ? "1" : "2");
							}
						}
					});
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
