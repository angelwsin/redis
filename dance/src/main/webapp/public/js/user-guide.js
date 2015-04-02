// 新手指引
jQuery(function($) {
	var top = $('#guide_box').offset().top, $menu = $("#guide_menu"), $lis = $("#guide_menu").find("li"), ranges = [0, 465, 838, 1265, 1616];
	$(window).scroll(function() {
		var scrollTop = $(this).scrollTop(), diff = top - scrollTop;
		if (diff <= 0) $menu.css({'position': 'fixed', 'top': '0'});
		else $menu.css({'position': '', 'top': '', 'margin-top': ''});
		for(var i = 0; i < ranges.length; i++){
			if(ranges[i] > scrollTop) break;
		}
		i >= ranges.length && (i = ranges.length - 1);
		$lis.eq(i-1).addClass("current").siblings(".current").removeClass("current");
	});
	$menu.on("click", "a", function(){ $(window).scroll(); });
});