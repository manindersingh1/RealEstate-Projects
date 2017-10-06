/**
 * This scripts popup a registration form.
 */
var is_superbox_loaded_register = false;
var search_criteria=1;
jQuery(document).ready(function() {
	var uid = jQuery('.save-search-container a').attr('uid');
	if(uid==0)
	{
		jQuery(function(){
		    init_superbox_register();
		  });
	}
});

/**
 * Get registration form Popup.
 */
function get_register_form_popup(event) {

  if ( true == is_superbox_loaded_register) {  
      	
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
      var form_url = page.protocol + "//" + page.host + "/protected/link/register" + "?destination=" + destination+'&search_criteria='+search_criteria;
      $target[0].href = form_url;
    }
  }
}

/**
 * Initialize superbox
 * @param search_cri is the parameter use to set global variable search_criteria
 */
function init_superbox_register(search_cri) {
	search_criteria=search_cri;
  if (false == is_superbox_loaded_register) { 
	
    var elements = superbox_elements_register();
    
    for (var i in elements) {
      var element = elements[i]; 
      jQuery(element.selector).attr('rel', 'superbox[iframe][' + element.width + 'x' + element.height + ']');
    }
  
    jQuery.superbox();
    is_superbox_loaded_register = true;
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
function superbox_elements_register() {
  var elements = new Array(); // Holds the elements
  var default_width = 620;  // Default width of the superbox window
  var default_height = 480; // Default height of the superbox window
  
elements.push({'selector': '.save-search-container a', 'width': default_width, 'height': default_height});
  return elements;  
}


