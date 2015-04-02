<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="wrap post-form">
	<form id="addBorrow">
		<div class="borrow-section">
			<h3>填写借款信息：${b.type_}</h3>
			<x:hidden property="b.type" />
			<div class="borrow-items">
				<ul>
					<li><x:select property="b.use" metaType="borrowUse" label="*借款用途" /></li>
					<li><x:text property="b.borrowLimit" label="*借款期限" cssClass="small" />&nbsp;<x:radio property="b.isDay" metaType="isDay" value="0" /></li>
					<li><x:text property="b.account" label="*借款总额" placeholder="单元：人民币" /></li>
					<li><x:text property="b.apr" label="*年化利率" cssClass="small" /> %</li>
					<li><x:select property="b.interestMethod" metaType="interestMethod" label="*计息方式" /> <span id="interestMethod" class="hide"> <x:select property="b.interestMethod1" metaType="interestMethod1" /> 天
					</span> <span id="beginTime" class="hide"><x:text property="b.beginTime" cssClass="datetime min-now" placeholder="计息时间" /></span></li>
					<li><x:select property="b.style" metaType="borrowStyle" label="*还款方式" /></li>
					<li><x:text property="b.minAccount" label="*最小投标金额" placeholder="单元：人民币" /></li>
					<li><x:text property="b.maxAccount" label="*最大投标金额" placeholder="单元：人民币" /></li>
					<li><x:text property="b.openBuyTime" label="*开放购买时间" cssClass="datetime min-now" /></li>
					<li>
						<c:choose>
							<c:when test="${b.type==5}">
								<x:text property="b.validTime" label="*流转周期" cssClass="small" />个月
							</c:when>
							<c:otherwise>
								<x:select property="b.validTime" metaType="validTime" label="*有效时间" /></li>								
							</c:otherwise>
						</c:choose>
					</li>
					<li><label for="isDxb">是否为定向标</label>：<input id="isDxb" type="checkbox" value="1"></li>
					<li><x:text property="b.dxbPwd" label="*定向标密码" /></li>
						<c:if test="${b.type==3}">
					<div><x:select items="${institutions}" property="b.institution.id" headerLabel="请选择" itemLabel="value.name" itemValue="value.id" label="担保机构" /></div>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="borrow-section">
			<h3>设置投标奖励</h3>
			<div class="borrow-items borrow-award">
				<ul>
					<li><input id="noBorrowAward" name="borrowAward" type="radio" value="0" checked> <label for="noBorrowAward">不设置投标奖励</label></li>
					<li><input id="hasBorrowAward" name="borrowAward" type="radio" value="1"> <label for="hasBorrowAward">按投标金额比例奖励</label> <x:text property="b.award" cssClass="small" /> %</li>
				</ul>
			</div>
		</div>
		<div class="borrow-section">
			<h3>公开个人信息</h3>
			<div class="borrow-items">
				<ul>
					<li><x:checkbox property="b.openAccount" items="{'1':'公开我的账户资金情况'}" /></li>
					<li><x:checkbox property="b.openBorrow" items="{'1':'公开我的借款资金情况'}" /></li>
					<li><x:checkbox property="b.openTender" items="{'1':'公开我的投标资金情况'}" /></li>
					<li><x:checkbox property="b.openAmount" items="{'1':'公开我的信用额度情况'}" /></li>
					<li><x:checkbox property="b.openAttestation" items="{'1':'公开我的证明资料情况'}" /></li>
				</ul>
			</div>
		</div>
		<div class="borrow-section">
			<h3>填写投标说明</h3>
			<div class="borrow-add-info">
				<ul>
					<li><x:text property="b.title" label="*标题" maxlength="24" cssClass="large" /></li>
					<li><x:textarea property="b.projectIntro" label="*项目介绍" cssClass="large" /></li>
					<li><x:textarea property="b.repaySource" label="*还款来源" cssClass="large" /></li>
					<li><x:textarea property="b.riskControl" label="*风控措施" cssClass="large" /></li>
					<li><x:textarea property="b.summary" label="*发布说明" cssClass="large" /></li>
				</ul>
			</div>
			<div class="mt30 mb20 tc">
				<input class="w200 h50" type="button" id="submit" value="提交" />
			</div>
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			var type = "${b.type}";
			if (type == 6) { // 秒标
				$("#b_style").val("1").prop("disabled", true);
				$("#b_interestMethod").val("2").prop("disabled", true);
			
			} else if (type == 5) { // 流转标
				$("#b_interestMethod").val("4").prop("disabled", true);
			}
			// 计息方式
			$("#b_interestMethod").change(function(result) {
				$("#interestMethod").toggle(result = this.value == 1).prop("disabled", !result);
				$("#beginTime").toggle(result = this.value == 3).prop("disabled", !result);
			}).trigger("change");
			// 定向标密码
			$("#isDxb").click(function() {
				var $dxbPwd = $("#b_dxbPwd").prop("disabled", !this.checked).parent().toggle(this.checked);
			}).triggerHandler("click");
			// 期限为天
			if (type != 6) {
			$("[name='b.isDay']").click(function() {
				var $bStyle = $("#b_style");
				$bStyle.prop("disabled", this.value == "1" && $bStyle.val("1"));
			}).triggerHandler("click");
			}
			// 投标奖励
			if ($("#b_award").val() > 0) {
				$("#hasBorrowAward").prop("checked", true);
			}
			v.define({
				maxAccount : {
					format : "number",
					compare : "this >= #b_minAccount && this <= #b_account",
					message : {
						compare : "{label}不能小于{#b_minAccount}，且不能大于{#b_account}!"
					}
				},
				account : {
					format : "number",
					range : "[500,10000000]"
				},
				dxbPwd : {
					preFilter : function() {
						return $("#isDxb").prop("checked");
					},
					length : "[6,16]"
				},
				award : {
					preFilter : function() {
						return $("#hasBorrowAward").prop("checked");
					},
					format : "number/money",
					length : "(0,40]"
				},
				apr : {
					format : "number/money",
					range : "(0,24]"
				},
				interestMethod1 : {
					preFilter : function() {
						return $("#b_interestMethod").val() == 1;
					}
				},
				beginTime : {
					preFilter : function() {
						return $("#b_interestMethod").val() == 3;
					}
				}
			});
			$("#submit").click(function() {
				var flag = $("form").v({
					"b.use" : "required",
					"b.borrowLimit" : "+int",
					"b.account" : "account",
					"b.apr" : "apr",
					"b.interestMethod" : "required",
					"b.interestMethod1" : "interestMethod1",
					"b.beginTime" : "beginTime",
					"b.style" : "required",
					"b.minAccount" : "+int",
					"b.maxAccount" : "maxAccount",
					"b.openBuyTime" : "required",
					"b.validTime" : "required",
					"b.dxbPwd" : "dxbPwd",
					"b.award" : "award",
					"b.title" : "required",
					"b.projectIntro" : "required",
					"b.repaySource" : "required",
					"b.riskControl" : "required",
					"b.summary" : "required"
				});
				if (flag) {
					$.ajaxMessage(root + "/borrow/add", $("#addBorrow").serialize());
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
