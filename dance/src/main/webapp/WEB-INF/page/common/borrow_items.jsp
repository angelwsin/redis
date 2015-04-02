<%@ page language="java" pageEncoding="UTF-8"%>
<div class="borrows">
	<c:forEach items="${page.list}" var="b">
		<div class="borrow-item">
			<div class="item-title">
				<h3>${b.link}</h3>
				${b.icon}<span>发标时间：${b.addTime_0}</span>
			</div>
			<div class="item-content">
				<ul>
					<li class="item-img"><img src="${b.logo_}"></li>
					<c:if test="${b.award ne 0}">
						<span class="jl"> <span>奖励</span><span class="wids">+${b.award}</span>
						</span>
					</c:if>
					<li class="item-money"><h3>${b.account_0}</h3>
						<p>借款金额</p></li>
					<li class="item-apr"><h3>${b.apr_0}</h3>
						<p>年化利率</p></li>
					<li class="item-limit"><h3>${b.borrowLimit_}</h3>
						<p>借款期限</p></li>
					<li class="item-button">
						<ul>
							<li><div class="item-proccess-wrap">
									<div class="item-proccess" style="width:${b.tenderProcess}%;"></div>
								</div>
								<span>${b.tenderProcess}%</span></li>
							<li>已投${b.tenderTimes}笔，共计${b.accountYes_1}</li>
							<li>${b.opButton}</em></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</c:forEach>
</div>