<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/goods/list" method="get" name="goodsForm">
		<x:text property="gs.goodsName" label="商品名称" />
		<x:select property="gs.isHot" metaType="yesOrNo" headerLabel="不限" headerValue="-1" label="是否热门" />
		<x:select property="gs.isRecommend" metaType="yesOrNo" headerLabel="不限" headerValue="-1" label="是否推荐" />
		<x:select property="gs.vipOnly" metaType="yesOrNo" headerLabel="不限" headerValue="-1" label="是否VIP限购" />
		<a class="btn" href="javascript:$('form').submit();">查询</a><a class="btn" href="${root}/admin/goods/edit">添加商品</a>
	</form>
</div>
<div id="goods_table"></div>
<x:script>
	<script>
		var t = new Table("商品列表", "goodsName_=商品名称;goodsType_=类别;price=市场价格;point=积分;vipPoint=VIP积分;remain=库存", ${page.JSON});
		t.rowTemplate("goodsName_", function() {
			return '<a href="${root}/admin/goods/edit?gs.id= ' + this.id + '">' + this.goodsName_ + '</a>';
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/goods/edit?gs.id=" + this.id;
		});
		t.show("#goods_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>