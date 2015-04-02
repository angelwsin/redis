<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <script type="text/javascript" src="<%=basePath%>public/js/jquery-1.11.1.min.js"></script>
      <script type="text/javascript">

         $(function(){
          $("#sub").click(function(){
        	  
        	  $.post("/myzx/borrow/ajaxmethod",{"username":$("#user").val()},function(data){
        		  alert(data);
        	  });
          });
        	
         });
   </script>

  </head>
  
  <body>
  <form action="/myzx/borrow/show" >
    username <input type="text" name="username" /><br>
     password<input type="text" name="pwd"/></br>
     <input type="submit"  value="提交"/>
     
      <x:text label="姓名" placeholder="名字不能为空" name="username"/><br>
      
      
  </form>
   <input id="ajax" type="text" name="username" id="user"/><br>
     <input id="sub" type="button" value="ajaxSubmit">
     
  </body>
 
</html>
