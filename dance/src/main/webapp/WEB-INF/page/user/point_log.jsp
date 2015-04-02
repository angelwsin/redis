<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%-- <%@ include file="/WEB-INF/page/tab/security_tab.jsp"%> --%>
			<div class="user-content">
				<%-- <div class="message">
					成功投资总额：${AccountTender}
				</div> --%>
				<div class="user-table">
					<div id="point_log_table"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		var t = new Table("积分日志", "rule.ruleName=类型;operator=操作;changePoint=积分;remark=说明;changeTime=时间", ${page.JSONForDateTime});
		t.rowTemplate("rule.ruleName", function() {
			return this.rule.ruleName;
		});
		t.rowTemplate("operator", function() {
			return this.changePoint >= 0 ? '增加' : '减少';
		});
		t.show("#point_log_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>