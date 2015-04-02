<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="tab-title">
	<ul class="title-list" current=${tabOrder}>
		<li><a href="${root}/leave-word/publish">发布留言</a></li>
		<li><a href="${root}/leave-word/list?l.isDelete=0">留言列表</a></li>
		<c:if test="${l ne null}">
			<c:if test="${l.id ne 0}">
				<li>查看留言</li>
			</c:if>
		</c:if>
		<p>
			<b></b>
		</p>
	</ul>
</div>