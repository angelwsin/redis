<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.ui-table td.td-action {
	width: 80px;
}
</style>
<div class="search-form">
	<form action="${root}/admin/user/list">
		<x:text property="u.username" label="用户名" cssClass="short" />
		<x:text property="u.phone" label="手机号" cssClass="short" />
		<c:choose>
			<c:when test="${u.type != 1}">
				<x:select property="u.type" metaType="type" group="admin" label="管理员类型" headerLabel="全部" headerValue="-1" />
			</c:when>
			<c:otherwise>
				<x:hidden property="u.type" />
			</c:otherwise>
		</c:choose>
		<c:if test="${u.type == 1 }">
			<x:text property="u.kefuUser.username" label="客服名" cssClass="short" />
		</c:if>
		<x:text property="beginTime" label="注册时间从" cssClass="short date" formatter="date" readonly="readonly" />
		<x:text property="endTime" label="到" cssClass="short date" formatter="date" readonly="readonly" />
		<x:select property="u.sex" metaType="sex" headerLabel="全部" headerValue="-1" label="性别" />
		<a class="btn" href="javascript:$('form').submit();">查询</a> <a class="btn" href="${root}/admin/user/add?u.type=${u.type}">添加用户</a>
	</form>
</div>
<div id="user_table"></div>
<x:script>
	<script>
		var t = new Table("${__title}", "username=用户名;realName=真实姓名;sex_=性别;email=邮箱;phone=电话;location=籍贯;${u.type == 1 ? '' : 'roleName_=权限组;'}addTime=注册时间", ${page.JSONForDate});
		t.rowTemplate("username", function() {
			return '<a href="${root}/admin/user/edit?u.type=' + this.type + '&mode=view&u.id=' + this.id + '">' + this.username + '</a>';
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/user/edit?u.type=" + this.type + "&u.id=" + this.id + "&mode=edit";
		});
		if ("${u.type}" != 1) {
			t.rowLink("权限组设置", function() {
				return "${root}/admin/system/configRole?user.id=" + this.id;
			});
		}
		t.show("#user_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
