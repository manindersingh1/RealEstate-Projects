
// Global Styles 
// Theme    : AweLand - Responsive Coming Soon Template
// Author   : Lantern Themes


// ---------- Preloader ----------
(function($) {
	"use strict";
	$(window).load(function() {
		$("#loader").fadeOut();
		$("#mask").delay(1000).fadeOut("slow");
	});
	// ---------- Flexslider Script ----------
	$('.flexslider').flexslider({
		animation: "fade",
		start: function(slider){
		  $('body').removeClass('loading');
		}
	});
})(jQuery);

	// ---------- Header Slideshow ----------

(function() {
		"use strict";
		$.vegas('slideshow', {
			backgrounds:[
				{ src: 'rpl/img/road1.jpg', fade: 1000 },
				{ src: 'rpl/img/road2.jpg', fade: 1000 },
				{ src: 'rpl/img/road3.jpg', fade: 1000 },
				{ src: 'rpl/img/road4.jpg', fade: 1000 }
			]
		})
})(jQuery);
