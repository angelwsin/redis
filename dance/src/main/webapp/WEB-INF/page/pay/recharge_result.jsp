<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/account_bank_tab.jsp"%>
			<div class="user-content">
				<div class="recharge-message">
					<div class="message">
						<h3>您的在线充值反馈结果如下：</h3>
						<ol>
							<li><label>订单号</label>：<span class="order-no">${log.tradeNo}</span></li>
							<li><label>充值金额</label>：<span class="money">${log.money_}</span>元</li>
							<li><label>充值时间</label>：<span class="time">${log.addTime_}</span></li>
							<li><label>充值状态</label>：<span class="${log.status == 1 ? 'success' : 'error'}">${log.status == 1 ? '充值成功':'充值失败'}</span></li>
							<c:if test="${log.status != 1}">
								<li>如果您确认支付成功，但充值仍未到账，请立即与平台客服联系！</div>
							</c:if>
						</ol>
					</div>
					<div class="toolbar">
						<a class="btn" href="${root}/">返回首页</a> <a class="btn" href="${root}/user/center">返回会员中心</a> <a class="btn" href="${root}/user-account/recharge">继续充值</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>