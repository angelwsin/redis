<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<div class="user-right">
			<%@ include file="/WEB-INF/page/tab/security_tab.jsp"%>
			<c:if test="${user.realNameCertified||userFile.status>=0}">
				<div class="post-form">
					<div class="user-content">
						<div class="message">${user.realNameStauts==1?'您已经通过了实名认证':'您的认证信息已提交审核'}，如要修改请跟客服联系。</div>
						<div class="user-article">
							<ul>
								<li><label>用户名</label>：${sessionUser.username}</li>
								<li><label>姓名</label>：${sessionUser.realName}</li>
								<li><label>性别</label>：${sessionUser.sex_}</li>
								<li><label>出生日期</label>：${sessionUser.birthday_}</li>
								<li><label>证件类别</label>：${sessionUser.certType_}</li>
								<li><label>证件号码</label>：${sessionUser.certNo}</li>
								<li><label>籍贯</label>：${sessionUser.location}</li>
							</ul>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty userFile||userFile.status==-1}">
				<div class="user-content">
					<div class="post-form">
						<form action="${root }/user/realNameActive" method="post" enctype="multipart/form-data">
							<div class="user-article">
								<ul>
									<li><x:text property="user.realName" label="*姓名" /></li>
									<li><x:radio property="user.sex" metaType="sex" label="*性别" value="1" /></li>
									<li><x:text property="user.birthday" id="birthday" readonly="readonly" cssClass="date" label="*出生日期" /></li>
									<li><x:select id="certType1" property="user.certType" metaType="certType" label="*证件类型" /></li>
									<li><x:text property="user.certNo" label="*证件号码" /></li>
									<li><label><em>*</em>籍贯</label>：<select class="pubinput" id="cmbProvince" name="province"></select> <select class="pubinput" id="cmbCity" name="city"></select> <select class="pubinput" id="cmbArea" name="area"></select></li>
									<li><label><em>*</em>证件正面上传</label>：<input type="file" name="upload" id="upload1" /></li>
									<li><label><em>*</em>证件反面上传</label>：<input type="file" name="upload" id="upload2" /> <span>上传文件总大小不得超过2M</span></li>
								</ul>
								<div class="toolbar">
									<input id="submitBtn" type="button" onclick="submitForm()" value="确认提交">
								</div>
							</div>
						</form>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<x:js path="date" />
<x:js path="jsAddress.js" />
<x:script>
	<script type="text/javascript">
		$(function() {
			addressInit('cmbProvince', 'cmbCity', 'cmbArea');
		});
		v.define({
			certType : {
				text : function() {
					return $("#certType1").val() > 0
				},
				message : "请选择一个有效的证件类型"
			},
			upload : {
				extend : "file",
				text : function() {
					var fileReg = new RegExp("\\.(jpg|jpeg|gif|png|bmp)$", "i");
					var $upload2 = $("#upload2");
					return $("#upload1").val() != "" && fileReg.test($upload2.val())
				},
				message : "请上传jpg、png、gif格式的证件正反面照，并且图片总大小不得大于2M。"
			},
			chinese : {
				text : function(value) {
					return /^[\u2E80-\u9FFF]+$/.test(value);
				},
				message : "姓名请输入中文。"
			},
			certNo : {
				text : function(value) {
					if ($("#certType1").val() == 1) {
						if (!/^\d{17}(\d|X|x)$/.test(value)) {
							$.alert("身份证格式错误。");
							return false;
						} else if ($("#birthday").val().replace(/-/g, '') != value.substr(6, 8)) {
							$.alert("身份证号码和出生日期不匹配。");
							return false;
						}
					}
					return true;
				},
				message : ""
			}
		});
		function submitForm() {
			var flag = $("form").v({
				"user.realName" : "chinese",
				"user.birthday" : "required",
				"user.certType" : "certType",
				"user.certNo" : "certNo",
				"upload" : "upload"
			});
			if (flag) {
				$.confirm("请确认实名信息是否无误。", function() {
					$("form").submit();
				})
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>