if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(".players").on("click", ".locked", function(){
	$(".unlock").removeClass("hidden");
});

$(".unlock").on("click", ".reset", function(){
	$(".unlock").addClass("hidden");
});