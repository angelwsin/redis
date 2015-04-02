<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="search-form">
	<form id="form1">
		<input type="hidden" name="isExport" id="isExport" /><input type="button" id="export" value="导出">
	</form>
</div>
<div id="invite_table"></div>
<x:script>
	<script type="text/javascript">
		var t = new Table("推广统计", "0=用户名;1=注册日期;2=信用等级;3=注册时长(天);4=推广会员数;5=其中充值会员数;6=会员有效占比;7=推广会员借款总额;8=推广会员投资总额;9=提成总额;10=会员明细", ${page.JSONForDate});
		t.rowTemplate("2", function() {
			return '<img src='+this[2]+' class="level-icon">';
		});
		t.rowTemplate("10", function() {
			return '<a href="javascript: void (0);" name="detail">查看</a><input type="hidden" value="'+this[10]+'" />';
		});
		t.show("#invite_table");
		$("a[name='detail']").click(function() {
			var userId = $(this).next("input").val();
			$.layer({
				type : 2,
				shadeClose : true,
				title : false,
				closeBtn : [ 0, true ],
				shade : [ 0.8, '#000' ],
				border : [ 0 ],
				offset : [ '120px', '' ],
				area : [ '980px', '450px' ],
				iframe : {
					src : '${root}/admin/report/inviteDetail?id=' + userId
				}
			});
		});
		$("#export").click(function() {
			$("#isExport").val("OK");
			$("#form1").submit();
			$("#isExport").val("");
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
