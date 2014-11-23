//Displays and hides the prefChoice div, which contains the Viewing Options.
jQuery(document).ready(function() {
	jQuery("#Preferences").click(
		function() {
		    jQuery ("#prefChoice").toggle();
	    }
	  
    ); // end click
	//This happens once when the document is ready
	    jQuery ("#prefChoice").hide();
}); // end ready

//preChoice 
