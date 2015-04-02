<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/post/index?post.type=CATEGORY">
		<x:text property="post.title" label="标题" maxlength="50" />
		<x:select items="${listCategory}" property="post.postParent" headerLabel="全部" headerValue="0" itemLabel="value.title" itemValue="value.id" label="根栏目" />
		<a class="btn" href="javascript:void(0);" onclick="javascript:$('form').submit();">查询</a><a class="btn" href="${root}/admin/post/edit?post.type=CATEGORY">添加根栏目</a>
	</form>
</div>
<div>
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr class="tr-head">
			<th>序号</th>
			<th>栏目标题</th>
			<th>添加时间</th>
			<th>栏目排序</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${page.list}" var="m" varStatus="v">
			<tr class="${v.count%2==0?'even':'odd'}">
				<td>${v.count}</td>
				<td class="td-left"><c:if test="${m.postParent==0}">
						<a href="${root}/admin/post/?post.postParent=${m.id}">${m.title}</a>
					</c:if> <c:if test="${m.postParent!=0}">
				${m.title}
				</c:if></td>
				<td>${m.addTime_}</td>
				<td>${m.postOrder}</td>
				<td><a href="${root}/admin/post/edit?queryString=${queryString}&post.type=CATEGORY&post.id=${m.id}">编辑</a> <a href="javascript:void(0)" onclick="deletePost(${m.id})">删除</a> <c:if test="${m.postParent==0&&m.type == 'CATEGORY'}">
						<a href="${root}/admin/post/addSecondCategory?queryString=${queryString}&post.id=${m.id}"> 添加子栏目</a>
					</c:if> <%--只有parent id=0的栏目，才能添加子栏目。只有栏目类型下才能添加子文章 --%> <c:if test="${m.type=='CATEGORY'&&m.postParent>0}">
						<a href="${root}/admin/post/news?post.postParent=${m.id}">文章管理</a>
					</c:if></td>
			</tr>
		</c:forEach>
	</table>
	<x:page />
	<c:if test="${parentPost!=null}">
		<div class="toolbar">
			<input type="button" value="返回上级栏目" onclick="location.href='${root}/admin/post/?post.postParent=${parentPost.postParent}'">
		</div>
	</c:if>
</div>
<x:script>
	<script>
		function deletePost(id) {
			$.confirm("确认删除吗？", function() {
				$.ajaxMessage("${root}/admin/post/remove?post.type=CATEGORY&post.id=" + id);
			})
		};
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
