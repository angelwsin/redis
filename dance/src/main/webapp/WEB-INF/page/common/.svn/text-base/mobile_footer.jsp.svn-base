<%@ page language="java" pageEncoding="UTF-8"%>
<footer class="footer">
	<div class="smartTool">
		<a href="${root}/mobile/" class="current" id="index"><i class="nav icon_home"></i>首页</a> <a href="${root}/mobile/borrowList" id="borrowList"><i class="nav icon_lc"></i>投资理财</a> <a href="${root}/mobile/myCenter" id="myCenter"><i class="nav icon_money"></i>我的钱包</a> <a href="${root}/mobile/more" id="more"><i class="nav icon_more"></i>更多</a>
	</div>
</footer>
<x:script>
	<script type="text/javascript">
		(function($) {
			if (!$.setCookie) {
				$.extend({
					setCookie : function(c_name, value, exdays) {
						try {
							if (!c_name)
								return false;
							var exdate = new Date();
							exdate.setDate(exdate.getDate() + exdays);
							var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
							document.cookie = c_name + "=" + c_value + ";path=/";
						} catch (err) {
							return '';
						}
						return '';
					},
					getCookie : function(c_name) {
						try {
							var i, x, y, ARRcookies = document.cookie.split(";");
							for (i = 0; i < ARRcookies.length; i++) {
								x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
								y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
								x = $.trim(x);
								if (x == c_name)
									return (y);
							}
						} catch (err) {
							return '';
						}
						return '';
					}
				});
			}
		})(jQuery);
		$(function() {
			$(".footer .smartTool a").click(function() {
				var id = $(this).attr("id");
				$.setCookie("id", id, 5);
			});
			var id = $.getCookie("id");
			if (id.length > 0) {
				$("#" + id).addClass("current");
				$("#" + id).prevAll().removeClass("current");
			}
		});
	</script>
</x:script>
${jsCode}
<x:script output="true" />
</body>
</html>