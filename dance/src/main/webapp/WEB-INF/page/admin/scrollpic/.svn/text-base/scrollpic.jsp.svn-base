<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form medium long-label">
	<form action="${root}/admin/scrollpic/edit" method="post" enctype="multipart/form-data">
		<x:hidden property="scrollpic.id" />
		<div>
			<x:text property="scrollpic.url" label="图片URL" maxlength="250" />
		</div>
		<div>
			<x:text property="scrollpic.title" maxlength="50" label="图片标题" />
		</div>
		<div>
			<x:text property="scrollpic.order" label="图片顺序" maxlength="250" />
		</div>
		<c:if test="${scrollpic.id==0}">
			<div>
				<x:select property="scrollpic.type" label="图片类型" items="${types}" itemLabel="value.desc" itemValue="value"/>
			</div>
		</c:if>
		<c:if test="${scrollpic.id!=0}">
			<div>
				<label>图片类型</label>：<span>${scrollpic.type}图片</span>
				<x:hidden property="scrollpic.type" />
			</div>
		</c:if>
		<div>
			<label>上传图片</label>：<input type="file" id="file" name="model.upload" /> <x:hidden property="scrollpic.pic" />
		</div>
		<c:if test="${not empty scrollpic.pic}">
			<div>
				<label></label><img src="${scrollpic.pic_}" />
			</div>
		</c:if>
		<div>
			<x:radio metaType="enableStatus" property="scrollpic.status" label="启动状态" />
		</div>
		<div class="toolbar">
			<input id="submit" type="submit" value="提交" /><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script>
		$("#file").bind("change", function() {
			$("#scrollpic_pic").val(this.value);
		});
		v.define("orderFormat", {
	    	format: "number",
	    	pre:"trimAll,flush",
	    	message: {
	    		"format": "{label}必须是数字!"
	    	}
	    });
		$(function() {
			$("form").v("submit", {
				"scrollpic.type" : "required",
				"scrollpic.order":"orderFormat",
				"model.upload" : "file"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
