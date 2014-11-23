function toggleQSClasses(element, selector, classname) {
	//If this element doesns't have the class "enable" then add the class enabled to this element and add the class "classname" to to all elements selected by selector
	if (!jQuery(element).hasClass("enabled")) {
		jQuery(selector).addClass (classname);
		jQuery(element).addClass("enabled");
	} else {
		jQuery(selector).removeClass (classname);
		jQuery(element).removeClass("enabled");
	}
}

//"this" is an element within a click handler
//"contrast" class is in WOTP.css
