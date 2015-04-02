<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search">
	<h2>筛选投资项目</h2>
	<div class="search-wrap">
		<ul>
			<li><dl>标的类型
				</dl> <c:forEach items="${borrowTypes}" var="t" varStatus="ts">
					<a href="${root}/borrow/list?filter=${ts.index}_${f2}_${f3}_${f4}"><dt ${ts.index == f1 ? ' class="search-hover"':'' }>${t}</dt></a>
				</c:forEach></li>
			<li><dl>投资金额
				</dl> <c:forEach items="${borrowAccounts}" var="t" varStatus="ts">
					<a href="${root}/borrow/list?filter=${f1}_${ts.index}_${f3}_${f4}"><dt ${ts.index == f2 ? ' class="search-hover"':'' }>${t}</dt></a>
				</c:forEach></li>
			<li><dl>年化利率
				</dl> <c:forEach items="${borrowAprs}" var="t" varStatus="ts">
					<a href="${root}/borrow/list?filter=${f1}_${f2}_${ts.index}_${f4}"><dt ${ts.index == f3 ? ' class="search-hover"':'' }>${t}</dt></a>
				</c:forEach></li>
			<li><dl>借款期限
				</dl> <c:forEach items="${borrowLimits}" var="t" varStatus="ts">
					<a href="${root}/borrow/list?filter=${f1}_${f2}_${f3}_${ts.index}"><dt ${ts.index == f4 ? ' class="search-hover"':'' }>${t}</dt></a>
				</c:forEach></li>
		</ul>
	</div>
</div>
<div class="invest">
	<h2>理财列表</h2>
	<%@include file="/WEB-INF/page/common/borrow_items.jsp"%>
	<x:page simple="true" />
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>