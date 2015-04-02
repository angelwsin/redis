<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<div class="user-title">安全管理</div>
			<div class="user-content">
				<div class="message">设置个人隐私：请保护好自己的隐私</div>
				<div class="post-form">
				<form id="privacy_form">
				<input type="hidden" value="submit" name="act">
					<ul>
						<li><dl>谁可以看我的好友列表</dl>
							<dt>
								<select name="friends" class="jeinput">
									<option value="2">所有人</option>
									<option selected="selected" value="1">仅好友</option>
									<option value="0">仅自己</option>
								</select>
							</dt>
						</li>
						<li><dl>谁可以给我发站内信</dl>
							<dt>
								<select name="message" class="jeinput">
									<option value="2">所有人</option>
									<option value="1">仅好友</option>
									<option selected="selected" value="0">仅自己</option>
								</select>
							</dt>
						</li>
						<li><dl>谁可以看我的投标记录</dl>
							<dt>
								<select name="tender" class="jeinput">
									<option selected="selected" value="2">所有人</option>
									<option value="1">仅好友</option>
									<option value="0">仅自己</option>
								</select>
							</dt>
						</li>
						<li><dl>谁可以看我的借款记录</dl>
							<dt>
								<select name="borrow" class="jeinput">
									<option selected="selected" value="2">所有人</option>
									<option value="1">仅好友</option>
									<option value="0">仅自己</option>
								</select>
							</dt>
						</li>
						<li><dl>是否接受短信推广信息</dl>	<dt><input type="radio" name="ad" value="1">允许 <input type="radio" checked="checked" name="ad" value="0">不允许</dt></li>
					</ul>
					<div class="toolbar"><input type="button" onclick="toSubmit();" value="提交" class="short"></div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>