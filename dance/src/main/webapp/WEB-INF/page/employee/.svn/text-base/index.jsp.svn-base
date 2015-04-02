<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
    <c:forEach items="${requestScope.employees}" var="o">
    	 <br> ${o.name} ${o.dept.name} ${o.dept.count} ${o.address}
    	 <c:forEach items="${o.goodsList}" var="g">
    	 	| ${g.goodsName}
    	 </c:forEach>
    </c:forEach>
  </body>
</html>
