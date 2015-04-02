<%@ page language="java" pageEncoding="UTF-8"%>
<div class="tab-title">
	<ul class="title-list" current=${tabOrder}>
		<li><a href="${root}/user/info">个人基本信息</a></li>
		<li><a href="${root}/user/edit">个人详细信息</a></li>
		<li><a href="${root}/user/userWork" style="display: none;">工作信息认证</a></li>
		<li><a href="${root}/user/userCompany" style="display: none;">企业信息认证</a></li>
		<p><b></b></p>
	</ul>
</div>