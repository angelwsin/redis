<%@ page contentType="text/html; charset=GBK"%> 
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%> <html> 
      <head> 
          <title><decorator:title default="装饰器页面..." /></title> 
          <decorator:head /> 
          
      </head> 
     <body> 
                 首页<hr> 
        <decorator:body /> 
        <hr>公司地址
    </body> 
</html> 