<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<x:js path="date" />
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<div class="user-title">安全管理</div>
			<div class="user_safe">
				<div class="user_safe_jd">
					<div class="user_safe_jd_left">
						<img src="${root}/public/image/safe.png">
					</div>
					<div class="user_safe_jd_right">
						<h3>
							资料完善度：<em style="color:#4793de;">${processDesc}</em>
						</h3>
						<div class="user_safe_jd_right_d">
							<span style="width:${process}%;"></span>
						</div>
					</div>
				</div>
				<div class="user_safe_jd_right_rz">
					<ul>
						<li>
							<dd>
								<img src="${root}/public/image/pw.png">
							</dd>
							<dd>
								<h3>登录密码</h3>
								<p>登录${_siteConfig.siteName}投资账户时需要输入的密码</p>
							</dd>
							<dt>
								<a href="${root}/user/changePwd" class="user_safe_edit">修改</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/jf${user.password==user.payPassword?'2':''}.png">
							</dd>
							<dd>
								<h3>支付密码</h3>
								<p>投标或者提现时需要输入的密码</p>
							</dd>
							<dt>
								<a href="${root}/user/changePayPwd" class="user_safe_edit">修改</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/sm${user.realNameCertified ? '' : '2'}.png">
							</dd>
							<dd>
								<h3>实名认证</h3>
								<p>您认证的实名必须与您绑定银行卡的开户名一致，否则将无法成功提现。</p>
							</dd>
							<dt>
								<a href="${root}/user/realNameActive" class="user_safe_edit">${user.realNameCertified ? '查看' : '设置'}</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/phone${user.phoneCertified ? '' : '2'}.png">
							</dd>
							<dd>
								<h3>手机认证</h3>
								<p>绑定手机，账户资金变动实时通知</p>
							</dd>
							<dt>
								<a href="${root}/user/phoneActive" class="user_safe_edit">${user.phoneCertified ? '查看' : '设置'}</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/email${user.emailCertified ? '' : '2'}.png">
							</dd>
							<dd>
								<h3>邮箱认证</h3>
								<p>绑定邮箱，轻松梳理理财信息</p>
							</dd>
							<dt>
								<a href="${root}/user/emailApprove" class="user_safe_edit">${user.emailCertified ? '查看' : '设置'}</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/email.png">
							</dd>
							<dd>
								<h3>信用认证</h3>
								<p>信用认证</p>
							</dd>
							<dt>
								<a href="${root}/user/credit" class="user_safe_edit">设置</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/bank${empty bank ? '2' : ''}.png">
							</dd>
							<dd>
								<h3>银行卡</h3>
								<p>提现时需要用到的银行账户（仅限借记卡），一经绑定，不能随意修改</p>
							</dd>
							<dt>
								<a href="${root}/user/bank" class="user_safe_edit">${empty bank ? '设置' : '查看'}</a>
							</dt>
						</li>
						<li>
							<dd>
								<img src="${root}/public/image/vip${user.vip ? '':'2'}.png">
							</dd>
							<dd>
								<h3>VIP认证</h3>
								<p>选择专属客服，成为VIP会员，本金有保障，享受贴心会员服务</p>
							</dd>
							<dt>
								<a href="${root}/user/vipActive" class="user_safe_edit">${user.vip ? '查看' : '设置'}</a>
							</dt>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>