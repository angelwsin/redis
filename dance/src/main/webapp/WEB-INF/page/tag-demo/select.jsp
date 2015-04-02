<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
    ${name }
    <x:ifMode includes="add edit submit"><!-- 设置页面模式在后台setMode(TagUtil.MODE_VIEW) -->
	    ${user.username}
    </x:ifMode>
    <x:select property="pid" metaType="borrowType" /><!-- 容器启动时加载元数据到MetaPool中 在表meta_type中 -->
    <x:select id="pid1" property="pid" metaType="province" group="west" />
    <!-- group进行分组显示 -->
    <x:select property="pid" items="['张三', '李四', '王五']" itemValue="key + 1" />
    <!-- itemValue不指定按数组下标标记 可以修改使用itemValue -->
    <x:select name="pid3" items="{'abc':'谷歌', 'y':'雅虎', 'x':'微软'}" values="y" />
    <!-- select选择可以再页面选定也可以在后台设置选中如ActionContext.getContext().put("pid", "2"); -->
    <x:select name="pid4" items="['张三', '李四', '王五']"  itemValue="value" />
    <x:select property="user.id" items="${users}" itemLabel="value.username"  itemValue="value.id" />
    <!-- property属性的名字 items显示的集合，itemLabel下拉显示的内容 itemValue为value的值 -->
<%@ include file="/WEB-INF/page/common/footer.jsp" %>
