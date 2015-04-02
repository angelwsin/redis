<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/meta-type/index" method="get" name="metaTypeForm">
		<x:text property="metaType.name" label="名称" />
		<x:text property="metaType.code" label="代码" />
		<x:select property="metaType.status" id="metaType" metaType="enableStatus" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a> <a class="btn" href="${root}/admin/meta-type/edit">添加</a>
	</form>
</div>
<div id="meta_type_table"></div>
<x:script>
	<script>
		var t = new Table("元数据类型列表", "name=类型名称;code=类名代码;status_=状态", ${page.JSON});
		t.rowTemplate("name", function() {
			return '<a href="${root}/admin/meta/?meta.status=-1&meta.metaType.id=' + this.id + '">' + this.name + '</a>';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/meta-type/switchStatus?queryString=${queryString}&metaType.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/meta-type/edit?queryString=${queryString}&metaType.id=" + this.id;
		});
		t.rowLink("删除", function() {
			return "${root}/admin/meta-type/remove?metaType.id=" + this.id;
		});
		t.show("#meta_type_table");
		var $a;
		$("tr > .td-action:last-child > a").bind("click", function() {
			$a = $(this);
			$.confirm("确定要删除吗？", function() {
				var href = $a.prop("href");
				$.ajaxMessage(href);
			});
			return false;
		})
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
