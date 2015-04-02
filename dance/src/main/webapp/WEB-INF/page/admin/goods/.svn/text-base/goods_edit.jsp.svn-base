<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<x:js path="editor_config: editor: editor_zh" />
<div class="post-form">
	<form method="post" enctype="multipart/form-data">
		<div>
			<x:hidden property="gs.id" />
			<x:text property="gs.goodsName" label="商品名称" />
		</div>
		<div>
			<x:select property="gs.goodsType" metaType="goodsType" label="商品类别" />
		</div>
		<c:if test="${not empty gs}">
			<div>
				<label>商品图片</label>： <img src="${gs.goodsImg_}" />
				<x:hidden property="gs.goodsImg" />
			</div>
		</c:if>
		<div>
			<label>上传图片</label>：<input name="model.upload" id="model.upload" type="file" /><font size="2" style="color: red">*上传图片格式为185*185*</font>
		</div>
		<div>
			<x:text property="gs.price" label="市场价格" />
		</div>
		<div>
			<x:text property="gs.point" label="积分价格" />
		</div>
		<div>
			<x:text property="gs.vipPoint" label="VIP特价" />
		</div>
		<div>
			<x:textarea property="gs.goodsInfo" cssClass="editor" label="商品描述" />
		</div>
		<div>
			<x:radio property="gs.isRecommend" label="是否推荐" metaType="yesOrNo" />
		</div>
		<div>
			<x:text property="gs.openBuyTime" label="开放购买时间" cssClass="date min-now" formatter="date" />
			<span style="color:#f30;">不填写则默认为当前时间</span>
		</div>
		<div>
			<x:radio property="gs.vipOnly" label="仅限VIP购买" metaType="yesOrNo" />
		</div>
		<div>
			<x:radio property="gs.status" label="是否上架" metaType="yesOrNo" />
		</div>
		<div>
			<x:text property="gs.remain" label="商品数量" />
		</div>
		<div class="toolbar button">
			<c:if test="${empty gs.goodsName}">
				<input type="submit" id="submit" value="添加" />
			</c:if>
			<c:if test="${not empty gs.goodsName}">
				<input type="submit" id="submit" value="修改" />
			</c:if>
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("form").v("submit", {
				"gs.goodsName" : "required",
				"gs.goodsType" : "required",
				"model.upload" : {
					extend: "file",
					preFilter : function() {
						return $("#gs_id").val() == 0;
					}
				},
				"gs.price" : "money",
				"gs.point" : "+int",
				"gs.vipPoint" : "+int",
				"gs.remain" : "+int",
				"gs.point" : "+int",
				"gs.remain" : "int"
			});
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('gs_goodsInfo', {
				initialFrameWidth : 800,
				initialFrameHeight : 320
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>