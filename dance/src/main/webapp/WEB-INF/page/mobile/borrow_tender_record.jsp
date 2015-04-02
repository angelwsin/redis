<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>投标记录</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<div class="ds_list">
		<c:if test="${not empty sessionUser}">
			<c:if test="${empty borrowTenders}">
				<span class="button">暂无记录数</span>
			</c:if>
			<c:if test="${!empty  borrowTenders}">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tr class="title">
						<td width="20%" class="title">投资人</td>
						<td width="30%" class="title">投标时间</td>
						<td width="20%" class="title">投标金额</td>
						<td width="30%" class="title">年利率</td>
					</tr>
					<c:forEach items="${borrowTenders}" var="bt">
						<tr>
							<td>${bt.user.username_0}</td>
							<td><em>${bt.addTime_}</em></td>
							<td>${bt.tenderAccount_0}</td>
							<td>${bt.borrow.apr_0}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</c:if>
		<c:if test="${empty sessionUser}">
			<div style="margin:0 auto; width:400px; height:100px;">
				<div>
					用户登录后才能投标，请先<a href="${root}/user/login" style="color: #07519A">登录</a>
				</div>
				<div>
					还没有账号？点此立即<a href="${root}/user/register" style="color: #07519A">免费注册</a>
				</div>
			</div>
		</c:if>
	</div>
</section>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>