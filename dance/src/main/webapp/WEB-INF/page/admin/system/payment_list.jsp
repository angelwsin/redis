<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div id="paymentTable">
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr class="tr-head">
			<th>支付接口图标</th>
			<th>支付接口名称</th>
			<th>商户号</th>
			<th>支付密钥</th>
			<th>备用字段1</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<tbody>
			<c:forEach items="${payments}" var="p" varStatus="st">
				<tr class="${st.index % 2 == 0 ? 'odd':'even' }">
					<td><img class="pay-logo" src="${root}${p.logo}" /></td>
					<td>${p.name}</td>
					<td>${p.cachedPayEntry.merchantID}</td>
					<td>${p.cachedPayEntry.signKey_}</td>
					<td>${p.cachedPayEntry.remark}</td>
					<td>${p.cachedPayEntry.enabled_}</td>
					<td><a href="switchPaymentStatus?channel=${p.paymentCode}">${p.cachedPayEntry.enabled ? '停用':'启用'}</a> <a href="paymentConfig?channel=${p.paymentCode}">编辑</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>