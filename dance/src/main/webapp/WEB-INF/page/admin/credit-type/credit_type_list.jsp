<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form action="${root}/admin/credit-type/index" method="get">
		<x:select property="type.type" id="type" items="${creditTypes}" headerLabel="全部" headerValue="-1" label="所属类型" itemLabel="value.desc" itemValue="value" />
		<x:text property="type.typeName" label="类型名称" />
		<x:select property="type.status" metaType="enableStatus" headerLabel="全部" headerValue="-1" label="状态" />
		<a class="btn" href="javascript:void(0);" onclick="$('form').submit()">查询</a> <a class="btn" href="${root }/admin/credit-type/edit">添加</a>
	</form>
</div>
<div id="credit_type_table"></div>
<x:script>
	<script> 
		var t = new Table("审核科目列表", "typeName=名称;typeFormat=格式;appWorkday=审核期(天);point=信用积分;appCost_=审核费用;addTime=创建时间;status_=状态", ${page.JSONForDate});
		t.rowLink(function() {
			return this.status == 1 ? "停用" : "启用";
		}, function() {
			return "javascript:switchStatus(" + this.typeId + ")";
		});
		t.rowLink("编辑", function() {
			return "${root}/admin/credit-type/edit?queryString=${queryString}&type.typeId=" + this.typeId;
		});
		t.rowLink("删除", function() {
			return "${root}/admin/credit-type/remove?queryString=${queryString}&type.typeId=" + this.typeId;
		});
		t.show("#credit_type_table");
		var $a;
		$("tr > .td-action:last-child > a").bind("click", function() {
			$a = $(this);
			$.confirm("确定要删除吗？", function() {
				$.ajaxMessage($a.attr("href"));
				return false;
			});
			return false;
		})
		function switchStatus(typeId) {
			$.ajaxMessage("${root}/admin/credit-type/switchStatus?type.typeId=" + typeId);
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
