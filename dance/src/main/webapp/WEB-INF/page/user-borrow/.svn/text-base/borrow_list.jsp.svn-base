<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/user_borrowtab.jsp"%>
			<div class="user-content">
				<div class="user-table">
					<table class="table">
						<tr>
							<th>标题</th>
							<th>类型</th>
							<th>还款总额</th>
							<th>年利率</th>
							<th>期限</th>
							<th>最后还款时间</th>
							<th>我要还款</th>
							<td>借款协议书</td>
						</tr>
						<c:forEach items="${page.list}" var="borrow">
							<tr height="35px">
								<td>${borrow.link}</td>
								<td>${borrow.type_}</td>
								<td>${borrow.repaymentAccount}</td>
								<td>${borrow.apr_0}</td>
								<td>${borrow.borrowLimit_}</td>
								<td>${borrow.endTime_}</td>
								<td><input type="button" id="submit" value="我要还款" onclick="repayment(${borrow.id})" /></td>
								<td>${borrow.protocolLink}</td>
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
				area : [ '740px', '640px' ],
				scrolling : 'no',
				iframe : {
					src : '${root}/user-borrow/repaymentList?bid=' + i
				}
			})
		};
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>