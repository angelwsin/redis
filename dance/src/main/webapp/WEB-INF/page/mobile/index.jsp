<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div href="index.jsp" class="logo" title="明杨在线"></div>
	</div>
</header>
<div class="device">
	<a class="arrow-left" href="#"></a> <a class="arrow-right" href="#"></a>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="b" items="${mobileBanner}">
				<div class="swiper-slide">
					<div class="content-slide">
						<a href="${b.url}"><img src="${b.pic_}"></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="pagination"></div>
</div>
<section>
	<div class="tongji">
		<ul>
			<li>
				<p class="sy">¥${sumCollections}</p> 理财收益已在明扬在线赚取
			</li>
			<li class="br_none">
				<p class="je">¥${sumTenders}</p> 明扬在线累计交易金额
			</li>
		</ul>
	</div>
	<div class="lc_list">
		<div class="list">
			<c:forEach items="${page.list}" var="b">
				<a href="${root}/mobile/detail?b.id=${b.id}">
					<h3>
						<span>${b.icon}</span>${b.title}
					</h3>
					<div class="lc_info">
						<ul>
							<li>年化利率<font class="fc1">${b.apr_0}</font></li>
							<li>金额<font class="fc2">${b.account_0}</font>
							</li>
							<li>期限<font class="fc2">${b.borrowLimit_}</font></li>
						</ul>
					</div>
					<div class="cont">
						<div class="loading">
							<div class="jd">
								<span class="jd_hover" style="width:${b.tenderProcess}%;"></span>
							</div>
						</div>
						<div class="lc_btn">
							<input type="button" value="立即投资">
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="tixian-wrap org">
		<dl class="blue">
			<a onclick="searchForm()"><li class="login-bottow">点击更多</li></a>
		</dl>
	</div>
</section>
<x:script>
	<script>
		var mySwiper = new Swiper('.swiper-container', {
			pagination : '.pagination',
			loop : true,
			grabCursor : true,
			paginationClickable : true
		});
		$('.arrow-left').on('click', function(e) {
			e.preventDefault();
			mySwiper.swipePrev();
		})
		$('.arrow-right').on('click', function(e) {
			e.preventDefault();
			mySwiper.swipeNext();
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>