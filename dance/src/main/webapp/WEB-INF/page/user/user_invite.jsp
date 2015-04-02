<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<div class="user-title">邀请好友</div>
			<div class="user-content">
				<div class="message">
					您的专属注册邀请码为：<span style="color:blue;font-family: 'Microsoft Yahei';">${sessionUser.id}</span>，邀请好友注册并投资成功可获得提成奖励！
				</div>
				<ul>
					<li>您的邀请好友注册链接：</li>
					<li><input class="input_invite" type="text" value="${url}/user/register?invite=${sessionUser.id}" readonly="readonly" id="txt_links"> <input type="button" id="copy_button" data-clipboard-target="txt_links" value="复制"></li>
				</ul>
				<div class="user-table">
					<table class="table">
						<thead>
							<td>推广会员</td>
							<td>注册时间</td>
							<td>投资金额</td>
							<td>提成奖励</td>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="obj">
								<tr>
									<td>${obj[0]}</td>
									<td>${obj[1]}</td>
									<td>${obj[2]}</td>
									<td>${obj[3]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<x:page simple="true" />
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript" src="http://libs.useso.com/js/zeroclipboard/2.1.5/ZeroClipboard.min.js"></script>
	<script type="text/javascript">
		var clip = new ZeroClipboard($("#copy_button"));
		clip.on("aftercopy", function(e) {
			$.alert("复制成功。");
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>