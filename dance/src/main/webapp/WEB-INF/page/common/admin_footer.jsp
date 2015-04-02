<%@ page language="java" pageEncoding="UTF-8"%>
<c:if test="${pageScope.ignoreHeader == null}">
			</div>
		</section>
		<div class="clearfix"></div>
	</div>
</c:if>
<script type="text/javascript">
var root = "${root}";
</script>
${jsCode}
<x:script output="true" />
</body>
</html>
