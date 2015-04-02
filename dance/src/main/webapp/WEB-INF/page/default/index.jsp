<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<%@ include file="/WEB-INF/page/common/banner.jsp"%>
<div class="wrap">
	<div class="stat">
		<ul>
			<li class="br"><dl>
					<img src="${root}/public/image/stat-1.png">
				</dl>
				<dt>
					<p>
						<em>${sumRegister}</em>人
					</p>
					<p>成为明扬在线的一员</p>
				</dt></li>
			<li class="ml20 br"><dl>
					<img src="${root}/public/image/stat-2.png">
				</dl>
				<dt>
					<p>${sumCollections}</p>
					<p>累积获得利息</p>
				</dt></li>
			<li class="ml20 br"><dl>
					<img src="${root}/public/image/stat-3.png">
				</dl>
				<dt>
					<p>${sumTenders}</p>
					<p>总成交金额</p>
				</dt></li>
			<li class="ml20"><dl>
					<img src="${root}/public/image/stat-4.png">
				</dl>
				<dt>
					<p>安全运营时间</p>
					<p>
						<em>275</em>天
					</p>
				</dt></li>
		</ul>
	</div>
</div>
<div class="wrap">
	<div class="list">
		<h2>
			<span><a href="${root}/news/aboutUs">关于我们></a></span>为什么选择${_siteConfig.siteName}?
		</h2>
		<ul>
			<li><img src="${root}/public/image/list-1.png">
				<h3>0风险的网上理财</h3>
				<p>
					<em>7道</em>审核、<em>FICO</em>评分、
				</p>
				<p>
					机构<em>全额担保</em>
				</p></li>
			<li><img src="${root}/public/image/list-2.png">
				<h3>高收益也可以低门槛</h3>
				<p>
					<em>30</em>倍银行存款利息，
				</p>
				<p>
					<em>50</em>元起步，<em>0</em>手续费
				</p></li>
			<li><img src="${root}/public/image/list-3.png">
				<h3>简单4步快捷理财</h3>
				<p>
					快速充值<em>提现</em>，
				</p>
				<p>
					更<em>高效</em>，易<em>操作</em>，更<em>便捷</em>
				</p></li>
			<li><img src="${root}/public/image/list-4.png">
				<h3>随时随地赎回投资</h3>
				<p>突然急用钱想收回投资？</p>
				<p>
					<em>2</em>步搞定，最快<em>当天到账</em>
				</p></li>
		</ul>
	</div>
</div>
<div class="wrap">
	<div class="index">
		<div class="index-left index-borrow-list">
			<h2>
				<span><a href="${root}/borrow/list">查看更多></a></span>理财列表
			</h2>
			<%@include file="/WEB-INF/page/common/borrow_items.jsp"%>
		</div>
		<div class="index-right">
			<div class="news-list">
				<h2>
					<span><a href="${root}/news/more?flag=最新公告">more></a></span>通知公告
				</h2>
				<ul>
					<c:forEach items="${notice}" var="n">
						<li><a href="${root}/news/?post.id=${n.id}">${n.title_}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="news-list mt20">
				<h2>
					<span><a href="${root}/news/more?flag=媒体报道">more></a></span>公司资讯
				</h2>
				<ul>
					<c:forEach items="${info}" var="n">
						<li><a href="${root}/news/?post.id=${n.id}">${n.title_}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="lilv mt20">
				<h2>
					<span><em>数据来源：某某理财网（按周统计）</em></span>收益对比
				</h2>
				<img src="${root}/public/image/lilv.png">
			</div>
			<div class="rank mt20">
				<h2>理财风云榜</h2>
				<ul>
					<li><dl class="w50">排名
						</dl>
						<dd class="w100">用户名</dd>
						<dt class="w145">投资金额</dt></li>
					<c:forEach var="tender" items="${totalTenderRank}" varStatus="status">
						<li><dl class="w50">
								<em>${status.count}</em>
							</dl>
							<dd class="w100 cblue">${tender[0]}</dd>
							<dt class="w145 saffron">${tender[1]}</dt></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<div id="floattools" class="float0831">
	<div id="divfloattoolsview" style="display: block;" class="floatr">
		<div class="tp"></div>
		<div class="cn">
			<ul>
				<li class="top">
					<h3 class="titzx">qq咨询</h3>
				</li>
				<li><span class="icozx">在线咨询</span></li>
				<c:forEach var="kf" items="${keFu}">
					<li><a class="qqon" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${kf.QQ}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:151621293:52" alt="${kf.nickname}" title="${kf.nickname}" data-bd-imgshare-binded="1"><span style="position:relative;top:-6px;left:10px;">${kf.nickname}</span></a></li>
				</c:forEach>
			</ul>
			<ul>
				<li>工作日:</li>
				<li><span style="font-weight:bold;font-size:14px;color:#ff6600;">09:00-21:00</span></li>
				<li>周末:</li>
				<li><span style="font-weight:bold;font-size:14px;color:#ff6600;">10:00-18:00</span></li>
			</ul>
		</div>
	</div>
	<div class="floatl">
		<a title="查看在线客服" class="btnopen" id="afloattools_show" style="display:none" onclick="openQQ()" href="javascript:void(0);">展开</a> <a title="关闭在线客服" class="btnctn" id="afloattools_hide" style="display:block" onclick="stopQQ()" href="javascript:void(0);">收缩</a>
	</div>
</div>
<div class="wrap">
	<div class="link-tab">
		<ul>
			<li id="li1" class="link-hover" onclick="show(1);" style="cursor:pointer;">合作商家</li>
			<li id="li2" onclick="show(2);" style="cursor:pointer;">友情链接</li>
		</ul>
	</div>
	<div class="link-wrap" id="div1">
		<ul>
			<li><a href="#" title="中国银行"><img src="${root}/public/upload/image/rx.png" /></a></li>
			<li><a href="#" title="中国平安银行"><img src="${root}/public/upload/image/pab.png" /></a></li>
			<li><a href="#" title="网贷之家"><img src="${root}/public/upload/image/wdzj.png" /></a></li>
			<li><a href="#" title="中国农业银行"><img src="${root}/public/upload/image/abc.png" /></a></li>
			<li><a href="#" title="双乾支付"><img src="${root}/public/upload/image/sq.png" /></a></li>
			<li><a href="#" title="丰付"><img src="${root}/public/upload/image/smp.png" /></a></li>
		</ul>
	</div>
	<div class="link-wrap" id="div2" style="display:none">
		<c:if test="${not empty links}">
			<ul>
				<c:forEach var="l" items="${links}">
					<li><a href="${l.siteUrl}" target="_blank" title="${l.siteName}"><img src="${l.siteLogo_}" /></a></li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>
<x:script>
	<script>
		function stopQQ() {
			$('#divfloattoolsview').animate({
				width : 'hide',
				opacity : 'hide'
			}, 'normal', function() {
				$('#divfloattoolsview').hide();
			});
			$('#afloattools_show').attr('style', 'display:block');
			$('#afloattools_hide').attr('style', 'display:none');
		}
		function openQQ() {
			$('#divfloattoolsview').animate({
				width : 'show',
				opacity : 'show'
			}, 'normal', function() {
				$('#divfloattoolsview').show();
			});
			$('#afloattools_show').attr('style', 'display:none');
			$('#afloattools_hide').attr('style', 'display:block');
		}
		function show(documentId) {
			for (var i = 1; i < 5; i++) {
				if (documentId == i) {
					document.getElementById('div' + i).style.display = '';
					document.getElementById('li' + i).className = 'link-hover';
				} else {
					document.getElementById('div' + i).style.display = 'none';
					document.getElementById('li' + i).className = '';
				}
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>