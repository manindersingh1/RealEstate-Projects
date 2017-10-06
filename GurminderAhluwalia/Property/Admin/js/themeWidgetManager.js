// don't put sign $ in this file. Use only jQuery!
//reason: otherwise we'll have conflict between libraries in the theme_agent_template theme 

jQuery(document).ready(function() { 
	
	jQuery('#WidgetsToolbar .slide_button a').click(function(){ // hide/show toolbar
        
     if (parseInt(jQuery('#WidgetsToolbar').css('marginTop'),10)>-1) {  // hide toolbar
	    	 jQuery('body').css('cssText','padding-top:154px'); jQuery('.fullscreen').css('cssText','padding-top:154px'); 
	    	 
	    	 jQuery('#WidgetsToolbar').animate({marginTop: '-=100px'}, 800, function(){ 
	    	 jQuery('#WidgetsToolbar .slide_button a').addClass('collapsedGallery');
	    	 jQuery('#WidgetsToolbar .slide_button a').text('SHOW');

   	 	     jQuery('div.trackwidgetsRegions').css("background-image","none");
   	 	     jQuery('div.trackwidgetsRegions div.TitleToolBar').hide();
   	 	     jQuery("div.trackwidgetsRegions div.blockToolbarItem").css({"border": "none","background-color": "transparent" });
         });
         
    	 jQuery('body').animate({paddingTop: '-=150px'},800, function(){ jQuery('body').css('cssText','padding-top:4px! important');  });
      	 jQuery('.fullscreen').animate({paddingTop: '-=150px'},800, function(){ jQuery('.fullscreen').css('cssText','padding-top:4px! important'); });
    	 var hide_toolbar = 0;
        }
     else{  // show toolbar

    	 jQuery('body').css('cssText','padding-top:4px'); jQuery('.fullscreen').css('cssText','padding-top:4px');
    	 jQuery('#WidgetsToolbar').animate({marginTop: '+=100px'}, 800, function(){
    		 jQuery('#WidgetsToolbar .slide_button a').removeClass('collapsedGallery'); 
    		 jQuery('#WidgetsToolbar .slide_button a').text('HIDE');       
 	    
   	 	     jQuery('div.trackwidgetsRegions').css("background-image","url(modules/WidgetsManager/images/ModeBackground.png)");
   	 	     jQuery('div.trackwidgetsRegions div.TitleToolBar').show();
			 jQuery("div.trackwidgetsRegions div.blockToolbarItem").css({"border": "1px solid #999999","background-color": "#cccccc" });
   	 	     
        });
    	 jQuery('body').animate({paddingTop: '+=150px'},800, function(){ jQuery('body').css('cssText','padding-top:154px! important'); });
    	 jQuery('.fullscreen').animate({paddingTop: '+=150px'},800, function(){ jQuery('.fullscreen').css('cssText','padding-top:154px! important'); });
    	 var hide_toolbar = 1;
       }   
		     jQuery.ajax({
		      	type:'POST',
     			url:'/widgetsmanager/set/session_hide',
		      	data: "hide_toolbar="+hide_toolbar,
		      	success: function(msg){
		     	}
		 	});
      }); 
    
});