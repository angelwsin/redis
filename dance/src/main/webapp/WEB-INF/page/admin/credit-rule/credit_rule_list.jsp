<%@ page language="java" pageEncoding="UTF-8"%>

<div class="search-form">
	<a class="btn" href="${root }/admin/credit-rule/edit">添加积分规则</a>
</div>
<div id="credit_rule_table"></div>
<x:script>
	<script>
		var t = new Table("积分规则列表", "ruleName=积分规则名称;ruleDesc=积分规则;status_=状态", ${page.JSON});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "${root}/admin/credit-rule/switchStatus?page.current=${page.current}&page.size=${page.size}&rule.id=" + this.id;
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/credit-rule/edit?page.current=${page.current}&page.size=${page.size}&rule.id=" + this.id;
		});
		t.show("#credit_rule_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
