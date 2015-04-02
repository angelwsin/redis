<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form long">
	<h3>${__title}</h3>
	<div class="message">提示：
		<ol>
			<li>所有支付接口都需要设置 <span style="color:#00f;">商户号</span> 和 <span style="color:#00f;">支付密钥(或识别码)</span> 。</li>
			<li>某些支付接口可能还需要额外参数，此处预留三个备用字段来兼容不同支付接口间的参数设置。</li>
			<li>如果支付接口需要额外的参数设置，请将其<span style="color:#00f;">依次</span>填写在三个备用字段中(如无可不填写)。</li>
		</ol>
	</div>
	<form>
		<x:hidden property="channel" />
		<div><x:text property="entry.merchantID" label="*商户号" /> </div>
		<div><x:password property="entry.signKey" label="*支付密钥" /><input id="entry_signKey2" name="entry.signKey" type="text" disabled="disabled" style="display: none;" > &nbsp; <input id="showPwd" type="checkbox" value="1" >显示支付密钥 </div>
		<div><x:text property="entry.remark" label="备用字段1" /> </div>
		<div><x:text property="entry.remark1" label="备用字段2" /> </div>
		<div><x:text property="entry.remark2" label="备用字段3" /> </div>
		<div><x:checkbox name="entry.enabled" items="{'true':'启用'}" label="是否启用" values="${entry.enabled ? 'true':'false'}" /> </div>
		<div class="toolbar">
			<input type="button" id="btnOK" value="保存">
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#btnOK").click(function() {
				var $form = $("form"), flag = $form.v({
					"entry.merchantID": "required",					
					"entry.signKey": "required"					
				});
				flag && $.ajaxMessage("", $form.serialize());
			});
			var signKey = $("#entry_signKey"), signKey2 = $("#entry_signKey2");
			$("#showPwd").click(function(){
				var checked = this.checked;
				signKey.prop("disabled", checked).toggle(!checked).next().prop("disabled", !checked).toggle(checked);
				if(checked) signKey2.val( signKey.val() );
				else signKey.val( signKey2.val() );
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>