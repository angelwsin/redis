<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/leave_word_tab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<table class="table">
						<tr>
							<th>留言标题</th>
							<th>留言用户</th>
							<th>留言内容</th>
							<th>时间</th>
						</tr>
						<c:forEach var="l" items="${page.list}">
							<tr>
								<td><a href="${root}/leave-word/view?l.id=${l.id}">${l.title_}</font></a></td>
								<td>${l.user.username}</td>
								<td>${l.content_}</td>
								<td>${l.addTime_}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<x:page simple="true" />
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>