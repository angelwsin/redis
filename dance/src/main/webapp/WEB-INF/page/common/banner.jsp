<%@ page language="java" pageEncoding="UTF-8"%>
<x:js path="banner.js" />
<div>
	<ul class="slider" id="slider" style="display: block;">
		<c:forEach var="b" items="${banner}">
			<li data-opacity="0.2" style="background:#F2F2F2 url(${b.pic_}) no-repeat center"><a target="_blank" href="${b.url}"></a></li>
		</c:forEach>
		<%-- <li data-opacity="0.2" style="background:#F2F2F2 url(${root}/public/image/new-banner1-2.jpg) no-repeat center"><a target="_blank" href="${root}/news/?post.id=185">a</a></li>
		<li data-opacity="0.2" style="background:#F2F2F2 url(${root}/public/image/banner3.png) no-repeat center"><a target="_blank" href="${root}/news/?post.id=172">b</a></li>
		<li data-opacity="0.2" style="background:#F2F2F2 url(${root}/public/image/new-banner1.jpg) no-repeat center"><a href="#">c</a></li>
		<li data-opacity="0.2" style="background:#F2F2F2 url(${root}/public/image/banner-4-2000.jpg) no-repeat center"><a href="#">d</a></li> --%>
	</ul>
</div>