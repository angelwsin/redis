<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="${root}/public/js/uploadify/uploadify.css" output="true" />
<x:js path="date: uploadify/jquery.uploadify.min.js"/>
<div class="post-form long-label">
	<form id="editBorrow">
		<ul>
			<li><x:text property="b.title" maxlength="24" label="借款标标题" cssClass="long" /></li>
			<li><x:select property="b.type" metaType="borrowType" group="ordinary" label="标的类型" /></li>
			<li><x:select property="b.use" metaType="borrowUse" label="借款用途" /></li>
			<li><x:text property="b.borrowLimit" label="期限" /> ${b.day ? '天':'个月' }</li>
			<li><x:text property="b.account" label="借款金额" formatter="int" disabled="true" />元</li>
			<li><x:text property="b.apr" label="年利率" />%</li>
			<li><x:select property="b.interestMethod" metaType="interestMethod" label="计息方式" /> <span id="interestMethod" class="hide"> <x:select property="b.interestMethod1" metaType="interestMethod1" /> 天
			</span> <span id="beginTime" class="hide"><x:text property="b.beginTime" cssClass="datetime min-now" formatter="datetime" placeholder="计息时间" /></span></li>
			<li><x:select property="b.style" metaType="borrowStyle" label="还款方式" /></li>
			<c:if test="${b.type==3}">
				<li><x:select items="${institutions}" property="b.institution.id" headerLabel="请选择" itemLabel="value.name" itemValue="value.id" label="担保机构" /></li>
			</c:if>
			<li><x:text property="b.minAccount" label="最小投金额" formatter="int" />元</li>
			<li><x:text property="b.maxAccount" label="最大投金额" formatter="int" />元</li>
			<li><x:text property="b.openBuyTime" label="开放购买时间" cssClass="datetime min-now" formatter="datetime" /></li>
			<c:if test="${b.type!=5}">
				<li><x:select property="b.validTime" metaType="validTime" label="有效时间" /></li>
			</c:if>
			<c:if test="${b.type==5}">
				<li><x:text property="b.validTime" label="流转周期" cssClass="small" />个月</li>
			</c:if>
			<li><x:text property="b.award" label="投标奖励" cssClass="small" />% * 投标金额</li>
			<li><label for="isDxb">是否为定向标</label>：<input id="isDxb" type="checkbox" value="1"></li>
			<li><x:text property="b.dxbPwd" label="定向标密码" /></li>
			<li><label for="isZdmb">是否自动满标</label>：<input id="isZdmb" type="checkbox" value="1"></li>
			<li><x:select items="${vestUsers}" property="b.vestUser.id" itemLabel="value.username" itemValue="value.id" label="投标用户" /></li>
			<li>
				<x:select property="fileType" items="${fileTypes}" label="借款资料类型" itemValue="value" itemLabel="value.desc" headerLabel="借款图片" /> <input id="file_upload" type="button" value="上传文件" >
			</li>
			<div><span class="preview">图片预览</span> <input id="btnRemove" type="button" value="删除" > (点击图片可选中/取消选中图片)</div>
			<x:imageTab types="${fileTypes}" imageMap="${imageMap}" logo="${b.logo}" />
			<li><x:textarea property="b.riskControl" label="风控措施 " /></li>
			<li><x:textarea property="b.summary" label="项目详情" /></li>
			<x:hidden property="b.id" />
			<x:hidden property="b.user.id" />
			<x:hidden property="b.addIp" />
			<x:hidden property="b.repaymentInterest" />
			<x:hidden property="b.repaymentAccount" />
			<x:hidden property="b.repaySource" />
			<x:hidden property="b.projectIntro" />
		</ul>
		<div class="toolbar">
			<input type="button" id="submit" value="提交" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		var dxbPwd = "${b.dxbPwd}";
		$(function() {
			var type = "${b.type}";
			//秒标
			if (type == 6) {
				$("#b_interestMethod").val(2).prop("disabled", true);
			} else if (type == 5) { //流转标
				$("#b_interestMethod").val(4).prop("disabled", true);
			}
			// 计息方式
			$("#b_interestMethod").change(function(result) {
				$("#interestMethod").toggle(result = this.value == 1).prop("disabled", !result);
				$("#beginTime").toggle(result = this.value == 3).prop("disabled", !result);
			}).trigger("change");
			// 定向标密码
			$("#isDxb").click(function() {
				var $dxbPwd = $("#b_dxbPwd").prop("disabled", !this.checked).parent().toggle(this.checked);
			}).triggerHandler("click");
			if (dxbPwd != "") {
				$("#isDxb").click();
			}
			// 自动满标
			$("#isZdmb").click(function() {
				var $dxbPwd = $("#b_vestUser_id").prop("disabled", !this.checked).parent().toggle(this.checked);
			}).triggerHandler("click");
			// 投标奖励
			if ($("#b_award").val() > 0) {
				$("#hasBorrowAward").prop("checked", true);
			}
			// 期限为天
			$("[name='b.isDay']").click(function() {
				var $bStyle = $("#b_style");
				$bStyle.prop("disabled", this.value == "1" && $bStyle.val("1"));
			}).triggerHandler("click");
			v.define({
				maxAccount : {
					extend : "+int",
					compare : "this <= #b_account",
					message : {
						compare : "{label}不能大于借款总额!"
					}
				},
				account : {
					format : "number",
					range : "[500,10000000]"
				},
				dxbPwd : {
					preFilter : function() {
						return $("#isDxb").prop("checked");
					},
					length : "[6,16]"
				},
				award : {
					preFilter : function() {
						return $("#hasBorrowAward").prop("checked");
					},
					format : "number/money",
					length : "(0,40]"
				},
				apr : {
					format : "number/money",
					range : "(0,24]"
				},
				interestMethod1 : {
					preFilter : function() {
						return $("#b_interestMethod").val() == 1;
					}
				},
				beginTime : {
					preFilter : function() {
						return $("#b_interestMethod").val() == 3;
					}
				}
			});
			$("#submit").click(function() {
				/* if ($("#isExperience").prop("checked")) {
					if (!confirm("确认要设置要体验标?设置为体验标后，投资人只能用体验金来投")) {
						return false;
					}
					$("#b_type").val("1");
				} */
				var flag = $("form").v({
					"b.title" : "required",
					"b.type" : "required",
					// "b.product.id" : "required",
					"b.use" : "required",
					"b.borrowLimit" : "+int",
					"b.account" : "account",
					"b.apr" : "apr",
					"b.interestMethod" : "required",
					"b.interestMethod1" : "interestMethod1",
					"b.beginTime" : "beginTime",
					"b.style" : "required",
					"b.minAccount" : "+int",
					"b.maxAccount" : "maxAccount",
					"b.openBuyTime" : "required",
					"b.validTime" : "required",
					"b.dxbPwd" : "dxbPwd",
					"b.vestUser.id" : {
						preFilter : function() {
							return $("#isZdmb").prop("checked");
						}
					},
					"b.award" : "award",
					"b.summary" : "required",
					"b.riskControl" : "required"
				});
				if (flag) {
					if ($("#isZdmb").prop("checked")) {
						if (!confirm("请确保该自动满标用户的账户资金充足，否则可能无法正常自动满标！")) {
							return false;
						}
					}
					if (!$("#isDxb").prop("checked")) {
						$("#b_dxbPwd").val("");
					}
					$.ajaxMessage("${root}/admin/borrow/edit", $("#editBorrow").serialize(), function(json) {
						if (json.status == "OK") {
							window.location.href = "${root}/admin/borrow/verifyList?b.status=0";
						}
					});
				}
			});
			
			$("#file_upload").uploadify({
				buttonText : "上传图片",
				fileSizeLimit : "2MB", // 每个文件最大2MB，0表示无限制
				fileObjName : "model.upload", // 服务器端接收的文件参数名称
				fileTypeExts : "*.gif; *.jpg; *.jpeg; *.png; *.bmp", // 服务器端接收的文件类型
				fileTypeDesc : "不大于2MB的图片文件", // 服务器端接收的文件类型
		        swf : "${root}/public/js/uploadify/uploadify.swf",
		        preventCaching : false,
		        uploader : "${root}/admin/file-manager/upload;jsessionid=${pageContext.session.id}",
		        formData : {borrowId: "${b.id}"},
		        height : "25",
		        onDialogClose : function(queueData){
		        	var $fileType = $("#fileType"); 
		        	if( $fileType.prop("selectedIndex") < 7){
		        		if( queueData.filesQueued > 1 ){
			        		$("#file_upload").uploadify("cancel", "*");
			        		$.alert("当前资料类型只允许上传一张图片！");
		        		}else if( queueData.filesQueued == 1 ){
		        			var fileType = $fileType.val() || "borrowLogo";
		        			if( $("#" + fileType + " img" ).length ){
				        		$("#file_upload").uploadify("cancel", "*");
				        		$.alert("当前资料类型只允许上传一张图片，请删除之前上传的图片再上传！");
		        			}
		        		}
		        	}
		        },
		        onUploadStart : function(file){
		        	$("#file_upload").uploadify("settings", "formData", {
		        		borrowId: "${b.id}",
		        		fileType: $("#fileType").val()
		        	});		        	
		        },
		        onUploadSuccess : function(file, data, response){
		        	data = $.parseJSON(data);
		        	console.log(data);
		        	$("#" + (data.assocType || "borrowLogo")).append('<img file_id="' + data.fileId + '" src="' + data.fileURI + '">');
		        },
		        onFallback : function() {
		            $.alert("您的浏览器尚未安装FLASH控件，无法上传图片！请安装后再试。");
		        }
		    });
			
			$("ul.tab-header li").click(function(){
				var $me = $(this);
				var activeClass = "active";
				if( !$me.hasClass(activeClass) ){
					$me.addClass(activeClass).siblings().removeClass(activeClass);
					$("#image_panel .tab-page:eq(" + $me.index() + ")").show().siblings().hide();
				}
			});
			
			$("#image_panel").on("click", "img", function(){
				$(this).toggleClass("selected");
			});
			
			$("#btnRemove").click(function(){
				var $images = $("img.selected");
				if($images.length){
					$.confirm("您确认要删除选中的" + $images.length +"张图片？", function(){
						var args = "borrowId=${b.id}"
						$images.each(function(){
							args += "&id=" + $(this).attr("file_id");
						});
						$.ajaxMessage("${root}/admin/file-manager/remove", args, function(json){
							if(json.status == "OK"){
								$images.remove();
							}
						});
					});										
				}else{
					$.alert("请先点击图片以选择需要删除的图片！");
				}
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>