// JavaScript Document


function summariesOnly() {
	$("section.collapsible").addClass("collapsed").removeClass("expanded");
	$(".summariesOnly").addClass("enabled");
	$(".fullText").removeClass("enabled");
}

function fullText() {
	$("section.collapsible").addClass("expanded").removeClass("collapsed");
	$(".fullText").addClass("enabled");
	$(".summariesOnly").removeClass("enabled");
}

function recalculateGlobalControllerStatus() {
	if( $("section.collapsible.collapsed").length == 0 ) {
		//if there are no collapsed elements, everything must be expanded
	    $(".fullText").addClass("enabled");
		$(".summariesOnly").removeClass("enabled");
	}	else if( $("section.collapsible.expanded").length == 0 ) {
		//if there are no expanded elements, everything must be collapsed
	    $(".fullText").removeClass("enabled");
		$(".summariesOnly").addClass("enabled");
	} else {
		//otherwise, we have a mix and are in neither global state
	    $(".fullText").removeClass("enabled");
		$(".summariesOnly").removeClass("enabled");
	}
}