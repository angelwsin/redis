<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/post/news?post.type=NEWS" method="get">
		<x:text property="post.title" label="标题" maxlength="50" />
		<x:select items="${categorys}" property="post.postParent" headerLabel="全部" headerValue="-1" itemLabel="value.title" itemValue="value.id" label="所属栏目" />
		<a class="btn" href="javascript:void(0);" onclick="javascript:$('form').submit();">查询</a><a class="btn" id="addNews" href="${root}/admin/post/edit?post.type=NEWS">添加文章</a>
	</form>
</div>
<div>
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr class="tr-head">
			<th>序号</th>
			<th>文章标题</th>
			<th>发布时间</th>
			<th>文章作者</th>
			<th>文章来源</th>
			<th>排序</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${page.list}" var="m" varStatus="v">
			<tr class="${v.count%2==0?'even':'odd'}">
				<td>${v.count}</td>
				<td class="td-left"><a href="${root}/admin/post/edit?queryString=${queryString}&post.type=NEWS&post.id=${m.id}">${m.title}</a></td>
				<td>${m.publishDate_}</td>
				<td>${m.author}</td>
				<td>${m.source}</td>
				<td>${m.postOrder}</td>
				<td><a href="${root}/admin/post/edit?queryString=${queryString}&post.type=NEWS&post.id=${m.id}">编辑</a> <a href="javascript:void(0)" onclick="deletePost(${m.id})">删除</a>
			</tr>
		</c:forEach>
	</table>
	<x:page />
	<c:if test="${parentPost!=null}">
		<div class="toolbar">
			<input type="button" value="返回" onclick="location.href='${root}/admin/post/?post.postParent=${parentPost.postParent}'">
		</div>
	</c:if>
</div>
<x:script>
	<script>
		function deletePost(id) {
			$.confirm("确认删除吗？", function() {
				$.ajaxMessage("${root}/admin/post/remove?post.type=NEWS&post.id=" + id);
			})
		};
		$("#addNews").click(function() {
			var href = $(this).prop("href");
			var id = $("#post_postParent").val();
			if (id > 0) {
				href += "&post.postParent=" + id;
			}
			location.href = loca;
			return false;
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
