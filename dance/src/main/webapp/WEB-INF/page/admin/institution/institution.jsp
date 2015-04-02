<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="post-form long-label">
	<form action="${root}/admin/institution/edit" method="post" enctype="multipart/form-data">
		<x:hidden property="institution.id" />
		<x:hidden property="page.size" />
		<x:hidden property="page.current" />
		<div>
			<x:text property="institution.name" maxlength="60" label="担保机构名称" cssClass="long" />
		</div>
		<div>
			<div>
				<x:ifMode includes="view">
					<x:textarea property="institution.desc_" label="描述" />
				</x:ifMode>
				<x:ifMode excludes="view">
					<x:textarea property="institution.desc" label="描述" />
				</x:ifMode>
			</div>
		</div>
		<div>
			<x:select property="institution.status" metaType="enableStatus" label="状态" />
		</div>
		<div class="toolbar">
			<input id="submit" type="submit" value="提交" /><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("form").v("submit", {
				"institution.name" : "required",
				"institution.status" : "required"
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>