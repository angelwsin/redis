/****************************************
 @Name：jQuery-Validator 基于jQuery的表单验证框架
 @Version: 1.2.0 beta
 @Author：Ready
 @Date：2015-02-25
 @Blog：http://www.365mini.com
 @Copyright：CodePlayer( Ready )
 @Email：CodePlayer360@gmail.com
*/
var V, v;
!function($){
	if(!$ || V) return;
	V = function(){}, V.fn = V.prototype, V.pattern = {};
	// 预处理函数
	V.fn.pre = {
		/** 去除两侧的空白字符 */
		trim: function(value, $dom){
			return $.trim(value);
		},
		/** 去除所有的空白字符 */
		trimAll: function(value, $dom){
			if( !V.pattern.__whiteSpace ) V.pattern.__whiteSpace = /\s/g;
			return value ? value.replace(V.pattern.__whiteSpace, "") : value;
		},
		/** 字母转小写 */
		lower: function(value, $dom){
			return value ? value.toLowerCase() : value;
		},
		/** 字母转大写 */
		upper: function(value, $dom){
			return value ? value.toUpperCase() : value;
		},
		/** 刷新：将预处理后的值放回元素的value中 */
		flush: function(value, $dom){
			$dom && $dom.val(value);
			return value;
		}
	};
	// 解析格式化字符串
	V.util = {
		parseFormat: function(format){
			var pos = format.indexOf("/"), result = [format, ""];
			if(pos > 0){
				result[0] = format.substring(0, pos), result[1] = format.substr(pos + 1);
			}
			return result;
		},
		parseIntervalPattern: function(pattern){
			if( !V.pattern[pattern] ){
				V.pattern.__interval || ( V.pattern.__interval = /^([\[\(])(\d+(\.\d+)?)?(,)?(\d+(\.\d+)?)?([\]\)])$/ );
				if( V.pattern.__interval.test(pattern) && (RegExp.$2 || RegExp.$4) ){
					var result = { min: RegExp.$2, max: RegExp.$5 };
					if( RegExp.$4 == RegExp.$5 ){
						result.equals = true;
					}else {
						result.left = RegExp.$1 == "[" ? ">=" : ">";
						result.right = RegExp.$7 == "]" ? "<=" : "<";
					}
					V.pattern[pattern] = result;
				}else{
					throw "Unexpected pattern:" + pattern;
				}
			}
			return V.pattern[pattern];
		},
		parseMessage: function(message, options, me){
			return message.replace(V.pattern.__message || ( V.pattern.__message = /\{([^}]+)\}/g ), function($0, $1){
				var char0 = $1.charAt(0), result;
				if(char0 == "#" || char0 == "$"){
					var key = $1.substr(1);
					if(options.domContext && options.domContext[key]){
						result = me.getLabel( options.domContext[key] );
					}else{
						result = me.getLabel( $( char0 == "#" ? "#" + key : "[name='" + key + "']" ) );
					}
				}else{
					result = options[$1];					
				}
				if( !result ) result = "";
				return result;
			});
		},
		pushDomContext: function(s, name, $dom){
			if(!s.domContext) s.domContext = [];
			if( !name ) name = $dom.prop("name");
			s.domContext.push($dom);
			if(name) s.domContext[name] = $dom;
		}
	};
	// 格式化器
	V.fn.formatter = {
		/** 数字格式化器：返回数字 */
		// number[/[+|-][int|integer|float|double|money|{位数正则}.{位数正则}]]
		number: function(value, expr, s){
			if(arguments.length == 2){
				s = expr, expr = V.util.parseFormat(s.format)[1];
			}
			var regex = V.pattern[s.format];
			if(!regex){
				if(!expr) expr = "+int";
				var sign = expr.charAt(0), signExpr;
				// 符号位
				switch(sign){
					case "+":
						signExpr = "";
						break;
					case "-":
						signExpr = "-";
						break;
					case "?":
						signExpr = "-?";
						break;
					default:
						sign = "+";
						signExpr = "";
						expr = sign + expr;
				}
				// 位数表达式
				var subExpr = expr.substr(1);
				switch(subExpr){
					case "int":
					case "integer":
						regex = new RegExp("^" + signExpr + "\\d+$");
						break;
					case "money":
						regex = new RegExp("^" + signExpr + "\\d+(\\.\\d{1,2})?$");
						break;
					case "float":
					case "double":
						regex = new RegExp("^" + signExpr + "\\d+(\\.\\d+)?$");
						break;
					default:
						var subArray = subExpr.split(".", 2);
						regex = "^" + signExpr + "\\d" + subArray[0];
						if(subArray[1]) regex += "\\.\\d" + subArray[1];
						regex = new RegExp(regex + "$");
				}
				V.pattern[s.format] = regex;
			}
			if(regex.test(value)){
				return parseFloat(value);
			}
			return false;
		},
		/** 日期格式化器：返回日期 */
		// date[/[yyyy-MM-dd|yyyy-MM-dd HH:mm:ss]]
		date: function(value, expr, s){
			if(arguments.length == 2){
				s = expr, expr = V.util.parseFormat(s.format)[1];
			}
			if(!expr) expr = "yyyy-MM-dd";
			else if(expr == "datetime") expr = "yyyy-MM-dd HH:mm:ss";
			else if(expr == "time") expr = "HH:mm:ss";
			if(!value || value.length != expr.length) return false;
			var pattern = V.pattern[s.format], part;
			// {yyyy:[begin,end], MM:[begin,end], dd:[begin,end], HH:[begin,end], mm:[begin,end], ss:[begin,end]}
			if(!pattern){
				var datePattern = V.pattern.__date || ( V.pattern.__date = new RegExp("yyyy|MM|dd|HH|mm|ss", "g") ), pattern = {};
				datePattern.lastIndex = 0;
				while(part = datePattern.exec(expr)){
					pattern[part[0]] = [part.index, part.index + part[0].length];
				}
				V.pattern[s.format] = pattern;
			}
			var parts = {} /* 屏蔽严格的正确性检测, chars = value.split("") */;
			for(var i in pattern){
				part = pattern[i];
				/* 屏蔽严格的正确性检测
				for(var j = part[0]; j < part[1]; j++){
					chars[j] = true;
				}
				*/
				part = value.substring(part[0], part[1]);
				parts[i] = parseInt(part, 10);
				if(parts[i] != part) return false;
			}
			/* 屏蔽严格的正确性检测
			for(var i in chars){
				if(chars[i] !== true && chars[i] !== expr[i]){
					return false;
				}
			}
			*/
			if(parts.MM) parts.MM--; // 实际月份数值需要减1
			return new Date(parts.yyyy, parts.MM || 0, parts.dd || 1, parts.HH || 0, parts.mm || 0, parts.ss || 0);
		},
		/** 身份证格式化器：返回日期 */
		idcard: function(value, pattern, s){
		}
	};
	// 应用默认设置
	V.fn.applyDefaultSetting = function(options, _extend){
		if(options.extend) _extend = this.rules[options.extend];
		return $.extend( { required: true }, _extend, options );
	};
	// 验证器
	V.fn.validator = {
		/** 非空校验器 */
		required: function(value, s){
			if(s.dom && s.dom.length){
				// 如果是复选框或单选框，需要特殊处理
				var e = s.dom[0], nodeName = e.nodeName;
				if((nodeName == "INPUT" || nodeName == "input") && (e.type == "checkbox" || e.type == "radio")){
					s.actual = value = s.dom.filter(":checked").length;
				}
			}
			if( !value ){
				if( s.required ){
					this.sendError("required", "", value, null, s);
					return false;
				}
				s._stop = true;
			}
		},
		/** 格式化校验器 */
		format: function(value, s){
			var result = V.util.parseFormat( s.format ), validator = "format";
			var formatter = this.formatter[ result[0] ];
			if( formatter ){
				value = formatter(value, result[1], s);
				if(value === false){
					this.sendError(validator, s.format, value, result[1], s);
					return false;
				}
				return value;
			}else{
				this.sendError(validator, "invalid", value, null, s);
				return false;
			}
		},
		/** 正则表达式或自定义函数文本校验器 */
		text: function(value, s){
			var validator = "text", type = $.type(s.text);
			switch(type){
			case "string":
				if( s.text != value ){
					this.sendError(validator, "==", value, s.text, s);
					return false;
				}
				break;
			case "regexp":
				if( !s.text.test(value) ){
					this.sendError(validator, "regexp", value, s.text, s);
					return false;
				}
				break;
			case "function":
				if( s.text.call(this, value, s) === false ){
					this.sendError(validator, "function", value, s.text, s);
					return false;
				}
				break;
			default:
				throw "Unexpected text validator:" + s.text;
			}
		},
		/** 长度校验器 */
		length: function(value, s){
			return this.validator.range.call(this, s.value.length, s, "length", s.length);
		},
		/** 范围校验器 */
		range: function(value, s, validator, range){
			if(arguments.length <= 2){
				validator = "range", range = s.range;
			}
			var pattern = V.util.parseIntervalPattern( range );
			if( pattern.equals ){
				if(value != pattern.min){
					this.sendError(validator, "==", value, pattern.min, s);
					return false;
				}
			}else {
				if( pattern.min ){
					var leftResult = value > pattern.min || pattern.left == ">=" && pattern.min == value;
					if( !leftResult ){
						this.sendError(validator, pattern.left, value, pattern.min, s);
						return leftResult;
					}
				}
				if( pattern.max ){
					var rightResult = value < pattern.max || pattern.right == "<=" && pattern.max == value;
					if( !rightResult ){
						this.sendError(validator, pattern.right, value, pattern.max, s);
						return rightResult;
					}
				}
			}
		},
		/** 相等校验器 */
		equalsTo: function(value, s){
			var $dom = $("[name='" + s.equalsTo + "']"), val = $dom.val();
			if(value != val){
				V.util.pushDomContext(s, s.equalsTo, $dom);
				this.sendError("equalsTo", "", value, val, s);
				return false;
			}
		},
		/** 比较校验器 */
		compare: function(value, s){
			var hook = {}, me = this, result, isOK = true;
			var expression = s.compare.replace(V.pattern.__compare || ( V.pattern.__compare = /\b(this|now)\b|([$#])([^\s=+*\/%&|-]+)/g ), function($0, $1, $2, $3){
				var name = $1 || $3;
				if(isOK){
					if(name == "this"){
						if( hook[name] == null)
							hook[name] = value;
					}else if(name == "now"){
						if( hook[name] == null){
							hook[name] = new Date();
						}
					}else {
						var selector = $2 == "#" ? "#" + name : "[name='" + name + "']", $dom = $(selector), domValue = $dom.val(); 
						if(domValue != null){
							if(s.propagation){ // 表达式中的其他表单字段和当前字段采用相同的校验规则(compare规则除外)
								var copy = $.extend({}, s);
								delete copy.compare;
								if( me.validate($dom, copy) === false ){
									isOK = false;
								}
							}
							V.util.pushDomContext(s, name, $dom);
							if(isOK){
								if(s.format){
									result = result || V.util.parseFormat( s.format );
									domValue = me.formatter[ result[0] ](domValue, result[1], s);
									if(domValue !== false) hook[name] = domValue;								
								}else{
									hook[name] = domValue;
								}
							}
						}
					}
				}
				return "this[\"" + name +"\"]";
			});
			if(!isOK){
				return false;
			}
			if(this.devMode && console){
				console.log(expression);				
				console.log(hook);
			}
			result = new Function("return (" + expression + ")").call(hook);
			if(result === false){
				this.sendError("compare", "pattern", value, s.compare, s);
				return false;
			}
		},
		/** 手机号码校验器 */
		cellphone: function(value, s){
			V.pattern.cellhone || ( V.pattern.cellhone = /^1\d{10}$/ );
			if( !V.pattern.cellhone.test(value) ){
				this.sendError("cellphone", "pattern", value, V.pattern.cellhone, s);
				return false;
			}
		},
		/** 邮箱格式校验器 */
		email: function(value, s){
			V.pattern.email || ( V.pattern.email = /^[\w._-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$/ );
			if( !V.pattern.email.test(value) ){
				this.sendError("email", "pattern", value, V.pattern.email, s);
				return false;
			}
		},
		/** 文件格式校验器 */
		file: function(value, s){
			var filePattern = new RegExp("\\.(" + s.file + ")$", "i");
			if( !filePattern.test(value) ){
				this.sendError("file", "pattern", value, s.file, s);
				return false;
			}
		},
		/** Ajax远程校验器 */
		remote: function(value, s){
			var remote = s.remote, type = $.type(remote), options = {type: "post", async: false, dataType: "json"};
			var isFunction;
			while( (isFunction = type == "function") ){
				remote = remote.call(null, value, s);
				type = $.type(remote);
			}
			switch(type){
			case "string":
				options.url = remote;
				if(!isFunction && s.dom){
					if(s.name == null){
						s.name = s.dom.prop("name");
					}
					options.data = { };
					options.data[s.name] = value;
				}
				break;
			case "object":
				$.extend(options, remote);
				break;
			default:
				throw "Unexpected remote validator:" + s.remote;
			}
			var result = null;
			options.success = function(data, textStatus, jqXHR){
				result = data;
			};
			$.ajax(options);
			if( result ){
				if( result.message ){
					s.message = result.message;
					this.sendError("remote", "", value, null, s);
				}
				if( result.callback ){
					window[result.callback].call(s.dom, result, value, s);
				}
				return result.status == "OK";
			}
			return false;
		}
	};
	// 验证规则
	V.fn.rules = { };
	// 定义全局规则
	V.define = function(rule, options, _hook){
		if(typeof rule == "object"){
			for(var i in rule){
				this.define(i, rule[i]);
			}
			return;
		}
		if(typeof options != "object"){
			var obj = {};
			obj[rule] = options;
			options = obj;
		}
		_hook = this === V ? V.prototype : this;
		if(options.extend){
			var ext = _hook.rules[options.extend];
			if(ext){
				options = $.extend({}, ext, options);
			}
			delete options.extend;
		}
		_hook.rules[rule] = options;
	};
	// 定义实例规则
	V.fn.define = function(rule, options){
		V.define.call(this, rule, options);
	};
	// 执行验证
	V.fn.execute = function($doms, eventType, rules, event){
		if(!($doms instanceof $)){
			$doms = $($doms);
		}
		if( !$doms.length ) return false;
		if( rules == null){
			rules = eventType;
			eventType = null;
		}
		var me = this;
		if(eventType){
			$doms.on(eventType, function(e){
				// TODO 如果当前DOM不是form表单，则可能出错
				var isSubmit = e.type == "submit", element = isSubmit ? this : e.target, rule = isSubmit ? rules : rules[element.name];
				if( rule ){
					return me.execute(element, null, rule, e);
				}
				return false;
			});
			return;
		}
		var total = 0, success = 0;
		$doms.each(function(){
			var $me = $(this), tagName = this.nodeName;
			if( tagName == "FORM" || tagName == "form" ){
				for(var i in rules){
					total++;
					if( me.validate($me.find("[name='" + i + "']"), rules[i], event) === false ){
						return false;
					}
					success++;
				}
			}else{
				total++;
				if( me.validate($me, rules, event) === false){
					return false;
				}
				success++;
			}
		});
		return total == success;
	};
	// 执行单个验证
	V.fn.validate = function(value, options, event){
		if( typeof options === "string" ){
			options = this.rules[options];
			if( !options ) return false;
		}
		var s = this.applyDefaultSetting( options );
		options = $.extend( { }, s );
		if( value instanceof $ ){
			s.dom = value;
			value = value.val();
		}
		// 如果设置了条件预过滤器
		if( options.preFilter ){
			if(options.preFilter.call(this, value, s) === false)
				return true;
			delete options.preFilter;
		}
		s.value = value;
		if( event ){
			s.event = event;
		}
		// 如果设置了预处理
		if( options.pre ){
			var pres = options.pre.split(",");
			for(var i in pres){
				value = this.pre[pres[i]].call(this, value, s.dom);
			}
			s.value = value;
			delete options.pre;
		}
		// 如果设置了非空验证
		if( options.required != null ){
			if( this.validator.required.call(this, value, s) === false){
				return false;
			}
			if( s._stop ) return true;
			delete options.required;
		}
		// 如果设置了格式验证
		if( options.format ){
			value = this.validator.format.call(this, value, s);
			if( value === false ) return false;
			if( s._stop ) return true;
			delete options.format;
		}
		// 循环执行验证器，非验证器属性就跳过
		for(var i in options){
			var validator = this.validator[i];
			if( validator ){
				if( validator.call(this, value, s) === false ){
					return false;
				}
				if( s._stop ) return true;
			}
		}
		return true;
	};
	// 处理错误
	V.fn.sendError = function(validator, trigger, value, expected, options){
		if( !this.silence ){
			if( !options.name && options.dom ){
				options.name = options.dom.prop("name");
			}
			var s = $.extend( { validator: validator, trigger: trigger, actual: value, expected: expected, label: this.getLabel( options.dom ) }, options );
			var message = this.getMessage(s);
			this.render(message, s);
		}
	};
	// 消息
	V.fn.messages = {
		"required": "{label}不能为空!",
		"equalsTo": "{label}必须与{#0}输入一致!",
		"==": "{label}必须等于{expected}!",
		">=": "{label}必须大于或等于{expected}!",
		">": "{label}必须大于或等于{expected}!",
		"<=": "{label}必须小于或等于{expected}!",
		"<": "{label}必须小于{expected}!",
		"length.==": "{label}的长度必须等于{expected}!",
		"length.>=": "{label}的长度必须大于或等于{expected}!",
		"length.>": "{label}的长度必须大于{expected}!",
		"length.<=": "{label}的长度必须小于或等于{expected}!",
		"length.<": "{label}的长度必须小于{expected}!",
		"format.number": "{label}必须是有效的数字!",
		"format.number/money": "{label}必须是整数或最多保留两位的小数!",
		"format.number/double": "{label}必须是有效的整数或小数!",
		"format.date": "{label}必须是有效的日期!",
		"pattern": "{label}的格式不正确!",
		"regexp": "{label}的格式不正确!",
		"function": "{label}的格式不正确!",
		"file": "{label}的文件格式不正确，必须为{expected}等格式!"
	};
	// 获取错误消息
	V.fn.getMessage = function(s){
		var message = typeof s.message === "object" ? ( s.message[s.validator + "." + s.trigger] || s.message[s.validator] || s.message[s.trigger] ) : s.message;
		if( !message ){
			message = this.messages[s.validator + "." + s.trigger] || this.messages[s.validator] || this.messages[s.trigger];
		}
		if( message ){
			this.devMode && console && console.log( s );
			message = V.util.parseMessage(message, s, this);
		}else{
			message = this.messages["default"] || "您输入的格式不正确!";
		}
		return message;
	};
	V.fn.labels = { };
	// 设置表单name和标签名称的对应关系
	V.fn.setLabel = function(name, label){
		if(typeof name == "object"){
			$.extend(this.labels, name);
		}else{
			this.labels[name] = label;
		}
	};
	// 获取表单标签名称
	V.fn.getLabel = function($dom){
		if( $dom && $dom.length ){
			var name = $dom.prop("name"), label = name && this.labels[name] || $dom.attr("label") || $dom.prev("label").text();
			if( label ) return label.charAt(0) == "*" ? label.substr(1) : label;
		}
		return "";
	};
	// 渲染器
	V.fn.render = function(message, options){
		// alert(message);
		options.dom && options.dom.tips && options.dom.tips(message) || alert(message);
		var event = options.event;
		if( !event || event.type != "focusout" && event.type != "blur")
			options.dom && options.dom.first().focus();
	};
	// 实例化
	v = new V();
	// 扩展jQuery实例方法
	$.fn.extend( {
		v: function(event, options){
			return v.execute(this, event, options);
		}
	} );
	// 定义规则
	v.define({
		"username": {
			pre: "trimAll,lower,flush",
			text: /^[a-z][a-z0-9_]{5,15}$/i,
			message: "{label}必须是英文、数字和下划线组成的6~16位字符，并且必须以字母开头!"
		},
		"password": {
			length: "[6,16]"
		},
		"age": {
			format: "number",
			range: "[18,100]"
		},
		"int": {
			format: "number"
		},
		"+int": {
			format: "number",
			range: "(0,)"
		},
		"money": {
			format: "number/money"
		},
		"+money": {
			format: "number/money",
			range: "(0,)"
		},
		"phoneCode": {
			format: "number",
			length: "[6]"
		},
		"imageCode": {
			length: "[4]"
		},
		"required": {},
		"cellphone": true,
		"email": true,
		"idcard": true,
		"file": "jpg|jpeg|gif|png|bmp"
	});
}(jQuery);