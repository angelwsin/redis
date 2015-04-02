<%@ page language="java" pageEncoding="UTF-8"%>
<div class="search-form">
	<form id="form1">
		<x:text property="beginDate" id="beginDate" label="开始时间" formatter="date" readonly="readonly" cssClass="date max-now" />
		<x:text property="endDate" id="endDate" label="结束时间" formatter="date" readonly="readonly" cssClass="date max-now" />
		<x:text property="name" label="用户名" />
		<input type="submit" value="查询"> <input type="hidden" name="isExport" id="isExport" /><input type="button" id="export" value="导出">
	</form>
</div>
<div id="login_table"></div>
<x:js path="date" />
<x:script>
	<script type="text/javascript">
		var t = new Table("登录统计列表", "username=用户名;loginTime=最近登录时间;loginCount=登录次数;loginDetail=登录明细", ${page.JSONForDateTime});
		t.rowTemplate("username", function() {
			return this[0];
		});
		t.rowTemplate("loginTime", function() {
			return this[1];
		});
		t.rowTemplate("loginCount", function() {
			return this[2];
		});
		t.rowTemplate("loginDetail", function() {
			return '<a href="javascript:void(0)" name="detail" id="' + this[3] + '">查看</a>';
		});
		t.show("#login_table");
		v.define("compareDate", {
			required : false,
			compare : "!this || !#endDate || this <= #endDate",
			format : "date",
			message : "{label}不能大于结束时间"
		});
		$("#form1").v("submit", {
			beginDate : "compareDate"
		});
		$("a[name='detail']").click(function() {
			var userId = $(this).prop("id");
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
					src : '${root}/admin/report/loginDetail?id=' + userId
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
