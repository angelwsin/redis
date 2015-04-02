$(function() {
	var $ul = $("ul.title-list");
	var $lis = $ul.children("li");
	// 设计案例切换
	$lis.click(function() {
		var $me = $(this), index = $me.index();
		$me.addClass('on').siblings().removeClass('on');
		$('.title-list p').stop(true).animate({'left' : index *  $me.width() + 'px'}, 300);
	});
	var current = $ul.attr("current") || 1;
	$lis.eq(current - 1).trigger("click");
});
