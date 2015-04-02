<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="shop-nav"><a href="${root}/shop/">首页</a> >> <a href="${root}/shop/query?goods.goodsType=${goods.goodsType}">${goods.goodsType_}</a> >> ${goods.goodsName}</div>
	<div class="shop">
		<div class="shop-left">
			<div class="shop-left-list">
				<h2>全部商品分类</h2>
				<ul>
					<li><a href="${root}/shop/query?goods.goodsType=1">精美礼品</a></li>
					<li><a href="${root}/shop/query?goods.goodsType=2">话费充值</a></li>
					<li><a href="${root}/shop/query?goods.goodsType=3">站内奖励</a></li>
				</ul>
			</div>
			<div class="shop-left-pm">
				<h2>兑换排行榜</h2>
				<ul>
				<c:forEach items="${tops}" var="top">
					<li><a href="${root}/shop/goods?goods.id=${top.id}"><img src="${top.goodsImg_}" /></a><dl><a href="${root}/shop/goods?goods.id=${top.id}"><h3>${top.goodsName_}</h3></a><p>&yen;${top.price}</p></dl></li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="shop-right">
			<div class="shop-search">
				<form action="${root}/shop/" id="goodsName">
					<input type="text" name="goods.goodsName" />
				</form>
				<a href="javascript:void(0);" id="search">搜&nbsp;&nbsp;索</a>
			</div>
			<div class="shop-goods">
				<div class="shop-goods-left"><img src="${goods.goodsImg_}"></div>
				<div class="shop-goods-right">
					<ul>
						<li><h3>${goods.goodsName}</h3>（商品编号：${goods.id}）</li>
						<li>普通会员积分价：${goods.point}</li>
						<li>VIP 会员优惠价：${goods.vipPoint}</li>
						<c:if test="${goods.onlyVip}">
							<li>VIP专属商品</li>
						</c:if>
						<c:if test="${goods.stockOut}">
							<li>该商品缺货中...</li>
						</c:if>
						<c:if test="${!goods.stockOut}">
							<c:if test="${goods.openBuy}">
								<form id="buyForm">
									<li>剩余：<label id="remain">${goods.remain}</label>个
									</li>
									<li>已兑换：${goods.exchanged}个</li>
									<li><label>兑换数量</label>： <input id="sale_count" type="text" value="1" name="order.goodsNum" class="small">件<input type="hidden" name="goods.id" value="${goods.id}" /></li>
									<li><a href="javascript:void(0)" onclick="buy()"><em>立即购买</em></a></li>
								</form>
							</c:if>
							<c:if test="${!goods.openBuy}">
								该商品将在 ${goods.openBuyTime_}开放兑换。
							</c:if>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="shop-goods-wrap">
				<h2>商品详情</h2>
				<div class="shop-goods-content">${goods.goodsInfo}</div>
			</div>
		</div>
	</div>
</div>
<x:script>
	<script>
		$("#signIn").click(function() {
			$.ajaxMessage("${root}/user/signIn");
			$("#signIn").hide();
		});
		$("#search").click(function() {
			$("#goodsName").submit();
		});
		$(function() {
			v.define({
				goodsNum : {
					format: "number",
					compare: "this > 0 && this <= #remain",
					message : "兑换数量必须大于0，且小于剩余数量！"
				}
			});
		});
		function buy() {
			var $form = $("#buyForm");
			var flag = $form.v({
				"order.goodsNum" : "goodsNum"
			});
			if (flag) {
				$.ajaxMessage("${root}/shop/buy", $form.serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
