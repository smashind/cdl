$(document).on("page:change", function() {
	function scrollToAnchor(aid){
	  var aTag = $("a[name='"+ aid +"']");
	  $('html,body').animate({scrollTop: aTag.offset().top}, 1000);
	}

	$(".pricing-section-link").click(function(e) {
		e.preventDefault();
	  scrollToAnchor('pricing-section');
	});
});