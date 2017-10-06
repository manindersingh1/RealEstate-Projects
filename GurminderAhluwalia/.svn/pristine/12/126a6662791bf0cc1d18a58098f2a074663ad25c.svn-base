/**
 * This scripts popup a registration form.
 */
var is_superbox_loaded_register_vow = false;
var search_criteria=1;
jQuery(document).ready(function() {
	$('.vow-link').click(function (event) {
		//search_criteria_vow = get_search_criteria_vow();
		//alert(seacrh_criteria);exit;
			//first register the user and than save search
			var search_criteria=$(this).attr('get_data');
			jQuery(function(){
				init_superbox_register_vow(search_criteria);
			  });
			get_register_form_popup_vow(event);
		
	});
	jQuery(function(){
		    init_superbox_register_vow();
	});
});

function register_redirect(){
	$('.vow-container').hide();
	parent.location.href = destination_to_vow;
}
/**
 * Get registration form Popup.
 */
function get_register_form_popup_vow(event) {

  if ( true == is_superbox_loaded_register_vow) {  
      	
    // Save the destination and load the form
    var $target = jQuery(event.target);
    var destination = '';
    if ($target.is("img")) {
      var $parent = $target.parent();
      destination = $parent[0];

      // Prevent multiple calls to this function from 'stacking' the registration URL again and again
      var propertyURLPosition = destination.href.indexOf('destination=');
      if (-1 != propertyURLPosition) {
        destination.href = destination.href.substr(propertyURLPosition + 'destination='.length);
      }

      var page = window.location;
      var form_url = page.protocol + "//" + page.host + "/protected/link/register" + "?destination=" + destination;
      $parent[0].href = form_url;
    }
    else if ($target.is("a")) {
      destination = $target[0].href;
      // Prevent multiple calls to this function from 'stacking' the registration URL again and again
      var propertyURLPosition = destination.indexOf('destination=');
      if (-1 != propertyURLPosition) {
        destination = destination.substr(propertyURLPosition + 'destination='.length);
      }
      
      var page = window.location;
      var form_url = page.protocol + "//" + page.host + "/vow/link/register" + "?destination=" + destination+'&search_criteria='+search_criteria;
      $target[0].href = form_url;
    }
  }
}

/*
 * Function to build search criteria ,eventually saved into database
 */
function get_search_criteria_vow(){
	var search_criteria;
	
	var city_state_cntry = $('#gmap-location').val();
	 var point=map.getCenter();
	
	 var city = city_state_cntry.split(',');
	var city=city[0];
	
    var params = "latitude=" + point.lat() + ";longitude=" + point.lng();
	
	var price_from=$('#gmap-price-from').val();
	var new_price_from = price_from.replace('$','');
	price_from = new_price_from.replace(/\,/g,'');
	var price_to=$('#gmap-price-to').val();
	var new_price_to = price_to.replace('$','');
	price_to = new_price_to.replace(/\,/g,'');
	var bedrooms = $('#gmap-bedrooms').val();
	var bathrooms = $('#gmap-bathrooms').val();
	
	var rent = ($('#gmap-rent').attr('checked') == true) ? 1:0; 
	var sale = ($('#gmap-sale').attr('checked') == true) ? 1:0; 
	var detached = $('.detached').hasClass('selected') ? 1:0; 
	var semi =  $('.semidetached').hasClass('selected') ? 1:0; 
	var condo =  $('.condo').hasClass('selected') ? 1:0; 
	var townhomes = $('.townhomes').hasClass('selected') ? 1:0;
	var other = $('.other').hasClass('selected') ? 1:0;
	var zoom_level = map.getZoom();
	var sort =$('#gmap-sort :selected').val();
	
	search_criteria = 'city='+city+';'+params+';price_from='+price_from+';price_to='+price_to+';bedrooms='+bedrooms
	+';bathrooms='+bathrooms+';for_rent='+rent+';for_sale='+sale
	+';detached='+detached+';semidetached='+semi+';condo='+condo+';townhomes='+townhomes+';other='+other+';property_sort='+sort+';zoom_level='+zoom_level+';map_page='+1;
	return search_criteria;
	//city=Mississauga,latNE=43.59444108750369,latSW=43.56335210532192,lngNE=-79.62736129760742,lngSW=-79.68915939331055,price_from=5000,price_to=$30,000,bedrooms=3,bathrooms=5,rent=0,sale=1,detached=1,semi=0,condo=0,townhomes=1,other=0,sort=price_asc
	
}

/**
 * Initialize superbox
 * @param search_cri is the parameter use to set global variable search_criteria
 */
function init_superbox_register_vow(search_cri) {
	search_criteria=search_cri;
  if (false == is_superbox_loaded_register_vow) { 
	
    jQuery('.vow-container a').attr('rel', 'superbox[iframe][' + 620 + 'x' + 400 + ']');
    jQuery.superbox();
    is_superbox_loaded_register_vow = true;
  }
}

/**
 * Gets an array of elements that should be tagged with the superbox
 * Also tries to call the superbox_elements_by_theme() function to allow each theme to modify / add to the array
 * The returned array is structured as follows:
 * 
 * array[0] = {selector: element_selector, width: width_of_superbox, height: height_of_superbox}
 * 
 */
function superbox_elements_register_vow() {
  var elements = new Array(); // Holds the elements
  var default_width = 620;  // Default width of the superbox window
  var default_height = 400; // Default height of the superbox window
  
  elements.push({'selector': '.vow-container a', 'width': default_width, 'height': default_height});
  return elements;  
}





