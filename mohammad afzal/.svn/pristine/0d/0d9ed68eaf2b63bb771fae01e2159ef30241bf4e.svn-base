
var search_criteria;

$(document).ready(function (){
	$('.save-search').click(function (event) {
		var uid = $(this).attr('uid');
		search_criteria = get_search_criteria();
		if(uid > 0)
		{
			save_search_main(search_criteria,0); //when user logged in directly calling save search
		}
		else{
			//first register the user and than save search
			jQuery(function(){
				init_superbox_register(search_criteria);
			  });
			get_register_form_popup(event);
		}
		
	});
	$('.property_page').click(function (event) {
		var uid = $(this).attr('uid');
		var search_criteria=$(this).attr('get_data');
		
		if(uid > 0)
		{
			save_search_main(search_criteria,0);
		}
		else{
			jQuery(function(){
				init_superbox_register(search_criteria);
			  });
			get_register_form_popup(event);
		}
		
	});
	$('.property_form_save_search').click(function (event) {
		$(this).toggleClass("property_form-email");
		if ($(this).hasClass("property_form-email")){
			$('.save_search_property_form_container').show();
		}
		else {
			$('.save_search_property_form_container').hide();
		}
		
	});
});

/*
 * Function to build search criteria ,eventually saved into database
 */
function get_search_criteria(){
	var search_criteria;
	
	var city_state_cntry = $('#gmap-location').val();
	 var point=map.getCenter();
	
	 var city = city_state_cntry.split(',');
	var city=city[0];
	
    var params = "latitude=" + point.lat() + ";longitude=" + point.lng();
    
    var curBounds = map.getBounds();
    var params_boundary = "latNE=" + curBounds.getNorthEast().lat()+ ";latSW=" +curBounds.getSouthWest().lat()+ ";lngNE=" + curBounds.getNorthEast().lng() + ";lngSW="+curBounds.getSouthWest().lng();
	
	var price_from=$('#gmap-price-from').val();
	var new_price_from = price_from.replace('$','');
	price_from = new_price_from.replace(/\,/g,'');
	var price_to=$('#gmap-price-to').val();
	var new_price_to = price_to.replace('$','');
	price_to = new_price_to.replace(/\,/g,'');
	var bedrooms = $('#gmap-bedrooms').val();
	var bathrooms = $('#gmap-bathrooms').val();
	
	var rent = ($('#gmap-rent').attr('checked')) ? 1:0; 
	var sale = ($('#gmap-sale').attr('checked')) ? 1:0; 
	var detached = $('.detached').hasClass('selected') ? 1:0; 
	var semi =  $('.semidetached').hasClass('selected') ? 1:0; 
	var condo =  $('.condo').hasClass('selected') ? 1:0; 
	var townhomes = $('.townhomes').hasClass('selected') ? 1:0;
	var other = $('.other').hasClass('selected') ? 1:0;
	var zoom_level = map.getZoom();
	var sort =$('#gmap-sort :selected').val();
	
	search_criteria = 'city='+city+';'+params_boundary+';'+params+';price_from='+price_from+';price_to='+price_to+';bedrooms='+bedrooms
	+';bathrooms='+bathrooms+';for_rent='+rent+';for_sale='+sale
	+';detached='+detached+';semidetached='+semi+';condo='+condo+';townhomes='+townhomes+';other='+other+';property_sort='+sort+';zoom_level='+zoom_level+';map_page='+1;
	return search_criteria;
	//city=Mississauga,latNE=43.59444108750369,latSW=43.56335210532192,lngNE=-79.62736129760742,lngSW=-79.68915939331055,price_from=5000,price_to=$30,000,bedrooms=3,bathrooms=5,rent=0,sale=1,detached=1,semi=0,condo=0,townhomes=1,other=0,sort=price_asc
	
}

/*
 * Function to save search
 * @param from specify the area from where it is called if user logged in than from =0 else from=1 (calling after registering the user)
 */
function save_search_main(search_criteria,from){

	$('.save-search-container a').hide();
	$('.search_saving').show();
			
			//alert(search_criteria);
			$.ajax ({
			    dataType:"html",
			    type:"POST",
			    data:"search_criteria="+search_criteria,
			    url:"/save/search",
			    success: function(msg){
						$('.save-search-container a').show();
						$('.save-search-container a').addClass('already-saved');
						$('.save-search-container a').text("Saved!");
						$('.search_saving').hide();
						if(from)
						parent.location.href = destination_to;
			    },
			    error:function (xhr, ajaxOptions, thrownError){
			      alert(xhr.status);
			      alert(thrownError);
			    } 
			});

    
}


function refresh_save_search_btn() {
	$('.save-search-container a').removeClass('already-saved');
	$('.save-search-container a').text("Save Search");
}

/*
 * Helper function
 */
function addDots(){
	$('.submit-wait').append('.');
}