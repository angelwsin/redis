
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<h3>text</h3>
<x:text property="user.username" /><br>
<x:text name="birthday" property="date" placeholder="请输入生日" formatter="datetime" /><br>
<h3>password</h3>
<x:password id="textarea_password" property="username" /><br>
<h3>textarea</h3>
<x:textarea id="textarea_name" property="username" /><br>
<h3>out标签</h3>
<x:out property="username" /><br>
<x:out property="username" escape="true" /><br>
<x:out property="script" escape="true" /><br>
<h3>复选框</h3>
<x:checkbox property="xxx" cssClass="hello" metaType="province" /> <br>
<x:checkbox name="province_checkbox2" metaType="province" values="四川省,广东省" inverse="true"  /> <br>
<x:checkbox name="province_checkbox3" items="['张三', '李四', '王五']" values="2"  /> <br>
<x:checkbox name="province_checkbox4" items="${users}" values="2" itemLabel="value.username" itemValue="value.id"  /> <br>
<h3>单选框</h3>
<x:radio name="province_radio" metaType="province" value="2"  /> <br>
<x:radio property="user.id" items="${users}" itemLabel="value.username" itemValue="value.id" />
<%@ include file="/WEB-INF/page/common/footer.jsp" %>
