<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<link href="${root}/public/js/lightbox/css/lightbox.css" rel="stylesheet" type="text/css" />
<link href="${root}/public/css/hover.css" rel="stylesheet" type="text/css" />
<x:css path="${root}/public/js/flexslider/flexslider.css" defaultDir="false" output="true" />
<x:js path="detail.js" loadFromConfig="false" />
<x:js path="flexslider/jquery.flexslider-min.js" />
<div class="detail">
	<div class="detail-wrap">
		<div class="detail-left">
			<div class="item-title">
				${b.icon}
				<h3>${b.title}</h3>
			</div>
			<div class="detail-left-list">
				<ul>
					<li><p>项目总额</p>
						<h3>
							<em>${b.account_0}</em>
						</h3></li>
					<li><p>年化收益率</p>
						<h3>
							<em>${b.apr_0}</em>
						</h3></li>
					<li><p>还款期限</p>
						<h3>
							<em>${b.borrowLimit_}</em>
						</h3></li>
				</ul>
			</div>
			<div class="detail-left-list">
				<ul>
					<li>投资奖励：${b.award_0}</li>
					<li>还需金额：&yen;${b.remainAccount_}</li>
					<li><dl>投资进度：
						</dl>
						<dt>
							<div class="detail-jd">
								<div class="detail-jd-hover" style="width:${b.tenderProcess}%;"></div>
							</div>
						</dt>
						<dt class="ml2">${b.tenderProcess}%</dt></li>
					<li>还款方式：${b.style_}</li>
					<li>计息时间：${b.interestMethod_}</li>
					<c:choose>
      					<c:when test="${not empty statusDetail}">
							<li>${statusDetail}：<span id="borrowTimeDiff" style="color:#c80000" time="${timeDiff}"></span></li>
						</c:when>
						<c:otherwise>
							<li style="visibility: hidden;">注意：无意义的文字、占位子的</li>
						</c:otherwise>
					</c:choose>	
						
					
					<li><dl>借款用途：</dl><dt>${b.use_}</dt></li>
					<li><dl>最小投标金额：</dl><dt>&yen;${b.minAccount_}</dt></li>
					<li><dl>最大投标金额：</dl><dt>&yen;${b.maxAccount_}</dt></li>
				</ul>
			</div>
		</div>
		<div class="detail-right">
			<c:if test="${not empty user}">
				<c:if test="${b.statusDetail=='canBuy'}">
					<form id="tenderForm">
						<x:hidden property="b.id" />
						<div class="detail-right-wrap">
							<ul>
								<li>可用余额：<em>${user.account.activeAccount_}</em>元
								</li>
								<li><x:text property="tenderAccount" label="投标金额" placeholder="投标金额" /></li>
								<li><x:password property="payPassword" label="支付密码" placeholder="支付密码" /></li>
								<c:if test="${!empty b.dxbPwd}">
									<li><x:password name="dxbPwd" label="定向标密码" placeholder="定向标密码" /></li>
								</c:if>
							</ul>
							<a href="#" id="submit"><i class="deepred">立即投标</i></a>
						</div>
					</form>
				</c:if>
				<c:if test="${b.statusDetail != 'canBuy'}">
					<div class="detail-right-wrap" style="margin-top:60px;">
						<i class="green">${b.statusDetail}</i>
					</div>
				</c:if>
			</c:if>
			<c:if test="${empty user}">
				<div class="detail-right-wrap">
					<ul class="detail-right-login">
						<li>用户登录后才能投标，请先<a href="${root}/user/login">登录</a></li>
						<li>还没有账号？点此立即<a href="${root}/user/register">免费注册</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</div>
<div class="jie_par">
	<div class="jk_detail fl mod">
		<div class="title">
			<h3>借款详情</h3>
		</div>
		<div class="cont">${b.projectIntro}</div>
	</div>
	<div class="jk_info fr mod">
		<div class="title">
			<h3>审核信息</h3>
		</div>
		<div class="cont" id="picbox">
			<div class="photo"><img  src="${root}/public/image/bg.gif"></div>
			<ul class="piclist">
				<c:forEach items="${rightImageMap}" var="o" varStatus="s">
					<li><img src="${root}/public/image/${s.count}.png" width="64" height="64" data-img="${empty o.value ? '' : o.value[0].fileURI}" />
						<p>${o.key.desc}</p><span>
						<c:if test="${not empty o.value}">
							<img src="${root}/public/image/rightdui.png" >							
						</c:if>
					</span></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<div class="detail-tab">
	<div class="detail-tab-title">
		<ul id="tab_header" class="tab-header">
			<li pageIndex="0" class="active-tab">质押物资料</li>
			<li pageIndex="0">授证信息</li>
			<li pageIndex="0">借款合同</li>
			<li pageIndex="0">打印凭证</li>
			<li pageIndex="0">借款记录</li>
			<li pageIndex="1">投标记录</li>
		</ul>
		<x:script>
			<script type="text/javascript">
				$(function() {
					var isLogin = ${not empty user};
					$("#tab_header").on("click", "li", function() {
						window.activeTab = window.activeTab || $("li.active-tab");
						window.activePage = window.activePage || $(".tab-page.active-page");
						window.tabPages = window.tabPages || $("#tab_content .tab-page");
						activeTab.removeClass("active-tab");
						activePage.removeClass("active-page");
						stop(activePage);
						activeTab = $(this).addClass("active-tab");
						activePage = tabPages.eq(isLogin ? activeTab.index() : activeTab.attr("pageIndex")).addClass("active-page");
						start(activePage);
					});
				});
			</script>
		</x:script>
	</div>
	<div id="tab_content">
		<c:choose>
			<c:when test="${empty user}">
				<div class="tab-page active-page">
					<div class="detail-tab-content">
						<ul>
							<li>用户登录后才能投标，请先<a href="${root}/user/login" style="color: #07519A">登录</a></li>
							<li>还没有账号？点此立即<a href="${root}/user/register" style="color: #07519A">免费注册</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${contentImageMap}" var="list" varStatus="s">
					<div class="${s.index==0? 'tab-page active-page' : 'tab-page'}">
						<c:choose>
							<c:when test="${empty list.value}">
								<div class="detail-tab-content">暂无相关图片</div>							
							</c:when>
							<c:otherwise>
								<div class="slide-wrap">
									<div class="slide-box">
										<div class="flexslider">
											<ul class="slides">
												<c:forEach items="${list.value}" var="o" varStatus="s">
													<li><img src="${o.fileURI}" /></li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="scroll-box">
										<div class="flexslider">
											<ul class="slides">
												<c:forEach items="${list.value}" var="o" varStatus="s">
													<li><img src="${o.fileURI}" /></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
				<div class="tab-page">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<c:if test="${b.status != 4}">
							<c:if test="${b.openAccount == 1}">
								<tr>
									<td rowspan="1">账户信息</td>
									<td>账户总额：${b.user.account.totalAccount_0}</td>
									<td>可用金额：${b.user.account.activeAccount_0}</td>
									<td>待收金额：${b.user.account.collectAccount_0}</td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${b.openAmount==1}">
							<tr>
								<td rowspan="1">额度信息</td>
								<td>授信额度：${b.user.userAmount.totalAmount_}</td>
								<td>可用额度：${b.user.userAmount.activeAmount_}</td>
								<td>冻结额度：${b.user.userAmount.frozenAmount_}</td>
							</tr>
						</c:if>
						<c:if test="${b.openBorrow==1}">
							<tr>
								<td rowspan="3">还款信用</td>
								<td>借款${tenderSucc}次成功</td>
								<td>${failnum}次流标/审核失败</td>
								<td>${unrepay}笔待还款</td>
							</tr>
							<tr>
								<td>${earlier}笔提前还款</td>
								<td>${timely}笔准时还款</td>
								<td>${overNum}笔迟到还款</td>
							</tr>
							<tr>
								<td>${overInnerDay}笔30天之内的逾期还款</td>
								<td>${overDay}笔超过30天的逾期还款</td>
								<td>${unrepayNum}笔逾期未还款</td>
							</tr>
						</c:if>
						<c:if test="${b.openTender==1}">
							<tr>
								<td>待收记录</td>
								<td colspan="3">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>标题</td>
											<td>期数</td>
											<td>应收金额</td>
											<td>应收时间</td>
										</tr>
										<c:forEach items="${page.list}" var="bc">
											<tr>
												<td>&nbsp;${bc.borrow.link}</td>
												<td>&nbsp;${bc.period_}</td>
												<td>&nbsp;${bc.repaymentAccount_0}</td>
												<td>&nbsp;${bc.repaymentTime_}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="3">注：公开的账户资金详情在标的借款全部还清后将自动不再公开显示。</td>
						</tr>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="tab-page">
			<c:choose>
				<c:when test="${empty borrowTenders}">
					<div class="detail-tab-content">暂无记录数</div>
				</c:when>
				<c:otherwise>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="funds graytable">
						<tr class="title">
							<th>投资人</th>
							<th>年利率</th>
							<th>投标金额</th>
							<th>投标时间</th>
						</tr>
						<c:forEach items="${borrowTenders}" var="borrowTender">
							<tr class="title">
								<td>${borrowTender.user.username_}</td>
								<td>${borrowTender.borrow.apr_0}</td>
								<td>${borrowTender.tenderAccount_0}</td>
								<td>${borrowTender.addTime_}</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript" src="${root}/public/js/lightbox/js/lightbox-2.6.min.js"></script>
	<script type="text/javascript">
		Timer({
			id : "borrowTimeDiff",
			step : -1000,
			renderCallback : function(t) {
				var html = "";
				if (t.MM > 1 || t.dd >= 10) {
					html = Math.floor(this.date.getTime() / 86400000) + "天" + t.HH + "时" + t.mm + "分";
				} else {
					html = (t.dd-1) + "天" + t.HH + "时" + t.mm + "分" + t.ss + "秒";
				}
				this.dom.html(html);
			}
		}).start();
		function start($page) {
			if (!$page.length)
				return;
			var slider = $page.data("slider");
			if (slider && slider[0].length) {
				slider[0].flexslider("play");
				slider[1].flexslider("play");
				return;
			}
			// var scrollSelector = "#div" + id + " .scroll-box .flexslider", slideSelector = "#div" + id + " .slide-box .flexslider";
			slider = [ $page.find(".scroll-box .flexslider"), $page.find(".slide-box .flexslider") ];
			if (!slider[0].length)
				return;
			$page.data("slider", slider);
			slider[0].flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : false,
				slideshow : true,
				itemWidth : 160,
				itemMargin : 5,
				asNavFor : slider[1]
			});
			slider[1].flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : false,
				slideshow : true,
				sync : slider[0]
			});
			slider[0].on("mouseover", "li", function() {
				slider[1].flexslider($(this).index());
			});
		}
		function stop($page) {
			if (!$page.length)
				return;
			var slider = $page.data("slider");
			if (slider && slider[0].length) {
				slider[0].flexslider("stop");
				slider[1].flexslider("stop");
			}
		}
		$(function() {
			start($("div.active-page"));
		});
		$(function() {
			var oPicBox = $('#picbox');
			var oPhotoImg = oPicBox.find('.photo img')
			var aPicLi = oPicBox.find('.piclist li');
			aPicLi.hover(function() {
				oPhotoImg.attr('src', $(this).find('img').attr('data-img'));
			}, function() {
				oPhotoImg.attr('src', root+'/public/image/bg.gif');
			})
		})
		$(function() {
			v.define({
				dxbPwd : {
					preFilter : function() {
						return $("#dxbPwd").length > 0;
					},
					length : "[6,16]"
				}
			});
			$("#submit").click(function() {
				var flag = $("form").v({
					"tenderAccount" : "+money",
					"payPassword" : "password",
					"dxbPwd" : "dxbPwd"
				});
				if (flag) {
					$.ajaxMessage(root + "/borrow/tender", $("#tenderForm").serialize());
				}
				return false;
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>