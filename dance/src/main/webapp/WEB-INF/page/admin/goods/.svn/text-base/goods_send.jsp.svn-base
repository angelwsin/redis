<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form method="post" name="form" enctype="multipart/form-data" id="uploadForm">
		<div>
			<x:text property="gso.goods.goodsName" label="商品名称" />
		</div>
		<div>
			<x:text property="gso.orderNo" label="订单编号" />
		</div>
		<div>
			<x:text property="gso.user.username" label="兑换用户" />
		</div>
		<div>
			<x:text property="gso.goodsNum" label="兑换数量" />
		</div>
		<div>
			<x:text property="gso.unitPrice" label="商品单价" />
		</div>
		<div>
			<x:text property="gso.totalPrice" label="商品总价" />
		</div>
		<div>
			<x:text property="gso.receiveName" label="收货人姓名" />
		</div>
		<div>
			<x:text property="gso.receiveAddress" label="收货人地址" />
		</div>
		<div>
			<x:text property="gso.receivePhone" label="收货人电话" />
		</div>
		<div>
			<x:text property="gso.addTime" label="兑换时间" formatter="date" />
		</div>
		<c:if test="${gso.status == 0}">
			<div>
				<label></label><input type="submit" id="submit" value="发货" />
			</div>
		</c:if>
		<c:if test="${gso.status == 1}">
			<label></label>
			<input type="button" id="btn" value="返回" />
		</c:if>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			$("#btn").click(function() {
				location.href = "${root}/admin/goods-order/list";
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>