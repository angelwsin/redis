<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>借款标详情</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<div class="ds_list">
		<c:if test="${not empty sessionUser}">
			<div class="more-info">${b.projectIntro}</div>
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