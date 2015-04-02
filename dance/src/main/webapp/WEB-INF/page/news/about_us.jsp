<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="about">
		<div class="about-left">
			<ul>
				<c:forEach items="${posts}" var="p">
					<li ${p.id == post.id ? ' id="btn"' : ''}><a href="aboutUs?post.id=${p.id}">${p.title}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="about-right">
			<h2>${post.title}</h2>
			<c:choose>
				<c:when test="${empty page.list}">
					<div class="about-wrap">${post.content}</div>
				</c:when>
				<c:otherwise>
					<div class="news">
						<ul>
							<c:forEach items="${page.list}" var="p">
								<li><c:if test="${post.isPage}">
										<span>${p.addTime_}</span>
									</c:if>
									<a href="${root}/news/?post.postParent=${post.postParent}&post.id=${p.id}">${p.title}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<x:page simple="true" />
				</c:otherwise>
			</c:choose>			
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("#btn").addClass("clckClass");
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
