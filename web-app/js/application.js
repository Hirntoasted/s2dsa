var activeClass = "active";

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(".message.fadeout").addClass("hide");

$(".playerlist").on("click", "li.active", function() {
	$(this).find(".info").toggleClass("show");
});

$(".footer").on("click", ".button:not[.active]", function(){
	var $this = $(this);
	$this.addClass(activeClass).siblings().removeClass(activeClass);
	$([".tabs .", $this.data("tab")].join("")).addClass(activeClass).siblings().removeClass(activeClass);
});