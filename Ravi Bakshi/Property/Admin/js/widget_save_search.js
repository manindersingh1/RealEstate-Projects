$(document).ready(function (){
 	   $('.save_search_link').click(function (event) {
		  $(this).toggleClass("collapse-email");
	      if ($(this).hasClass("collapse-email")){
		     $(this).closest('.save_quick_search_container').next('.save_search_email_container').show();
		     $(this).closest('.save_quick_search_container').next('.save_search_email_container').find('input.form-checkbox').attr('checked','checked');
	      }
	      else {
		  $(this).closest('.save_quick_search_container').next('.save_search_email_container').hide();
	      }
       });

});