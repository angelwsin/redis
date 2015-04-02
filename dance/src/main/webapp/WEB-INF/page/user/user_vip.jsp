<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content user-vip">
				<h3>VIP特权</h3>
				<div class="message">
					VIP认证用户将享有以下特权：
					<ol>
						<li>VIP认证用户将拥有专属的优质客服，享受尊贵的一对一客服服务。</li>
						<li>VIP认证用户在自动投标时，将拥有优先排队投标的权利。</li>
						<li>更多精彩折扣特权、活动特权即将开放，敬请期待！</li>
					</ol>
				</div>
				<h3>VIP认证费用</h3>
				<div>每次VIP认证的有效期为一年，VIP认证需要交纳一定的认证费用。详细的VIP认证费用规则请见下表：</div>
				<table class="table" style="width: 500px">
					<tr>
						<th>VIP认证年份</th>
						<th>VIP认证费用</th>
					</tr>
					<c:forEach var="vip" items="${fees}" varStatus="st">
						<tr>
							<td>第${vip.years}年${st.last ? '及以上':''}</td>
							<td class="td-right">${vip.cost_}元</td>
						</tr>
					</c:forEach>
				</table>
				<div style="margin-top: 20px;">
					<c:choose>
						<c:when test="${user.vip}">
							<div class="message">您已是VIP会员!</div>
						</c:when>
						<c:when test="${isApply}">
							<div class="message">您当前正在申请第<span class="highlight">${current.years}</span>次VIP认证，请耐心等待管理员审核！</div>
						</c:when>
						<c:otherwise>
							<div class="message">
								您当前是第<span class="highlight">${current.years}</span>次申请VIP认证，需要支付VIP认证费用<span class="highlight">${current.cost_}</span>元。
							</div>
							<div class="toolbar">
								<input id="submit" type="button" value="确认申请">
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<x:ifMode excludes="view">
		<x:js path="date" />
		<x:script>
			<script type="text/javascript">
				$(function() {
					$("#submit").click(function() {
						if (confirm("确认申请vip认证。")) {
							$.ajaxMessage(root + "/user/vipActive", $("form").serialize());
						}
					})
				})
			</script>
		</x:script>
	</x:ifMode>
	<%@ include file="/WEB-INF/page/common/footer.jsp"%>