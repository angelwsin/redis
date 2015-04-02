<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<style type="text/css">
.section {
	color: #333;
	line-height: 40px;
	border-bottom: 1px solid #666;
}
</style>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<div class="user-title">额度申请</div>
			<div class="user-content">
				<h3 class="section">额度申请历史记录</h3>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>申请时间</th>
							<th>申请额度</th>
							<th>原来额度</th>
							<th>新额度</th>
							<th>审核状态</th>
						</tr>
						<c:forEach var="apply" items="${page.list}" varStatus="status">
							<tr>
								<td>${apply.addTime_}</td>
								<td>${apply.applyAmount_}</td>
								<td>${apply.oldAmount_}</td>
								<td>${apply.newAmount_}</td>
								<td>${apply.status_}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<x:page simple="true" />
				<div class="post-form">
					<h3 class="section">额度申请</h3>
					<form method="post" name="form">
						<ul>
							<li><x:text property="uaa.applyAmount" label="*申请金额" /></li>
							<li><x:textarea property="uaa.applyRemark" label="*申请备注" /></li>
						</ul>
						<div class="toolbar">
							<input type="button" id="sub" value="提交" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		$(function() {
			$("#sub").click(function() {
				var flag = $("form").v({
					"uaa.applyAmount" : "+money",
					"uaa.applyRemark" : "required"
				});
				if (flag) {
					$.ajaxMessage("apply", $("form").serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>