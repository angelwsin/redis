<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<x:css path="common.css: admin.css: admin-patch.css: jquery.plupload.queue.css: easyui.css" output="true" />
<x:js path="jquery" defaultDir="false" />
<x:js path="layer: jquery-util: jquery-validator: easyui: plupload: html4: html5: flash: zhCN: queue" />
<style>
</style>
<body style="padding: 0; margin: 0;">
	<div id="fileUploadTabs" class="easyui-tabs" style="width: 1000px; height: 700px;" onSelect="tabChange">
		<x:select property="bf.type" items="${borrowPicTypes}" itemLabel="value.desc" label="上传文件类别" />
		<%--<x:radio property="bf.type" items="${borrowPicTypes}" itemLabel="value.desc"  itemValue="value"  label="上传类别" />	--%>
		<div id="uploader" title="文件上传" closable="false" style="padding: 10px;">&nbsp;
		</div>
		<!--<div title="文件管理" style="padding: 10px;" style="width:700px;height:700px;" id="managerFile">
			<table id="fileUploadTable" class="easyui-datagrid" style="width: 520px; height: 280px;" pageSize="50" url="queryFileList.do" fitColumns="true">
				<thead>
					<tr>
						<th field="selected" width="30px" checkbox="true" />
						<th field="fileName" width="200px">文件名</th>
						<th field="fileType" width="80px">文件类型</th>
						<th field="fileSizeKb" width="80px">文件大小(Kb)</th>
						<th field="createDateShow" width="130px">上传时间</th>
					</tr>
				</thead>
			</table>
			<div>(待扩展)
				<button onclick="javascript:downloadFile()">下载</button>
				<button onclick="javascript:removeFile()">删除</button>
			</div>
		</div>  -->
	</div>
	<x:script>
		<script type="text/javascript">
			var root = "${root}";
		</script>
		<script type="text/javascript">
			//上传成功文件数组
			var files = [];
			// 上传出错文件数组
			var errors = [];
			// 是否分多次上传
			var chunk = false;
			// 最大文件
			var max_file_size = '${max_size}' + 'm';
			// 过滤DOC类型
			var docFilter = {
				title : "${docTitle}",
				extensions : "${docType}"
			};
			// 过滤Image类型
			var imageFilter = {
				title : "${imageTitle}",
				extensions : "${imageType}"
			};
			$('#fileUploadTabs').tabs({
				onSelect : function(title, index) {
					if (index == 1) {
						tabChange(title, index);
					}
				}
			});
			var bid = '${bid}';
			$("#uploader")
					.pluploadQueue(
							$
									.extend(
											{
												runtimes : '${runtimes}',
												url : 'uploadBorrowPic?moudleId=123&funcId=1111&dataId=111111&type='
														+ $("#bf_type").val()
														+ '',
												max_file_size : max_file_size,
												//设置上传字段的名称。默认情况下被设置为文件
												file_data_name : 'models.upload',
												unique_names : true,
												multiple_queues : true,
												rename : true,
												filters : [ docFilter,
														imageFilter ],
												flash_swf_url : '${path}/public/js/plupload/plupload.flash.swf',
												silverlight_xap_url : '${path}/public/js/plupload/Moxie.xap',
												multipart : true,
												multipart_params : {
													'urlPath' : 123456,
													'bf.borrow.id' : bid,
													'bf.type' : $("#bf_type")
															.val()
												},
												init : {
													//文件上传成功的时候触发
													FileUploaded : function(
															uploader,file,responseObject){
													
															var rs = $.parseJSON(responseObject.response);
														
															if (rs.status) {
																files.push(file.name);
																alert(files);
															} else {
																errors.push(file.name);
															}
													},
													//当队列中所有文件被上传完时触发
													UploadComplete : function(
															uploader, fs) {
														var e = errors.length ? ",失败"
																+ errors.length
																+ "个("
																+ errors
																		.join("、")
																+ ")。"
																: "。";
													
													},
													Fileadded:function(uploader, fs){
														if ($("#bf_type").val() == "") {
															alert("请选择上传文件类别")
														}
													},
													//上传出错的时候触发
													Error : function(l, o) {
														var m = o.file, n;
														if (m) {
															n = o.message;
															if (o.details) {
																n += " ("
																		+ o.details
																		+ ")";
															}
															if (o.code == plupload.FILE_SIZE_ERROR) {
																$.messager
																		.alert(
																				'提示',
																				m.name
																						+ '过大，上传限制：'
																						+ max_file_size
																						+ 'm',
																				'info');
															}
															if (o.code == plupload.FILE_EXTENSION_ERROR) {
																alert("Error: Invalid file extension: "
																		+ m.name);
															}
															m.hint = n;
															c("#" + m.id)
																	.attr(
																			"class",
																			"plupload_failed")
																	.find("a")
																	.css(
																			"display",
																			"block")
																	.attr(
																			"title",
																			n);
														}
													}
												}
											}
											, (chunk ? {
												chunk_size : '1mb'
											} : {})
									));
			//新增动态改变
			var uploader = $('#uploader').pluploadQueue();
			uploader.bind('BeforeUpload', function(uploader, filters) {
				if ($("#bf_type").val() == "") {
				     alert("请选择上传文件类别")
				        uploader.init();
						uploader.settings.multipart_params = {
						'urlPath' : 123456,
						'bf.borrow.id' : bid,
						'bf.type' : 1
					}
				} else {
					uploader.settings.multipart_params = {
						'urlPath' : 123456,
						'bf.borrow.id' : bid,
						'bf.type' : $("#bf_type").val()
					}
				}
			

			});
			  uploader.bind('FilesAdded',function(uploader,files){
				  if ($("#bf_type").val() == "") {
						alert("请选择上传文件类别")
				  }
					if($("#bf_type").val()>3){
						
						  var uploader = $('#uploader').pluploadQueue();  // 取得上传队列
		            
						       if (uploader.files.length > 1) {  
						    	alert("改类型只允许上传一张图片，请重新选择！") 
						    	   
						       }
						}
			    });
			//文件上传成功后的总计
			   uploader.bind("UploadComplete", function(up, files) {
		        　　alert("上传完成！共"
						+ files.length
						+ "个。成功"
						+ files.length
						+ "个");
		        }); 

			function tabChange() {
				$('#fileUploadTable').datagrid('load', {
					moudleId : '123',
					funcId : '1111',
					dataId : '111111'
				});
			}
			/**
			 *<p>删除文件逻辑</p>
			 */
			function removeFile() {
				var row = $('#fileUploadTable').datagrid('getSelections');
				if (row) {
					$.messager.confirm('确认', '您确定需要删除该条记录吗？', function(r) {
						var ids = '';
						for (var i = 0; i < row.length; i++) {
							if (i == row.length - 1) {
								ids += row[i].id;
							} else {
								ids += row[i].id + ',';
							}
						}
						if (r) {
							$
									.ajax({
										type : "POST",
										url : "remove.do",
										data : 'idList=' + ids,
										success : function(data) {
											try {
												var jsonstr = eval("(" + data
														+ ")");
											} catch (e) {
												$.messager.alert('错误', data,
														'error');
												return;
											}
											var flag = jsonstr.flag;
											if (flag == 'success') {
												$.messager.alert('提示', "删除成功",
														'info');
												tabChange();
											} else {
												$.messager.alert('错误', "删除失败",
														'error');
											}
										}
									});
						}
					});
				} else {
					$.messager.alert('错误', '请选择一条数据！', 'error');
				}
			}
			/**
			 *<p>下载文件逻辑</p>
			 */
			function downloadFile() {
				var row = $('#fileUploadTable').datagrid('getSelections');
				if (row.length == 0) {
					return;
				}
				if (row) {
					$.messager
							.confirm(
									'确认',
									'您确定需要下载文件？',
									function(r) {
										//获取选中的数据
										var ids = '';
										for (var i = 0; i < row.length; i++) {
											if (i == row.length - 1) {
												ids += row[i].id;
											} else {
												ids += row[i].id + ',';
											}
										}
										//使用iframe实现稳健下载
										var downloadframe = $('<iframe style="display:none"/>');
										var url = encodeURI("${path}/download.json?downFiles="
												+ ids);
										downloadframe.attr({
											'src' : url
										});
										$("#managerFile").append(downloadframe);
									});
				} else {
					$.messager.alert('错误', '请选择一条数据！', 'error');
				}
			}
		</script>
	</x:script>
	${jsCode}
	<x:script output="true" />