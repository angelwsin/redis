<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
测试脚本内容
<x:script>
<script type="text/javascript">
var x = 25;
var name = "${name}";
alert(name);
</script>
</x:script>
<c:set scope="request" var="name" value="Hello" />
<x:script>
<script type="text/javascript">
var x = 25;
var name = "${name}";
alert(name);
</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp" %>
