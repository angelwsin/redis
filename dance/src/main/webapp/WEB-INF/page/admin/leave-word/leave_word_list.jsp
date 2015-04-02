<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/leave-word/list" method="get" name="messageTemplateForm">
		<x:text property="l.title" label="名称" />
		<x:text property="beginTime" label="留言时间从" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" readonly="readonly" cssClass="date" />
		<x:select property="l.isDelete" metaType="isDelete" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a>
	</form>
</div>
<div id="leave_word_table"></div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
<x:script>
	<script>
		var t = new Table("留言列表", "title=留言标题;user.username=留言用户;content_=留言内容;addTime_=时间;isDelete_=状态", ${page.JSONForDate});
		t.rowTemplate("title", function() {
			return '<a href="${root}/admin/leave-word/view?l.id= ' + this.id + '">' + this.title_ + '</a>';
		});
		t.rowTemplate("user.username", function() {
			return this.user.username;
		});
		t.rowLink(function() {
			return this.isDelete == 0 ? "删除" : "";
		}, function() {
			return this.isDelete == 0 ? "javascript:remove(" + this.id + ")" : null;
		});
		t.rowLink("查看", function() {
			return "${root}/admin/leave-word/view?l.id=" + this.id;
		});
		t.rowLink(function() {
			return this.isDelete == 0 ? "回复" : "";
		}, function() {
			return this.isDelete == 0 ? "${root}/admin/leave-word/reply?l.id=" + this.id : null;
		});
		t.show("#leave_word_table");
		function remove(id) {
			$.confirm("确认删除？", function() {
				$.ajaxMessage("${root}/admin/leave-word/remove?l.id=" + id);
			});
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>