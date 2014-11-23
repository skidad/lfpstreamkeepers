//Independently turns high contrast and large font viewing options on and off. 

function toggleQSClasses(element, selector, classname) {
	//If this element doesn't have the class "enable" then add the class enabled to this element and add the class "classname" to to all elements selected by selector
	if (!jQuery(element).hasClass("enabled")) {
		jQuery(selector).addClass (classname);
		jQuery(element).addClass("enabled");
		jQuery(element).next("label").html(jQuery(element).next("label").html().replace("Off", "On"));
	} else {
		jQuery(selector).removeClass (classname);
		jQuery(element).removeClass("enabled");
		jQuery(element).next("label").html(jQuery(element).next("label").html().replace("On", "Off"));
	}
}

//"this" is an element within a click handler
//"contrast" and " fontGrow" classes are in template.css.
