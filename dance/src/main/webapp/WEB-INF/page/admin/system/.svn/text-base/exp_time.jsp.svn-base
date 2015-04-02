<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<form method="post">
	<div class="post-form">
		<h3>设置投标赠送体验金的活动时间</h3>
		<div class="message" style="display: inline-block;">
			<span style="color: #c30;">提示</span>：如果需要停止活动，将时间范围设为已过期即可。
		</div>
		<div>
			<x:text property="beginTime" label="活动开始时间" formatter="datetime" readonly="readonly" cssClass="datetime" />
		</div>
		<div>
			<x:text property="endTime" label="活动结束时间" formatter="datetime" readonly="readonly" cssClass="datetime" />
		</div>
	</div>
	<div class="toolbar">
		<input id="registerBtn" type="button" value="确认修改">
	</div>
</form>
<x:script>
	<script>
			v.define("compareTime", {
		    	compare: "this > #beginTime",
		    	propagation: true,
		    	format: "date/datetime",
		    	message: {
		    		"format": "{label}必须是日期!",
		    		"compare": "{label}必须大于大于开始时间！"
		    	}
		    });
			$("#registerBtn").click(function() {
				var $form = $("form");
				var flag = $form.v({
					"endTime" : "compareTime"
				});
				if (flag) {
					$.ajaxMessage("expTime", $form.serialize());
				}
			});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
