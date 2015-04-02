<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="date" />
<div class="ad-table">
	<form method="post" id="examine" action="/p2p/admin/credentials/verify">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="6">类型：${ua.metaName}</td>
			</tr>
			<tr>
				<td colspan="6">上传时间：${ua.addTime}</td>
			</tr>
			<tr>
				<td colspan="6">上传说明：${ua.content}</td>
			</tr>
			<tr>
				<td colspan="6">审核： <input type="radio" id="ua.fstatus" name="ua.fstatus" value="1" checked="checked">通过 <input type="radio" id="ua.fstatus" name="ua.fstatus" value="2">不通过
				</td>
			</tr>
			<tr>
				<td colspan="6"><x:textarea label="备注" property="ua.verifyRemark">
					</x:textarea></td>
			</tr>
			<x:hidden property="ua.id" />
			</form>
		</table>
		<p class="submit">
			<input type="submit" id="submit" value="提交" />
		</p>
</div>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
