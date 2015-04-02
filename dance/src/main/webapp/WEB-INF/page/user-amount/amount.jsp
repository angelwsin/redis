<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<div class="user-content">
				<div class="post-form">
					<ul>
						<li>
							<x:text property="uaa.user.username" label="申请人" />
						</li>
						<li>
							<x:text property="uaa.applyAmount" label="申请额度" formatter="#0.00"/>
						</li>
						<li>
							<x:text property="uaa.oldAmount" label="原来额度"  formatter="#0.00"/>
						</li>
						<li>
							<x:text property="uaa.newAmount" label="新额度"  formatter="#0.00"/>
						</li>
						<li>
							<x:text property="uaa.status_" label="状态" />
						</li>
						<li>
							<x:text property="uaa.addTime" label="申请时间" />
						</li>
						<li>
							<x:text property="uaa.addIp" label="申请人IP" />
						</li>
						<li>
							<x:text property="uaa.applyRemark" label="申请说明" />
						</li>
						<li>
							<x:text property="uaa.verifyRemark" label="审核说明" />
						</li>
						<li>
							<x:text property="uaa.verifyTime" label="审核时间" />
						</li>
						<li>
							<x:text property="uaa.verifyUser.username" label="审核人" />
						</li>
						<li>
							<x:text property="uaa.verifyIp" label="审核人IP" />
						</li>
					</ul>			
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>