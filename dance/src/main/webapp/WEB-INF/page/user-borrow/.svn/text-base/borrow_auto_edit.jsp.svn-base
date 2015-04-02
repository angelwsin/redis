<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<x:js path="date" />
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/borrow_auto_tab.jsp"%>
			<div class="user-content">
				<div class="post-form">
					<form method="post">
						<ul>
							<li><x:radio property="auto.status" metaType="enableStatus" label="是否启用" />
								<x:hidden property="auto.id" /></li>
							<li><x:select property="auto.borrowType" metaType="borrowType" label="标的类别" /></li>
							<li><x:text property="auto.tenderMinAccount" label="按金额" placeholder="最少(不小于1元)" cssClass="short" /> - <x:text property="auto.tenderMaxAccount" placeholder="最多(不多于30万元)" cssClass="short" /></li>
							<li><x:select property="auto.borrowStyle" metaType="borrowStyle" label="还款方式" /></li>
							<li><x:text property="auto.timeLimitMin" label="借款期限" cssClass="small" /> 个月 - <x:text property="auto.timeLimitMax" cssClass="small" /> 个月 <x:radio property="auto.timeLimitStatus" metaType="yesOrNo" label="是否启用" /></li>
							<li><x:text property="auto.aprMin" label="利率选项" cssClass="small" /> % - <x:text property="auto.aprMax" cssClass="small" /> % <x:radio property="auto.aprStatus" metaType="yesOrNo" label="是否启用" /></li>
							<li><x:text property="auto.awardMin" label="奖励选项" cssClass="small" /> % - <x:text property="auto.awardMax" cssClass="small" /> % <x:radio property="auto.awardStatus" metaType="yesOrNo" label="是否启用" /></li>
						</ul>
						<div class="toolbar">
							<input id="registerBtn" type="button" value="提交"><input type="button" onclick="history.back()" value="返回" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		$(function() {
			v.define({
				mounthNum : {
					format : "number/money",
					range : "[1,12]"
				},
				rateNum : ({
					format : "number/money",
					range : "[1,30]"
				})
			});
			$("#registerBtn").click(function() {
				var $form = $("form");
				var flag = $form.v({
					"auto.tenderMinAccount" : "money",
					"auto.tenderMaxAccount" : "money",
					"auto.timeLimitMin" : "int",
					"auto.timeLimitMax" : "int",
					"auto.aprMin" : "rateNum",
					"auto.aprMax" : "rateNum",
					"auto.awardMin" : "rateNum",
					"auto.awardMax" : "rateNum",
				});
				if (flag) {
					$.ajaxMessage("autoTender", $form.serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
