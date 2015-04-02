<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/credentials_tab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<table class="table">
						<tr>
							<th>文件类型名称</th>
							<th>上传时间</th>
							<th>上传备注</th>
							<th>状态</th>
						</tr>
						<c:forEach var="uf" items="${page.list}">
							<tr>
								<td>${uf.remark}</td>
								<td>${uf.uploadTime_}</td>
								<td>${uf.type.typeName}</td>
								<td>${uf.status_}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<x:page simple="true" />
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>