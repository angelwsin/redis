<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<style type="text/css">
.td-siteName_,.td-siteUrl {
	text-align: left;
	padding-left: 5px;
}
.td-siteLogo img {
	line-height: 30px;
	width: 60px;
	height: 30px;
	vertical-align: middle;
	margin: 3px 0;
}
</style>
<div class="search-form">
	<form action="${root}/admin/link/list" method="get" name="linkForm">
		<x:text property="l.siteName" label="名称" />
		<x:text property="beginTime" label="开始时间" formatter="date" readonly="readonly" cssClass="date" />
		<x:text property="endTime" label="结束时间" formatter="date" readonly="readonly" cssClass="date" />
		<x:select property="l.status" metaType="enableStatus" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:$('form').submit();">查询</a> <a class="btn" href="${root}/admin/link/edit">添加</a>
	</form>
</div>
<div id="link_table"></div>
<x:script>
	<script>
		var t = new Table("友情链接列表", "siteLogo=站点Logo;siteName_=站点名称;siteUrl=站点链接;siteOrder=排序", ${page.JSON});
		t.rowTemplate("siteUrl", function() {
			return '<a href="${root}/admin/link/edit?mode=view&l.id=' + this.id + '">' + this.siteUrl + '</a>';
		});
		t.rowTemplate("siteLogo", function() {
			return '<img src="' + this.siteLogo_ + '"/>';
		});
		t.rowTemplate("siteName_", function() {
			return '<a href="${root}/admin/link/edit?mode=view&l.id=' + this.id + '">' + this.siteName_ + '</a>';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/link/remove?l.id=" + this.id + "&l.status=" + this.status;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/link/edit?mode=edit&l.id=${l.id}" + this.id;
		});
		t.show("#link_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
