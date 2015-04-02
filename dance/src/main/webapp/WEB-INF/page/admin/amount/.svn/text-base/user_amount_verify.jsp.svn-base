<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/amount/verify" method="post">
		<div>
			<x:radio name="uaa.status" metaType="verifyStatus" label="是否通过" value="1" />
		</div>
		<div>
			<x:textarea property="uaa.verifyRemark" label="审核备注" />
			<x:hidden property="uaa.id" />
			<x:hidden property="uaa.applyAmount"/>
		</div>
		<label></label><input type="submit" value="提交" /><input type="button" value="返回" onclick="history.back()" />
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("form").v("submit", {
				"uaa.verifyRemark" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
