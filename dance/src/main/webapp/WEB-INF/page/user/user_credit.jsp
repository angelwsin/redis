<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<div>
						<label>信用等级</label>：${point.level.levelName}<label>信用分数</label>：${point.totalPoint}
					</div>
					<div id="user_credit_table"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		var t = new Table("信用认证", "typeName=认证名称;typeFormat=文件格式;point=信用积分;appCost=审核费用;uploadTime=上传时间;status_=状态", ${page.JSONForDate});
		t.rowLink(function() {
			if (this.status == -1) {
				return "重新上传";
			} else if (this.status == -2) {
				return "上传";
			} else {
				return '';
			}
		}, function() {
			return "${root}/user/uploadCreditInfo?typeId=" + this.typeId;
		});
		t.show("#user_credit_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
