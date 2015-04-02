<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/meta/index">
		<x:select property="meta.metaType.id" id="metaType" items="${metaTypes}" itemLabel="value.name" itemValue="value.id" headerValue="-1" headerLabel="全部" label="所属类型" />
		<x:text property="meta.value" label="代码值" />
		<x:select property="meta.status" metaType="enableStatus" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a><input type="button" value="添加" onclick="gotoMeta()" />
	</form>
</div>
<div id="content_table"></div>
<x:script>
	<script>
		var t = new Table("元数据列表", "id=编号;metaTypeName=所属类型名称;value=代码值;label=标签文本;group=所属群组;metaOrder=顺序;status_=状态", ${page.JSON});
		t.rowTemplate("metaTypeName", function() {
			return '<a href="${root}/admin/meta-type/?metaType.status=-1&metaType.id=' + this.metaType.id + '">' + this.metaType.name + '</a>';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/meta/switchStatus?queryString=${queryString}&meta.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/meta/edit?queryString=${queryString}&meta.id=" + this.id;
		});
		t.rowLink("删除", function() {
			return "${root}/admin/meta/remove?queryString=${queryString}&meta.id=" + this.id;
		});
		t.show("#content_table");
		var $a;
		$("tr > .td-action:last-child > a").bind("click", function() {
			$a = $(this);
			$.confirm("确定要删除吗？", function() {
				$.ajaxMessage($a.prop("href"));
			});
			return false;
		})
		function gotoMeta() {
			var loca = root + "/admin/meta/edit?queryString=${queryString}";
			if ($("#metaType").val() > -1) {
				loca += "&meta.status=1&meta.metaType.id=" + $("#metaType").val();
			}
			location.href = loca;
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
