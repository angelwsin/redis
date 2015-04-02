<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form">
	<form action="${root}/admin/link/edit" method="post" enctype="multipart/form-data">
		<div>
			<x:hidden property="l.id" />
			<x:text property="l.siteName" label="站点名称" />
		</div>
		<div>
			<x:text property="l.siteUrl" label="站点链接" cssClass="long" />
		</div>
		<c:if test="${not empty l}">
			<div>
				<label>站点图标</label>：<img style="width: 200px;height: 60px;" src="${l.siteLogo_}">
			</div>
		</c:if>
		<x:ifMode excludes="view">
			<div class="file-item">
				<label>上传资料</label>：<input name="model.upload" id="model.upload" type="file" />
			</div>
		</x:ifMode>
		<div>
			<x:textarea property="l.siteDesc" label="站点描述" />
		</div>
		<div>
			<x:text property="l.siteOrder" label="顺序" cssClass="small" />
		</div>
		<x:ifMode excludes="view">
			<div class="toolbar">
				<input type="submit" id="submit" value="修改" />
			</div>
		</x:ifMode>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		v.define({
			url : {
				text : /^(http(s)?:\/\/)?(www\.)?[\w-]+\.\w{2,4}(\/)?/,
				message : "必须是http(s)开头,例如：\"http://www.baidu.com\""
			},
			checkFile : {
				preFilter : function() {
					return $("#l_id").val() == 0;
				},
				extend : "file"
			}
		});
		$(function() {
			$("form").v("submit", {
				"l.siteName" : "required",
				"model.upload" : "checkFile",
				"l.siteUrl" : "url",
				"l.siteDesc" : "required",
				"l.siteOrder" : "int"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>