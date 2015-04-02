<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_tendertab.jsp"%>
			<div class="user-content">
				<div class="message">
					成功投资总额：${AccountTender}<span style="padding-left:10px; color: blue;">( 注意：您最近的部分投资可能需要等待该借款满标并审核通过后才能显示！ )</span>
				</div>
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标题</th>
							<th>投标金额</th>
							<th>投标时间</th>
							<th>年利率</th>
							<th>期限</th>
							<th>应收本息</th>
							<th>应收利息</th>
							<th>我要转让</th>
							<th>借款协议书</th>
						</tr>
						<c:forEach items="${page.list}" var="bt">
							<tr height="35px">
								<td>${bt.borrow.link}</td>
								<td>${bt.tenderAccount_}</td>
								<td>${bt.addTime_}</td>
								<td>${bt.borrow.apr_0}</td>
								<td>${bt.borrow.borrowLimit_}</td>
								<td>${bt.repaymentAccount_0}</td>
								<td>${bt.repaymentInterest_0}</td>
								<td>
								<c:choose>
									<c:when test="${bt.transStatus_=='canTrans'}">
										<input type="button" id="submit" value="我要转让" onclick="repayment(${bt.id})" />
									</c:when>
									<c:otherwise>
										${bt.transStatus_}
									</c:otherwise>
								</c:choose>
								</td>
								<td>${bt.borrow.protocolLink}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<x:page simple="true" />
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function repayment(i) {
			$.layer({
				type : 2,
				shadeClose : true,
				title : false,
				closeBtn : [ 0, true ],
				shade : [ 0.8, '#000' ],
				border : [ 0 ],
				offset : [ '20px', '' ],
				area : [ '720px', '600px' ],
				scrolling : 'no',
				iframe : {
					src : '${root}/user-borrow/transBorrow?tenderId=' + i
				}
			})
		};
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>