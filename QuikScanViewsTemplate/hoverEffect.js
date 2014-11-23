//Hover Helper is a viewing option.
jQuery(document).ready(function() {
	jQuery.each(jQuery('.summary li a'), function(index, value) {
		var id = jQuery(value).attr('href'); // find the ID of the element this link targets
		var container = jQuery(id);	// find the DOM object with this new ID
		jQuery(value).hover(function() {		// create a hover effect
				// Requires a dwell time in order to trigger hover helper.
				// After specified time, checks to see if queuedHover is still there. If so,
				// applies hoverHelper.
				jQuery(container).next().addClass("queuedHover");
				window.setTimeout(function() {
					if (jQuery(container).next().hasClass("queuedHover")) {
						jQuery(container).next().addClass("hoverHelper");
					}
				}, 400);
		}, function() {
				jQuery(container).next().removeClass("queuedHover");
				jQuery(container).next().removeClass("hoverHelper");
		});
	});
	toggleQSClasses(document, 'section', 'useHoverHelper'); //turn hover effect on by default
});
//  hoverHelper.class in template.css.

