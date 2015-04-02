<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="search-form">
	<form action="${root}/admin/goods-order/list" method="get" name="goodsForm">
		<x:text property="gso.orderNo" label="订单编号" />
		<x:text property="beginTime" label="兑换商品时间从" formatter="date" cssClass="date" />
		<x:text property="endTime" label="到" formatter="date" cssClass="date" />
		<x:select property="gso.status" metaType="yesOrNo" headerLabel="不限" headerValue="-1" label="是否发货" />
		<a class="btn" href="javascript:$('form').submit();">查询</a>
	</form>
</div>
<div id="goods_order_table"></div>
<x:script>
	<script>
		var t = new Table("商品订单列表", "orderNo=订单编号;user.username=兑换人;totalPrice=兑换总积分;receiveName=收货人;receiveAddress=收货地址;addTime=兑换时间;status_=是否发货", ${page.JSONForDate});
		t.rowTemplate("user.username", function() {
			return this.user.username;
		});
		t.rowTemplate("goodsName_", function() {
			return '<a href="${root}/admin/goods-order/sendGoods?gso.id= ' + this.id + '">' + this.orderNo + '</a>';
		});
		t.rowLink(function() {
			return this.status == 1 ? "查看" : "发货";
		}, function() {
			return "${root}/admin/goods-order/sendGoods?gso.id=" + this.id;
		});
		t.show("#goods_order_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>