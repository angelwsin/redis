<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/borrow_auto_tab.jsp"%>
			<div class="user-content">
				<div class="message">自动投标按照以下规则排队，当前有效设置自动投标的人数为${userNum}人。</div>
				<p>用户可以设置自动投标排队有效日期（如不重新设置，新规则生效后，生效前已经设置自动投标的，默认排队有效期为48小时）。同时，添加自动投标设置符合条件的（即设置有效的）才会进入排队程序。以下为自动投标排队的优先级规则：</p>
				<p>一：VIP用户优先;</p>
				<p>二：如果自动投标次数相等，则设置自动投标时间早的用户优先;</p>
				<p>三：如果上次自动投标时间相同，则用户注册时间早的优先。</p>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标种</th>
							<th>金额</th>
							<th>是否设置期限</th>
							<th>期限</th>
							<th>是否选择利率</th>
							<th>利率</th>
							<th>是否选择奖励</th>
							<th>奖励</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.list}" var="auto">
							<tr>
								<td>${auto.borrowType_}</td>
								<td>${auto.tenderMinAccount}元-${auto.tenderMaxAccount}元</td>
								<td>${auto.timeLimitStatus_}</td>
								<td>${auto.timeLimitMin}个月-${auto.timeLimitMax}个月</td>
								<td>${auto.aprStatus_}</td>
								<td>${auto.aprMin}%-${auto.aprMax}%</td>
								<td>${auto.awardStatus_}</td>
								<td>${auto.awardMin}%-${auto.awardMax}%</td>
								<td><c:if test="${auto.status==1}">
										<a href="#" onclick="javascript:auto(${auto.id},${auto.status})">停用</a>
									</c:if> <c:if test="${auto.status==0}">
										<a href="#" onclick="javascript:auto(${auto.id},${auto.status})">启用</a>
									</c:if> <a href="${root}/user-borrow/autoTender?auto.id=${auto.id}">编辑</a></td>
							</tr>
						</c:forEach>
					</table>
					<x:page simple="true" />
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		function auto(id, status) {
			$.confirm(status == 1 ? "确认要停用吗？" : "确认要启用吗？", function() {
				$.ajaxMessage("${root}/user-borrow/startOrStop?auto.id=" + id + "&auto.status=" + status);
			});
		};
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>