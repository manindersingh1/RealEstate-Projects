jQuery(document).ready(function($){
								
	/*Menu */
	function megaMenu() {
		var screenWidth = $(document).width(),
		containerWidth = $("#header .container").width(),
		containerMinuScreen = (screenWidth - containerWidth)/2;
		if( containerWidth == screenWidth ){

			$px = mytheme_urls.scroll == "disable" ? 45 : 25;
			
			$("li.menu-item-megamenu-parent .megamenu-child-container").each(function(){

				var ParentLeftPosition = $(this).parent("li.menu-item-megamenu-parent").offset().left,
				MegaMenuChildContainerWidth = $(this).width();

				if( (ParentLeftPosition + MegaMenuChildContainerWidth) > screenWidth ){
					var SwMinuOffset = screenWidth - ParentLeftPosition;
					var marginFromLeft = MegaMenuChildContainerWidth - SwMinuOffset;
					var marginFromLeftActual = (marginFromLeft) + $px;
					var marginLeftFromScreen = "-"+marginFromLeftActual+"px";
					$(this).css('left',marginLeftFromScreen);
				}

			});
		} else {

			$px = mytheme_urls.scroll == "disable" ? 40 : 20;

			$("li.menu-item-megamenu-parent .megamenu-child-container").each(function(){
				var ParentLeftPosition = $(this).parent("li.menu-item-megamenu-parent").offset().left,
				MegaMenuChildContainerWidth = $(this).width();

				if( (ParentLeftPosition + MegaMenuChildContainerWidth) > containerWidth ){
					var marginFromLeft = ( ParentLeftPosition + MegaMenuChildContainerWidth ) - screenWidth;
					var marginLeftFromContainer = containerMinuScreen + marginFromLeft + $px;

					if( MegaMenuChildContainerWidth > containerWidth ){
						var MegaMinuContainer	= ( (MegaMenuChildContainerWidth - containerWidth)/2 ) + 10;
						var marginLeftFromContainerVal = marginLeftFromContainer - MegaMinuContainer;
						marginLeftFromContainerVal = "-"+marginLeftFromContainerVal+"px";
						$(this).css('left',marginLeftFromContainerVal);
					} else {
						marginLeftFromContainer = "-"+marginLeftFromContainer+"px";
						$(this).css('left',marginLeftFromContainer);
					}
				}

			});
		}
	}
	
	megaMenu();
	$(window).smartresize(function(){
		megaMenu();
	});
	
	
	//Menu Hover Animation...
	$("li.menu-item-depth-0,li.menu-item-simple-parent ul li" ).hover(function(){
		//mouseover 
		if( $(this).find(".megamenu-child-container").length  ){
			$(this).find(".megamenu-child-container").stop().fadeIn('fast');
		} else {
			$(this).find("> ul.sub-menu").stop().fadeIn('fast');
		}
		
	},function(){
		//mouseout
		if( $(this).find(".megamenu-child-container").length ){
			$(this).find(".megamenu-child-container").stop(true, true).hide();
		} else {
			$(this).find('> ul.sub-menu').stop(true, true).hide(); 
		}
	});
	
	if( navigator.platform.match(/(Mac|iPhone|iPod|iPad)/i) || 
		navigator.userAgent.match(/Android/i)||
		navigator.userAgent.match(/webOS/i) || 
		navigator.userAgent.match(/iPhone/i) || 
		navigator.userAgent.match(/iPod/i)) {
			if( mytheme_urls.stickynav === "enable") {
				$("#header-wrapper").sticky({ topSpacing: 0 });
			}
	} else {
		if( mytheme_urls.stickynav === "enable") {
			$("#header-wrapper").sticky({ topSpacing: 0 });
		}
	}	
	//Menu Ends Here
	
	var isMacLike = navigator.platform.match(/(Mac|iPhone|iPod|iPad)/i)?true:false;
	if( mytheme_urls.scroll === "enable" && !isMacLike ) {
		jQuery("html").niceScroll({zindex:99999,cursorborder:"1px solid #424242"});
	}

	//Menu
	if( mytheme_urls.isResponsive === "enable" ) {
		$('nav#main-menu').meanmenu({ meanMenuContainer :  $('header #primary-menu'), meanRevealPosition:  'right', meanScreenWidth : 767 , meanRemoveAttrs: true });
	}
	
	/* To Top */
	$().UItoTop({ easingType: 'easeOutQuart' });

	/* Portfolio Lightbox */
	if($(".gallery").length) {
		$(".gallery a[data-gal^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: false,social_tools: false,deeplinking:false});		
	}


	//Portfolio Single page Slider
	if( ($(".portfolio-slider").length) && ($(".portfolio-slider li").length > 1) ) {
		$('.portfolio-slider').bxSlider({ auto:false, video:true, useCSS:false, pager:'', autoHover:true, adaptiveHeight:true });
	}//Portfolio Single page Slider

	//Property Slider
	$(".porperty-slider").each(function(){
		if( $(this).find("li").length > 1 ){
			$(this).bxSlider({ auto:false, video:true, useCSS:false, pager:'', autoHover:true, adaptiveHeight:true });
		}
	});//Property Slider

	//Property Slider in Single Property
	if( $(".property-gallery").find("li").length > 1 ) {
		$(".property-gallery").bxSlider({ auto:false, video:true, useCSS:false, pagerCustom: '#bx-pager', autoHover:true, adaptiveHeight:true });
	}//Property Slider in Single Property

    if( ($("ul.entry-gallery-post-slider").length) && ( $("ul.entry-gallery-post-slider li").length > 1 ) ){
	  	$("ul.entry-gallery-post-slider").bxSlider({auto:false, video:true, useCSS:false, pager:'', autoHover:true, adaptiveHeight:true});
    }	
    
	/* Placeholder Script */
  if(!Modernizr.input.placeholder){
    $('[placeholder]').focus(function() {
      
      var input = $(this);
      if( input.val() == input.attr('placeholder') ) {
        input.val('');
        input.removeClass('placeholder');
      }
      }).blur(function() {
      
      var input = $(this);
      if (input.val() === '' || input.val() === input.attr('placeholder')) {
        input.addClass('placeholder');
        input.val(input.attr('placeholder'));
      }
      }).blur();
    
    $('[placeholder]').parents('form').submit(function() {
      $(this).find('[placeholder]').each(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
          input.val('');
        }
       });
     });
  }

  $("div.dt-video-wrap").fitVids();

	$(window).smartresize(function(){
		if( $(".apply-isotope").length ) {
			$(".apply-isotope").isotope({itemSelector : '.column',transformsEnabled:false,masonry: { gutterWidth: 20} });
		}
	});
	
	if( $(".apply-isotope").length ) {
		$(".apply-isotope").isotope({itemSelector : '.column',transformsEnabled:false,masonry: { gutterWidth: 20} });
	}	

	$(window).load(function() {

		//Agents Carousel
		if( $('.dt-sc-agent-carousel').length ) {
			$('.dt-sc-agent-carousel').each(function(){
				var pagger = $(this).parents(".dt-sc-agent-carousel-wrapper").find("div.carousel-arrows"),
				next = pagger.find("a.agents-next"),
				prev = pagger.find("a.agents-prev") ;

				$(this).carouFredSel({
					responsive:true,
					auto:false,
					width:'100%',
					height: 'variable',
					scroll:1,
					items:{ 
						width:600,
						height: 'variable',
						visible: {min: 1,max: 2} 
					},
					prev:prev,
					next:next
				});
			});
		}

		//Portfolio isotope
		var $container = $('.dt-sc-portfolio-container');
		if( $container.length) {
			
			$width = $container.hasClass("no-space") ? 0 : 20;

			$(window).smartresize(function(){
				$container.css({overflow:'hidden'}).isotope({itemSelector : '.column',masonry: { gutterWidth: $width } });
			});
			
			$container.isotope({
			  filter: '*',
			  masonry: { gutterWidth: $width },
			  animationOptions: { duration: 750, easing: 'linear', queue: false  }
			});
		}
		
		if($("div.dt-sc-sorting-container").length){
			$("div.dt-sc-sorting-container a").click(function(){
				$width = $container.hasClass("no-space") ? 0 : 20;				
				$("div.dt-sc-sorting-container a").removeClass("active-sort");
				var selector = $(this).attr('data-filter');
				$(this).addClass("active-sort");
				$container.isotope({
					filter: selector,
					masonry: { gutterWidth: $width },
					animationOptions: { duration:750, easing: 'linear',  queue: false }
				});
			return false;	
			});
		}
		//Portfolio isotope End
		
		$("ul.products li .product-wrapper").each(function(){
			var liHeight = $(this).height(); 
			$(this).css("height", liHeight);
	  	});

		//Blog
		if( $(".apply-isotope").length ){
			$(".apply-isotope").isotope({itemSelector : '.column',transformsEnabled:false,masonry: { gutterWidth: 20} });
		}//Blog
	});	

	if($("div#single-gmap").length ) {

		var $title = $("div#single-gmap").data("title");

		var $lat = $("div#single-gmap").data("lat");
			$lat = ( $.trim($lat).length > 0  ) ? $lat :  "-37.80544394934272";

		var $lng = $("div#single-gmap").data("lng");	
			$lng = ( $.trim($lng).length > 0 ) ? $lng : "144.964599609375";

		var $icon = $("div#single-gmap").data("icon");	

		var myLatlng = new google.maps.LatLng($lat,$lng);
		var mapOptions = {
			zoom: 8,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}

		var map = new google.maps.Map(document.getElementById('single-gmap'), mapOptions);
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title : $title,
			icon: $icon
		});

  		var infowindow = new google.maps.InfoWindow({
      		content: $title+"<br>"+$("div#single-gmap").data("address")
  		});

	  google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map,marker);
  	  });
	}

	if( $("form#property-enquiry").length ) {
		$("form#property-enquiry").submit(function(event){
			event.preventDefault();

			var $this = $(this);
			var $action = $this.attr('action');

			$.post($action,{
				txtfname : $("[name=txtfname]").val(),
				txtlname : $("[name=txtlname]").val(),
				txtemail : $("[name=txtemail]").val(),
				phone : $("[name=phone]").val(),
				message : $("[name=message]").val(),
				property_link : $("[name=property_link]").val(),
				admin_emailid : $("[name=admin_emailid]").val(),
				agents : $("[name=agents\\[\\]]").map(function(){return $(this).val();}).get(),
				txtproperty: $("[name=txtproperty]").val()
			},function(data){
				$this.find("#message").html(data);
			});
		});
	}


});