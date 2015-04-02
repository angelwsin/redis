<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="post-form long-label">
	<form method="post">
		<div>
			<h3>${__title}</h3>
			<x:hidden property="fee.id" value="0" />
			<x:hidden property="fee.addTime" />
			<div>
				<x:text property="fee.name" maxlength="50" label="管理费名称" />
			</div>
			<div>
				<x:select items="${feeType}" property="fee.type" label="扣费基准" itemLabel="value" itemValue="key" />
			</div>
			<div>
				<x:text property="fee.freeBase" label="基准免费额度" />
			</div>
			<div>
				<x:text property="fee.factor" label="扣费费率" />
				%
			</div>
			<div>
				<x:text property="fee.free" label="管理费免费额度" />
			</div>
			<div>
				<x:text property="fee.beginTime" id="beginTime" label="启用时间范围" formatter="datetime" readonly="readonly" cssClass="datetime min-now" />
				至
				<x:text property="fee.endTime" id="endTime" formatter="datetime" readonly="readonly" cssClass="datetime" />
				&nbsp;(如时间范围有至少一个为空，则默认表示永久生效)
			</div>
			<div>
				<x:select property="fee.status" metaType="enableStatus" label="状态" />
			</div>
			<div>
				<label>扣费计算公式</label>：(扣费基准 - 免费基准) * 扣费费率 - 免除费用
			</div>
			<div class="toolbar">
				<input id="button" type="button" onclick="subForm()" value="提交" /><input type="button" onclick="history.back()" value="返回" />
			</div>
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		v.define({
			begin_end : {
				required : false,
				compare : "!#beginTime || !#endTime || #beginTime <= #endTime",
				format : "date/datetime",
				message : "启用时间不能大于停用时间!"
			}
		});
		function subForm() {
			var $subForm = $("form");
			var falg = $subForm.v({
				"fee.name" : "required",
				"fee.type" : "required",
				"fee.freeBase" : "money",
				"fee.factor" : "money",
				"fee.free" : "money",
				"fee.beginTime" : "begin_end",
				"fee.status" : "required"
			});
			if (falg) {
				$.ajaxMessage("${root}/admin/manage-fee/edit", $subForm.serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>