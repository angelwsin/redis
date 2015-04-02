
<%@ page language="java" pageEncoding="UTF-8"%>
<div class="tab-title">
	<ul class="title-list" current="${tabOrder}">
 <li><a href="${root}/user-borrow/tenderList?b.status=3">已投资的借款</a></li>
				<li><a href="${root}/user-borrow/tenderList?b.status=-4">失败的投资借款</a></li>
				<li><a href="${root}/user-borrow/collectionList?bc.status=0">未收款明细</a></li>
				<li><a href="${root}/user-borrow/collectionList?bc.status=1">已收款明细</a></li>
		<p><b></b></p>
	</ul>
</div>