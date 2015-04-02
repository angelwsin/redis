<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html>
  <head>
  	<meta name="renderer" content="webkit|ie-stand" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>正在接入第三方支付页面......</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
  <body>
  	<div>正在跳转至支付页面...</div>
    <form id="payForm" action="${requestScope.payURL}" method="post">
    	<c:forEach items="${requestScope.formParams}" var="p">
    		<input name="${p.key}" type="hidden" value="${p.value}" >
    	</c:forEach>
    </form>
     <script type="text/javascript">
       document.getElementById("payForm").submit();
	 </script>
  </body>
</html>