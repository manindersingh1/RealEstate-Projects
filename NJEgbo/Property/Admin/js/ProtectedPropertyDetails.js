/**
 * This script catches clicks on the homepage and processes them for the ProtectedPropertyDetails module
 * @author Christopher Millward
 */
var is_superbox_loaded = false;

jQuery(document).ready(function() {
  var elements = superbox_elements();  
  
  for (var i in elements) {
    var element = elements[i];
    jQuery(element.selector).click(function(event){
      check_for_existing_user(event); // Figure out the appropriate page action to take
    });
  }
  
  // Load the superbox functionality
  jQuery(function(){
    init_superbox();
  });
});

/**
 * Checks to see if the user has visited the site before, and allows the user to register if not
 */
function check_for_existing_user(event) {
  var sidCookieValue = Get_Cookie('sid');
  if (null == sidCookieValue && true == can_show_registration_form() && true == is_superbox_loaded) {  // Cookie doesn't exist

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
      var form_url = page.protocol + "//" + page.host + "/protectedpropertydetails/register" + "?destination=" + destination;
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
      var form_url = page.protocol + "//" + page.host + "/protectedpropertydetails/register" + "?destination=" + destination;
      $target[0].href = form_url;
    }
  }
}

/**
 * Checks to see if the registration form should be shown
 * @return TRUE if the registration form should be shown, else FALSE
 */
function can_show_registration_form() {

	// If no max is defined, show the form for every view
  var max_views = parseInt(Get_Cookie('max_views'));
  var free_views = parseInt(Get_Cookie('free_views'));

  if (null == max_views) {
    return (true);
  }

  if (null == free_views || isNaN(free_views)) {
  	free_views = 0;
  }

  if (free_views >= max_views) {
  	return (true);
  }
  else {
  	return (false);
  }
}

/**
 * Gets the value of a cookie
 * @param check_name
 * @return The value of the named cookie, or null
 *
 * Code for this function was taken from http://techpatterns.com/downloads/javascript_cookies.php
 */
function Get_Cookie( check_name ) {
  // first we'll split this cookie up into name/value pairs
  // note: document.cookie only returns name=value, not the other components
  var a_all_cookies = document.cookie.split( ';' );
  var a_temp_cookie = '';
  var cookie_name = '';
  var cookie_value = '';
  var b_cookie_found = false; // set boolean t/f default f

  for ( i = 0; i < a_all_cookies.length; i++ )
  {
    // now we'll split apart each name=value pair
    a_temp_cookie = a_all_cookies[i].split( '=' );


    // and trim left/right whitespace while we're at it
    cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');

    // if the extracted name matches passed check_name
    if ( cookie_name == check_name )
    {
      b_cookie_found = true;
      // we need to handle case where cookie has no value but exists (no = sign, that is):
      if ( a_temp_cookie.length > 1 )
      {
        cookie_value = unescape( a_temp_cookie[1].replace(/^\s+|\s+$/g, '') );
      }
      // note that in cases where cookie is initialized but no value, null is returned
      return cookie_value;
      break;
    }
    a_temp_cookie = null;
    cookie_name = '';
  }
  if ( !b_cookie_found )
  {
    return null;
  }
}

/**
 * Initialize superbox
 */
function init_superbox() {
  var sidCookieValue = Get_Cookie('sid');
  if (false == is_superbox_loaded && null == sidCookieValue && true == can_show_registration_form()) { // Cookie doesn't exist and free views have been used up, show registration form
    var elements = superbox_elements();
    
    for (var i in elements) {
      var element = elements[i]; 
      jQuery(element.selector).attr('rel', 'superbox[iframe][' + element.width + 'x' + element.height + ']');
    }
  
    if(jQuery('.property_page').length == 0)
    {
    jQuery.superbox();
    }
    is_superbox_loaded = true;
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
function superbox_elements() {
  var elements = new Array(); // Holds the elements
  var default_width = 620;  // Default width of the superbox window
  var default_height = 480; // Default height of the superbox window
  
  // Set the default elements that will be treated as superbox triggers
  
  elements.push({'selector': '.widgets-featuredListings a', 'width': default_width, 'height': default_height});
  elements.push({'selector': '#featureimg a', 'width': default_width, 'height': default_height});
  elements.push({'selector': 'div.column-fp a', 'width': default_width, 'height': default_height});
  elements.push({'selector': 'div.details-button a', 'width': default_width, 'height': default_height});
  elements.push({'selector': '.sub-p4 a', 'width': default_width, 'height': default_height});
  elements.push({'selector': '.short-result-sub-p a', 'width': default_width, 'height': default_height});
  elements.push({'selector': '.property-list .propertyHolder a', 'width': default_width, 'height': default_height});

  // Allow the theme to modify the elements array
  if (typeof(superbox_elements_by_theme) == typeof(Function)) {
    superbox_elements_by_theme(elements);
  }
    
  return elements;  
}


function redirect_visitor_register(url_redirect){
		parent.location.href = url_redirect;
}