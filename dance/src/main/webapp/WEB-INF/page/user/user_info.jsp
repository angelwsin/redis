<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<x:js path="date" />
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_tab.jsp"%>
			<div class="user-content">
				<div class="message">请认真填写用户信息。</div>
				<div class="post-form">
					<form>
						<ul>
							<li><x:text property="sessionUser.username" label="账户" /></li>
							<li><x:text property="sessionUser.nickname" label="昵称" /></li>
							<li><x:text property="sessionUser.sex_" label="性别" /></li>
							<li><x:text property="sessionUser.phone" label="手机号码" /></li>
							<li><x:text property="sessionUser.location" label="籍贯" /></li>
							<c:set var="__mode" scope="request" value="add" />
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>