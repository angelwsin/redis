/*
 * 判断IE6以下浏览器
 */
(function() {
	if (navigator.userAgent.indexOf("MSIE 6.") > 0) {
		location.href = root + '/ie6.jsp';
	}
})();

$.extend(
	{browser: {
		msie: navigator.userAgent.indexOf("MSIE") > 0
	}}
);

/*
 * 修复IE 9及以下版本浏览器的setTimeout()、setInterval()方法不能为函数传递参数的问题
 */
if (document.all && !window.setTimeout.isPolyfill) {
	var __nativeST__ = window.setTimeout;
	window.setTimeout = function(vCallback, nDelay) {
		var aArgs = Array.prototype.slice.call(arguments, 2);
		return __nativeST__(vCallback instanceof Function ? function() {
			vCallback.apply(null, aArgs);
		} : vCallback, nDelay);
	};
	window.setTimeout.isPolyfill = true;
}

if (document.all && !window.setInterval.isPolyfill) {
	var __nativeSI__ = window.setInterval;
	window.setInterval = function(vCallback, nDelay) {
		var aArgs = Array.prototype.slice.call(arguments, 2);
		return __nativeSI__(vCallback instanceof Function ? function() {
			vCallback.apply(null, aArgs);
		} : vCallback, nDelay);
	};
	window.setInterval.isPolyfill = true;
}

function logError(msg) {
	alert(msg);
}

// 统一处理jQuery的Ajax请求错误
jQuery.ajaxSetup({
	error : function(jqXHR, textStatus, errorMsg) {
		jQuery.loading(false);
		alert('发送请求到"' + this.url + '"时出错[' + jqXHR.status + ']：' + errorMsg);
	}
});

/*
 * 扩展全局jQuery对象的方法(静态方法)
 */
jQuery.extend({
	/**
	 * 类似于getJSON、但基于POST请求的获取JSON数据的AJAX方法
	 */
	postJSON : function(url, data, callback) {
		if (jQuery.isFunction(data)) {
			callback = data;
			data = undefined;
		}
		return jQuery.ajax({
			url : url,
			type : "POST",
			data : data,
			success : callback,
			dataType : "json"
		});
	},
	/**
	 * 同步的AJAX POST请求，直接返回所需的响应数据
	 */
	POST : function(url, data, dataType) {
		var result;
		jQuery.ajax({
			url : url,
			data : data,
			type : "POST",
			async : false,
			dataType : dataType,
			success : function(data) {
				result = data;
			}
		});
		return result;
	},
	/**
	 * 发送Ajax请求，并处理返回的JSON格式的消息
	 */
	ajaxMessage : function(url, data, callback, proccess) {
		if(arguments.length == 3){
			if(typeof callback == "boolean")
				proccess = callback;
		}
		if( arguments.length > 1 && arguments.length < 4){
			var type = jQuery.type(data);
			if(type == "boolean"){
				proccess = data, data = null;
			}else if(type == "function"){
				callback = data, data = null;			
			}
		}
		jQuery.loading();
		jQuery.ajax({
			url : url,
			data : data,
			type : "POST",
			dataType : "json",
			success : function(data) {
				jQuery.loading(false);
				if (proccess !== false) {
					if (data.message) {
						alert(data.message);
					}
					if (data.callback && jQuery.isFunction(window[data.callback])) {
						window[data.callback].call(data);
					}
					if (data.url) {
						if (data.url == "refresh")
							location.reload();
						else
							location.href = data.url;
					}
				}
				if( callback && jQuery.isFunction(callback) ){
					callback.call(null, data);															
				}
			}
		});
	},
	/**
	 * 提示框
	 */
	alert : function(message, icon, fn) {
		var callback;
		if (icon instanceof Function) {
			fn = icon;
			icon = "default";
		}
		if (fn instanceof Function) {
			callback = function(index) {
				layer.close(index);
				fn.call(null, index);
			}
		}
		jQuery.layer({
			title : "系统提示",
			dialog : {
				msg : message,
				type : jQuery.getIcon(icon),
				yes : callback
			},
			area : [ message.length > 10 ? "220px" : "180px", "auto" ]
		});
	},
	confirm : function(message, yes, no) {
		return layer.confirm(message, yes, no);
	},
	loading : function(text, delay) {
		if (text === false) {
			jQuery.loading.index && layer.close(jQuery.loading.index) && (jQuery.loading.index = null);
		} else {
			var type = typeof text;
			if (type == "number") {
				delay = text;
				text = null;
			}
			if (!text) {
				text = "正在处理，请稍后...";
			}
			jQuery.loading.index = layer.load(text, 0);
		}
	},
	tips : function(html, follow, delay) {
		if (delay == null) {
			delay = 5;
		}
		layer.tips(html, follow, {
			guide : 1,
			time : delay
		});
	},
	getIcon : function(icon) {
		if (!jQuery.getIcon.icons) {
			jQuery.getIcon.icons = {
				"default" : -1,
				"warn" : 0,
				"ok" : 1,
				"forbidden" : 3,
				"question" : 4,
				"cry" : 8,
				"smile" : 9,
				"weixin" : 12,
			};
		}
		return jQuery.getIcon.icons[icon in jQuery.getIcon.icons ? icon : "default"];
	},
	/**
	 * 关闭弹出层
	 */
	close : function(index) {
		layer.close(index || layer.index);
	}
});

jQuery.fn.extend({
	/**
	 * 返回指定表单元素去除两侧连续空格后的value值
	 * 
	 * @param trimValue
	 *            是否同时去除表单元素value值两端的空格，默认为false
	 */
	trim : function(trimValue) {
		var value = jQuery.trim(this.val());
		if (trimValue && this.length > 0) {
			var me = this.length > 1 ? this.first() : this;
			me.val(value);
		}
		return value;
	},
	/**
	 * 获取表单元素的value值，如果是checkbox
	 * 
	 * @returns
	 */
	value : function() {
		if (this.length) {
			var type = this.prop("type");
			if (type) {
				type = type.toLowerCase();
				var isRadio = type == "radio";
				if (isRadio || type == "checkbox") {
					var name = this.attr("name");
					if (name) {
						var array = jQuery("[name='" + name + "']:checked").map(function() {
							return this.value;
						}).get();
						return isRadio ? array[0] : array;
					}
				}
			}
			return this.val();
		}
	},
	/**
	 * 实现全部选中、全部取消选中、反选功能
	 * 
	 * @param flag
	 *            如果为false，则为全部取消选中；如果为"inverse"，则为反选；如果为其他值，则为全部选中
	 */
	selectAll : function(flag) {
		if (flag === "inverse") { // 反选
			this.prop("checked", function(i, checked) {
				return !checked;
			});
		} else { // 全部选中/全部取消选中
			this.prop("checked", flag !== false);
		}
		return this;
	},
	tips : function(html, delay) {
		jQuery.tips(html, this, delay);
		return this;
	}
});

function Table(title, titleSetting, data) {
	if (!Table.fn) {
		Table.fn = Table.prototype;
		Table.fn.init = function(title, titleSetting, data) {
			this._caption = title || this._caption || "表格"; // 表格标题
			this._titleSetting = titleSetting || this._titleSetting; // 表头标题表达式
			// 检测标题设置
			if (typeof this._titleSetting != "string" || !this._titleSetting) {
				this._notAuth = true;
				logError('创建表格对象时，必须传入标题设置参数，例如："name=姓名;age=年龄;sex=性别"');
				return false;
			}
			// 检测pageObj对象
			if (!data || typeof data != "object") {
				data = {}; // 没有传递数据，默认为空
			}
			if (!Table.size) { // Table.size为计算当前页面累计生成的表格数量的计数器
				Table.size = 0;
				Table._Name = "Table"; // 表格对象变量的字面值
				// 以下是生成HTML元素的Id、name、class命名的前缀，用于Id的属性首字母大写，用于name的属性全部小写，用于class的属性全部小写
				// 所有命名都以UI/ui开头
				// Id和name的属性命名中都使用"_"分隔，class的命名中都使用"-"分隔
				Table._Id = "UI_Table"; // 表格ID
				Table._checkbox = "ui_checkbox"; // 表格复选框name
				Table._Widget = "UI_Widget"; // 表格分页条ID
				Table._PageId = "UI_PageId"; // 表格分页条的页面跳转文本框的ID
				Table._Action = "UI_Action"; // 表格全局操作栏的ID
			}
			if (isNaN(this.index)) {
				this.index = Table.size++;
				Table[this.index] = this;
			}
			this._name = Table._Name + "[" + this.index + "]"; // 当前表格对象的字面值
			this._data = data.list || []; // 用于加载表格的数据
			this._id = parseInt(data.current) || 1; // 分页数据的当前页数
			this._size = parseInt(data.size) || 0; // 每页显示的记录数
			this._count = parseInt(data.total) || 0; // 符合查询条件的数据总记录数
			this._orderBy = data.orderBy || "";
			this._args = data.args || "";
		};
	}
	if (this.init(title, titleSetting, data) == false) {
		return;
	}
	this.actionName = "操作"; // 【操作栏】的标题名称
	this.tips = "查询不到符合条件的记录!"; // //当没有数据时显示的提示内容
	this.hasRowNumber = true; // 指示是否有行号
	this.ajaxMode = false; // 指示是否启用Ajax模式
	this.link = null; // 页面跳转的链接地址，默认取当前地址
	this._rowTemplate = {}; // 特殊模板，类似 {'name' : function(obj){}, 'age':
	// function(obj){}}
	this._rowHidden = []; // 行隐藏表单数组
	this._rowAction = []; // 行操作栏数组
	this._action = []; // 全局操作栏数组
	this._sizeArray = [ 10, 20, 50, 100 ]; // 用于每页显示条数的下拉框值数组，默认选中第一个元素

	if (!Table.fn.actionButton) {
		// 全局操作栏按钮
		Table.fn.actionButton = function(btnName, callback, needValidate) {
			needValidate = needValidate !== false; // 默认为true
			this._action.push({
				"name" : btnName,
				"callback" : callback,
				"isNeed" : needValidate
			});
		};
		// 应用于每一行的某个列的特殊模板
		Table.fn.rowTemplate = function(columnName, temp) {
			this._rowTemplate[columnName] = temp;
			this._rowTemplate.__hasP__ = true; // rowTemplate中存在属性
		};
		// 【操作栏】链接
		Table.fn.rowLink = function(linkName, href) {
			var obj = {
				"name" : linkName,
				"href" : href
			};
			if (jQuery.isFunction(linkName)) {
				obj.isFunction = true;
			}
			this._rowAction.push(obj);
		};
		// 【操作栏】按钮
		Table.fn.rowButton = function(actionName, callback) {
			var obj = {
				"name" : actionName,
				"callback" : callback
			};
			if (jQuery.isFunction(actionName)) {
				obj.isFunction = true;
			}
			this._rowAction.push(obj);
		};
		// 为指定的列生成隐藏文本域(hidden)
		Table.fn.rowHidden = function() {
			var length = arguments.length;
			for (var i = 0; i < length; i++) {
				this._rowHidden.push(arguments[i]);
			}
		};
		// 将指定列的对应值转为对应的值显示
		Table.fn.rowDecode = function() {
			var length = arguments.length;
			if (length < 2) {
				logError("rowDecode函数至少需要传入2个参数。");
			} else {
				var args = arguments;
				var columnName = args[0];
				this.rowTemplate(columnName, function(obj) {
					var value = obj[columnName]; // 实际的值
					var lastLength = (length & 1) == 0 ? length - 1 : length;
					for (var i = 1; i < lastLength; i++) {
						if (value == args[i++]) { // 如果实际的值等于指定的值
							return args[i];
						}
					}
					return lastLength == length ? value : args[lastLength];
				});
			}
		};
		// 设置分页条数下拉框的值
		Table.fn.pageSize = function() {
			var length = arguments.length;
			if (length > 0) {
				var num = arguments[0];
				if (length == 1) {
					if (this._size <= 0 || num <= 0) {
						this._size = num;
					}
				} else {
					this._sizeArray = arguments;
					if (this._size <= 0) {
						this._size = num;
					}
				}
			}
		};
		// 点击行【操作栏】按钮时执行的代理函数
		Table.fn.run = function(rowIndex, actionIndex) {
			var callback = this._rowAction[actionIndex].callback;
			var obj = this._data[rowIndex];
			callback.call(obj, obj, rowIndex);
		};
		// 全局【操作栏】按钮执行的代理函数
		Table.fn.RUN = function(actionIndex) {
			var action = this._action[actionIndex];
			var data = this._data;
			var selected = [];
			jQuery("input[name='" + Table._checkbox + this.index + "']:checked").each(function() {
				selected.push(data[this.value]);
			});
			if (action.isNeed && selected.length == 0) {
				logError("没有选中任何数据!");
				return;
			}
			action.callback(selected, selected);
		};
		// 全选复选框执行的代理函数
		Table.fn.selectAll = function(checkDom) {
			jQuery("input[name='" + Table._checkbox + this.index + "']").prop("checked", checkDom.checked);
		};
		// 获取表格分页组件
		Table.fn.getTableWidget = function() {
			var widget = "";
			var name = this._name;
			var index = this.index;
			var id = this._id;
			var size = this._size;
			if (size > 0 && this._data.length > 0) {
				// 如果开启了分页，并且有数据记录，则加载数据分页工具条
				widget += '<div id="' + Table._Widget + index + '" class="ui-table-widget">';
				var url = this.ajaxMode ? null : this.getPageURL();
				if (url) {
					url = url.url + (url.hasParam ? '&' : '?');
				}
				// 首页+上一页
				if (id > 1) {
					if (this.ajaxMode) {
						widget += '<a href="javascript:;" onclick="' + name + '.goPage(1);">首页</a>';
						widget += '<a href="javascript:;" onclick="' + name + '.goPage(' + (id - 1) + ');">上一页</a>';
					} else {
						widget += '<a href="' + url + 'page.current=1&page.size=' + size + '">首页</a>';
						widget += '<a href="' + url + 'page.current=' + (id - 1) + '&page.size=' + size + '">上一页</a>';
					}
				} else {
					widget += '<span>首页</span><span>上一页</span>';
				}

				// 下一页、尾页
				var maxPage = Math.ceil(this._count / size);
				var space = '<span class="ui-space">;</span>';
				if (maxPage > id) {
					if (this.ajaxMode) {
						widget += '<a href="javascript:;"  onclick="' + name + '.goPage(' + (id + 1) + ');">下一页</a>';
						widget += '<a href="javascript:;" onclick="' + name + '.goPage(' + maxPage + ');">尾页</a>';
					} else {
						widget += '<a href="' + url + 'page.current=' + (id + 1) + '&page.size=' + size + '">下一页</a>';
						widget += '<a href="' + url + 'page.current=' + maxPage + '&page.size=' + size + '">尾页</a>';
					}
				} else {
					widget += '<span>下一页</span><span>尾页</span>';
				}
				// 跳转到 + 每页显示条数
				widget += '<input class="ui-button" type="button" value="跳转到" onclick="' + name + '.goPage()" />第<input class="ui-text" id="' + Table._PageId + this.index + '" type="text" />页' + space;
				widget += '每页显示<select onchange="' + name + '.changeSize(this)">';
				var sizeArray = this._sizeArray;
				for ( var i in sizeArray) {
					if (sizeArray[i] == size) {
						widget += '<option value="' + sizeArray[i] + '" selected>' + sizeArray[i] + '</option>';
					} else {
						widget += '<option value="' + sizeArray[i] + '">' + sizeArray[i] + '</option>';
					}
				}
				widget += '</select>条' + space;
				// 当前页+总页数
				widget += '当前页/总页数：';
				widget += id + '/' + maxPage + space;
				widget += '总记录数：' + this._count + space;
				widget += '</div>';
			}
			return widget;
		};
		// 选中当前行的复选框
		Table.fn.selectCurrentRow = function() {
			var selector = "#" + Table._Id + this.index + " tr";
			var checkBox = "[name='" + Table._checkbox + this.index + "']";
			jQuery(document.body).on("click", selector, function() {
				var $checkBox = jQuery(this).find(checkBox);
				$checkBox.prop("checked", !$checkBox.prop("checked"));
			});
		};
		// 更改每页显示条数的代理函数
		Table.fn.changeSize = function(textDOM) {
			this.goPage(1, textDOM.value);
		};
		// 获取指定的分页URL(不带分页参数)
		Table.fn.getPageURL = function(url) {
			var obj = {}, params = window.location.search;
			url = url || window.location.pathname;
			if (params) {
				params = params.substr(1).replace(/(&|^)page\.(current|size)=\d*/g, "");
			}
			if (params) {
				obj.url = url + "?" + params;
				obj.hasParam = true;
			} else {
				obj.url = url;
			}
			return obj;
		};
		// 以Ajax方式加载数据
		Table.fn.ajaxLoad = function(selector, url) {
			this.ajaxMode = true;
			url = url || this.link || window.location.href;
			if (!this.link)
				this.link = url;
			if (!selector) { // 如果没有选择器
				selector = this._selector;
			} else if (!this._selector) { // 如果指定了选择器并且this的选择器为空
				this._selector = selector;
			}
			var result = null;
			jQuery.ajax({
				url : url,
				type : "post",
				async : false,
				dataType : "json",
				success : function(data) {
					result = data;
				}
			});
			if (result) {
				this.init(null, null, json);
				this.show(selector);
			}
		};

		// 翻页操作的代理函数
		Table.fn.goPage = function(pageId, pageSize) {
			if (pageId == null) { // 如果没有传递参数进来，则表示是点击跳转按钮的执行方法
				var value = jQuery.trim(jQuery("#" + Table._PageId + this.index).val());
				pageId = parseInt(value, 10);
				if (!pageId) {
					logError("跳转页数必须为数字!");
					return false;
				}
				var maxPage = this._count / this._size;
				maxPage = Math.ceil(maxPage); // 向上取整
				if (pageId > maxPage) {
					pageId = maxPage;
				}
				if (pageId < 1) {
					pageId = 1;
				}
			}
			pageSize = parseInt(pageSize) || this._size;
			var urlObj = this.getPageURL();
			var url = urlObj.url + (urlObj.hasParam ? '&' : '?') + 'page.current=' + pageId + '&page.size=' + pageSize;
			if (this.ajaxMode) {
				this.ajaxLoad(null, url);
			} else {
				self.location.href = url;
			}
			return false;
		};
		// 加载显示
		Table.fn.show = function(selector) {
			if (!selector) {
				selector = this._selector;
			} else {
				this._selector = selector;
			}
			if (!(selector instanceof jQuery)) {
				selector = jQuery(selector);
			}
			if (selector.length == 0) {
				logError("调用show()方法必须提供用于加载表格内容的有效jQuery选择器参数！");
				return;
			}
			// 标题设置数组
			var array = this._titleSetting.split(/=|;/), actions = this._action, rowActions = this._rowAction;
			// 标题设置数组长度，//行【操作栏】的操作列数，//是否有复选框
			var length = array.length, actionLength = rowActions.length, hasCheckBox = actions.length > 0;
			if (length == 0 || (length & 1) == 1) {
				logError('表格对象传入的标题设置参数格式不正确，应该采用如下格式："name=姓名;age=年龄;sex=性别"');
				return;
			}
			var titleArray = []; // 标题栏
			for (var i = 0; i < length; i++) {
				titleArray.push({
					"name" : array[i],
					"title" : array[++i]
				});
			}
			length = titleArray.length;
			// 包含序号列、操作列在内的所有列数，//是否有序号列
			var realSize = length + actionLength, hasRowNO = this.hasRowNumber;
			var isPrefix = hasCheckBox || hasRowNO;
			if (isPrefix) {
				realSize++;
			}
			var tableHtml = '<table id="' + Table._Id + this.index + '" class="ui-table">';
			// //////////////////////////////////////////
			// 表格标题
			tableHtml += '<caption>' + this._caption + '</caption>';
			// /////////////////////////////////////////
			// 表格列标题
			tableHtml += '<tr class="tr-head">';
			var tabName = this._name;
			if (hasCheckBox) { // 如果有复选框
				tableHtml += '<th class="th-first"><input type="checkbox" value="0" onclick="' + tabName + '.selectAll(this)" />全选</th>';
			} else if (hasRowNO) { // 如果无复选框+有序号
				tableHtml += '<th class="th-first">序号</th>';
			}
			for (var i = 0; i < length; i++) { // 列标题
				tableHtml += '<th class="th-' + titleArray[i].name + '">' + titleArray[i].title + '</th>';
			}
			if (actionLength > 0) { // 操作栏标题
				tableHtml += '<th class="th-action" colspan="' + actionLength + '">' + this.actionName + '</th>';
			}
			tableHtml += "</tr>";
			// ////////////////////////////////////////
			// 表格正文内容
			// ///////////////////////////////////////
			var dataObj = this._data;
			var isArray = jQuery.isArray(dataObj);
			if (!isArray) { // 如果不是数组对象
				var objType = typeof (dataObj);
				if (objType == "object") { // 如果是单个对象，将其封装为数组对象
					dataObj = this._data = [ dataObj ];
					isArray = true;
				} else if (objType == "string") {
					this.tips = dataObj;
				}
			}
			if (isArray && dataObj.length > 0) { // 如果是数组，并且有元素
				// 记录数，是否是奇数列，复选框的checkbox的name
				var size = dataObj.length, isOdd = false, checkBox = Table._checkbox + this.index; // 记录数
				for (var i = 0; i < size; i++) {
					tableHtml += '<tr class="' + ((isOdd = !isOdd) ? 'odd' : 'even') + '">'; // tr
					// class奇偶判断
					if (isPrefix) {
						tableHtml += '<td class="td-first">';
					}
					if (this.hasRowNumber) { // 如果有序号
						tableHtml += '<span class="td-sequence">' + (i + 1) + '</span>';
					}
					if (hasCheckBox) {
						tableHtml += '<input name="' + checkBox + '" type="checkbox" value="' + i + '" />';
					}
					if (isPrefix) {
						tableHtml += '</td>';
					}
					var obj = dataObj[i]; // 单条数据
					var rowTemplates = temp = this._rowTemplate;
					var hasTemplate = "__hasP__" in rowTemplates;
					for (var j = 0; j < length; j++) {// 循环列
						var name = titleArray[j].name; // 列名
						var text = null; // 表格内容
						var style = "";
						if (hasTemplate) { // 如果有特殊模板
							var temp = rowTemplates[name];
							if (jQuery.isFunction(temp)) { // 如果是函数
								text = temp.call(obj, obj);
								if (text == null) { // 如果有为null的值，一律转为空字符串
									text = "&nbsp;";
								} else if (jQuery.isArray(text)) { // 如果设置了单元格的其他属性
									if (text[1]) {
										style = " " + text[1] + " ";
									}
								}
							}
						}
						if (text == null) { // 如果没有特殊模板或特殊模板配置有误
							text = obj[name]; // 取实际值
							if (text == null) {// 如果有为null的值，一律转为空格字符串
								text = "&nbsp;";
							}
						}
						if (j == 0) {// 如果有隐藏文本域，则全部放在有效列的第一列
							var rowHiddens = this._rowHidden;
							var hiddenSize = rowHiddens.length;
							if (hiddenSize > 0) {
								for (var k = 0; k < hiddenSize; k++) {
									var hiddenName = rowHiddens[k];
									var hiddenValue = obj[hiddenName];
									text += '<input name="hidden_' + hiddenName + '" type="hidden" value="' + hiddenValue + '" />';
								}
							}
						}
						if (style == "") {
							style = ' class="td-' + name + '" ';
						}
						tableHtml += '<td' + style + '>' + text + '</td>';
					}
					// 追加【操作】栏
					if (actionLength > 0) {
						for (var l = 0; l < actionLength; l++) {
							var action = rowActions[l];
							var cell = action.isFunction ? action.name.call(obj, obj) : action.name;
							if (action.href) { // 如果是链接操作
								var href = action.href.call(obj, obj);
								if (href != null) {
									tableHtml += '<td class="td-action"><a href="' + href + '">' + cell + '</a></td>';
								} else {
									tableHtml += '<td class="td-action">-</td>';
								}
							} else if (action.callback) { // 如果是按钮操作
								tableHtml += '<td class="td-action"><input class="ui-button" type="button" value="' + cell + '" onclick="' + tabName + '.run(' + i + ',' + l + ')" /></td>';
							}
						}
					}
					tableHtml += '</tr>';
				}
			} else {
				// 如果是字符串、null、undefined、空数组等其他类型
				tableHtml += '<tr><td colspan="' + realSize + '">' + this.tips + '</td></tr>';
			}
			tableHtml += '</table>';
			tableHtml += this.getTableWidget();
			if (hasCheckBox) {
				// 如果有复选框操作
				var div = '<div id="' + Table._Action + this.index + '" class="ui-table-action">';
				for ( var x in actions) {
					var action = actions[x];
					div += '<input class="ui-button" type="button" value="' + action.name + '" onclick="' + tabName + '.RUN(' + x + ')" />';
				}
				div += "</div>";
				tableHtml += div;
			}
			jQuery(selector).html(tableHtml);
			if (checkBox && this.rowSelected) { // 如果有复选框
				this.selectCurrentRow();
			}
		};
	}
};

$(function() {
	if (window.WdatePicker) {
		$("body").on("focusin", ".date,.datetime", function() {
			var $me = $(this);
			var opt = $me.data("dateCache");
			if (opt == null) {
				opt = {};
				var clazz = " " + this.className + " ";
				if (clazz.indexOf(" datetime ") != -1) {
					opt.dateFmt = "yyyy-MM-dd HH:mm:ss";
				}
				if (clazz.indexOf(" min-now ") != -1) {
					opt.minDate = "%y-%M-%d %H:%m:%s";
				}
				if (clazz.indexOf(" max-now ") != -1) {
					opt.maxDate = "%y-%M-%d %H:%m:%s";
				} else if (clazz.indexOf(" max-now-1 ") != -1) {
					opt.maxDate = "%y-%M-#{%d-1} %H:%m:%s";
				}
				$me.data("dateCache", opt);
			}
			WdatePicker(opt);
		});
	}
	;
	$("body").on("click", ".waiting", function() {
		$.alert("即将开启，敬请期待！");
		return false;
	});
});

function goPage(pageId, pageSize) {
	var obj = {}, params = window.location.search;
	var url = window.location.pathname;
	if (pageId != 1) {
		pageId = parseInt($("#UI_PageId").trim(), 10);
	}
	if (!pageId) {
		logError("跳转页数必须为数字!");
		return false;
	}
	if (pageId < 1) {
		pageId = 1;
	}
	if (params) {
		params = params.substr(1).replace(/(&|^)page\.(current|size)=\d*/g, "");
	}
	if (params) {
		url = url + "?" + params;
	}
	pageSize = parseInt(pageSize, 10) || 10;
	url = url + (params ? '&' : '?') + 'page.current=' + pageId + '&page.size=' + pageSize;
	location.href = url;
};

function changePageSize(pageSize) {
	goPage(1, pageSize.value);
};

function Timer(options) {
	if (!(this instanceof Timer))
		return new Timer(options);
	if (!Timer.initialized) {
		Timer.prototype.start = function() {
			this.active = false;
			if (!this.initialized) {
				this.dom = $("#" + this.opt.id);
				this.initTime = this.opt.time || this.dom.attr("time") || new Date();
				this.date = this.initTime instanceof Date ? this.initTime : new Date(parseInt(this.initTime, 10));
				this.initialized = true;
			}
			if (this.dom && this.dom.length && this.date) {
				this.timerID = setInterval(this.handler, this.interval, this);
			}
		};
		Timer.prototype.handler = function(me) {
			me.date.setTime(me.date.getTime() + me.step);
			if (me.date.getTime() < 0)
				me.stop();
			if (!me.pattern) {
				var pattern = {
					yyyy : "FullYear",
					MM : "Month",
					dd : "Date",
					HH : "Hours",
					mm : "Minutes",
					ss : "Seconds",
					SSS : "Milliseconds"
				}, render = me.opt.render || pattern;
				me.pattern = {};
				for ( var i in render) {
					if (pattern[i])
						me.pattern[i] = (me.step > 0 ? "get" : "getUTC") + pattern[i];
				}
			}
			var time = {};
			for ( var i in me.pattern) {
				time[i] = me.date[me.pattern[i]]();
				if (i == "MM")
					time[i]++;
				if (me.zeroFill && time[i] < 10)
					time[i] = "0" + time[i];
			}
			if (me.renderCallback) {
				me.renderCallback.call(me, time);
			} else if (me.opt.render) {
				if (!me.doms)
					me.doms = {};
				for ( var i in me.opt.render) {
					if (time[i] != null) {
						me.doms[i] = me.doms[i] || $("#" + me.opt.render[i]);
						me.doms[i].html(time[i]);
					}
				}
			} else {
				me.dom.html(time.yyyy + "-" + time.MM + "-" + time.dd + " " + time.HH + ":" + time.mm + ":" + time.ss);
			}
		};
		Timer.prototype.stop = function() {
			clearInterval(this.timerID);
		};
		Timer.initialized = true;
	}
	this.opt = typeof options == "object" ? options : {
		id : options
	};
	this.interval = this.opt.interval || 1000;
	this.step = this.opt.step || 1000;
	this.zeroFill = this.opt.zeroFill !== false;
	if (this.opt.renderCallback && $.isFunction(this.opt.renderCallback)) {
		this.renderCallback = this.opt.renderCallback;
	}
};