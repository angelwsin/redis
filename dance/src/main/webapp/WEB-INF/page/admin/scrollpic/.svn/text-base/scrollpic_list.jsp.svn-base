<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<a class="btn" href="${root }/admin/scrollpic/edit">添加滚动图片</a>
</div>
<div id="scrollpic_table"></div>
<x:script>
	<script>
		var t = new Table("滚动图片列表", "pic=图片;url=URL;title=标题;type=类型;order=顺序;status_=状态", ${page.JSON});
		t.rowTemplate("pic", function() {
			return '<img src="'+this.pic_+'" />';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/scrollpic/switchStatus?scrollpic.id=" + this.id + "&&scrollpic.type=" + this.type;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/scrollpic/edit?scrollpic.id=" + this.id;
		});
		t.rowLink("删除", function() {
			return "javascript:remove(" + this.id + ")";
		});
		t.show("#scrollpic_table");
		function remove(id) {
			$.confirm("确认删除？", function() {
				$.ajaxMessage("${root}/admin/scrollpic/remove?scrollpic.id=" + id);
			});
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
