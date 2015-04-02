<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="public/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="public/js/layer/layer.min.js"></script>
	<script type="text/javascript" src="public/js/jquery-util.js"></script>
	<script type="text/javascript" src="public/js/jquery-validator-1.2.min.js"></script>
  </head>
  <body>
    This is my JSP page. <br>
    <form action="/p2p/index.jsp" method="post">
    	<div><label>用户名</label>：<input id="username" name="username" type="text" /></div>
    	<div><label>密码</label>：<input id="password" name="password" type="password" /></div>
    	<div><label>确认密码</label>：<input id="repassword" name="repassword" type="password" /></div>
    	<div><label>年龄</label>：<input id="age" name="age" type="text" /></div>
    	<div><label>出生日期：</label><input id="birthday" name="birthday" type="text" /></div>
    	<div><label>手机号码</label>：<input id="cellphone" name="cellphone" type="text" /></div>
    	<input type="submit" value="提交" />
    </form>
    <script type="text/javascript">
    /*
    v.define("compareAge", {
    	compare: "this < now && this > #age",
    	propagation: true,
    	format: "date",
    	message: {
    		"format": "{label}必须是日期!",
    		"compare": "{label}必须大于当前时间，且大于出生日期"
    	}
    });
    */
    $("form").v("submit",{
    	"username":"username",
    	"password":"password"
    });
    </script>
  </body>
</html>
