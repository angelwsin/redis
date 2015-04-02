<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="post-form long-label">
	<form id="levelForm" method="post">
		<x:hidden property="rule.id" value="0" />
		<x:hidden property="rule.unitPoint" value="0" />
		<x:hidden property="page.size" />
		<x:hidden property="page.current" />
		<div>
			<x:text property="rule.ruleName" maxlength="50" label="规则名称" />
		</div>
		<div>
			<dl>
				<dt>
					<label>积分规则</label>：<span style="color: red;">(如果积分系数为负数，则表示扣除积分)</span>
				</dt>
				<label></label>
				<input type="hidden">
				<label style="width:100px">规则</label>&nbsp;&nbsp;&nbsp;
				<label>积分系数</label>
				<c:forEach items="${requestScope.ruleType}" var="r">
					<dd>
						<label></label><input name='rule.ruleType' type="radio" value="${r}" ${rule.ruleType == r ? 'checked' : ''} /> <label style="width:100px">${r.name}</label>&nbsp;&nbsp;&nbsp;<input type="text" name='unitPoint' placeholder="积分系数" ${rule.ruleType != r ? 'disabled':'' } value="${rule.ruleType == r ? rule.unitPoint : ''}" maxlength="9" class="short" />(${r.desc})
					</dd>
				</c:forEach>
				<x:text property="rule.beginTime" id="beginTime" label="启用时间范围" formatter="datetime" readonly="readonly" cssClass="datetime" />
				至
				<x:text property="rule.endTime" id="endTime" formatter="datetime" readonly="readonly" cssClass="datetime" />
				&nbsp;(如时间范围有至少一个为空，则默认表示永久生效)
			</dl>
		</div>
		<div>
			<x:select property="rule.status" metaType="enableStatus" label="状态" />
		</div>
		<div class="toolbar">
			<input type="button" value="提交" onclick="submitForm()" /><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		v.define({
			unitPoint : {
				text : function() {
					var $checkRule = $rules.filter(":checked")
					if ($checkRule.length) {
						var point = $checkRule.siblings(":text");
						var reg = /^-?\d+(\.\d{1,2})?$/;
						if (!point.val()) {
							$.alert("请输入积分系数");
						} else if (!reg.test(point.val())) {
							$.alert("[积分系数只能为数字，并最多保留小数点后两位!");
						} else {
							$("input[name='rule.unitPoint']").val(point.val());
							return true;
						}
						point.focus();
					} else {
						$.alert("请选择一个扣费规则");
					}
					return false;
				},
				message : " "
			},
			begin_end : {
				required : false,
				compare : "!this || !#endTime || this <= #endTime",
				message : "启用时间不能大于停用时间!"
			}
		});
		//扣费规则单选框点击事件
		var $rules = $("[name='rule.ruleType']");
		$rules.click(function() {
			$rules.each(function() {
				var $me = $(this), $relatedText = $me.siblings(":text");
				$relatedText.prop("disabled", !$me.prop("checked"));
				$relatedText.focus();
			});
		});
		function submitForm() {
			var flag = $("form").v({
				"rule.ruleName" : "required",
				"rule.unitPoint" : "unitPoint",
				"rule.status" : "required",
				"rule.beginTime" : "begin_end"
			});
			if (flag) {
				$.ajaxMessage("${root}/admin/credit-rule/edit", $("#levelForm").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>