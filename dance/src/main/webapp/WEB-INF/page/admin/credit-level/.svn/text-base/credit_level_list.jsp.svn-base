<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<a class="btn" href="${root }/admin/credit-level/edit">添加积分等级</a>
</div>
<div id="credit_level_table"></div>
<x:script>
	<script>
		var t = new Table("积分等级列表", "levelName=名称;levelIcon=等级图标;minPoint=最低信用积分;minInfoCount=最低审核科目数量;allowOverdue_=是否允许有逾期;requiredInfo=必审科目;status_=状态", ${page.JSON});
		t.rowTemplate("levelIcon", function() {
			return '<img src="' + this.levelIcon_ + '" class="level-icon" />';
		});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/credit-level/switchStatus?page.current=${page.current}&page.size=${page.size}&level.levelId=" + this.levelId;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/credit-level/edit?page.current=${page.current}&page.size=${page.size}&level.levelId=" + this.levelId;
		});
		t.show("#credit_level_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
