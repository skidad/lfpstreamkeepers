// JavaScript Document


$(".collapsible").on("click", "a", function(event){
	// try to find parent element with class collapsed.  if section is not collapsed, this element will be null
    var parentSection = $(event.target).parents("section.collapsed");
    // if we found a collapsed parent, it means this section is collapsed.  expand it.
    //No css for expanded. If you remove remove the collapsed click which hides section, then it is shown.
	// also, add class "shouldCollapse" to keep track of the fact they've clicked this checkbox.  this prevents the text from collapsing when you jump back to the TOC.
	parentSection.removeClass("collapsed").addClass("expanded").addClass("shouldCollapse");
	recalculateGlobalControllerStatus();
	// Fix for Chrome Bug 377913 -- add and remove a random CSS style
	parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "1");
	parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "");
});

$(".collapsible").on("click", "ul ~ p  a", function(event){
	var parentSection = $(event.target).parents("section.shouldCollapse");
	parentSection.removeClass("shouldCollapse").addClass("collapsed").removeClass("expanded");
	recalculateGlobalControllerStatus()
});

$(".collapsible").on("click", ".sectionNoteFormat+*", function(event){
	if($(event.target).prop("tagName").toLowerCase() == "a") { 
		//user clicked heading, not expander.  just return.
		return;
	}
	var parentSection = $(event.target).parents("section.expanded");
	if( parentSection.length > 0 ) {
		parentSection.removeClass("shouldCollapse").addClass("collapsed").removeClass("expanded");
		recalculateGlobalControllerStatus();
		// Fix for Chrome Bug 377913 -- add and remove a random CSS style
		parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "1");
		parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "");
		// End fix for Chrome Bug
	} else {
		parentSection = $(event.target).parents("section.collapsed");
		parentSection.removeClass("shouldCollapse").addClass("expanded").removeClass("collapsed");
		recalculateGlobalControllerStatus();
		// Fix for Chrome Bug 377913 -- add and remove a random CSS style
		parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "1");
		parentSection.find("ul ~ *,.sectionNoteFormat+*").css("zoom", "");
		// End fix for Chrome Bug
	}
});



function summariesOnly() {
	$("section.collapsible").addClass("collapsed").removeClass("expanded");
	$(".summariesOnly").addClass("enabled");
	$(".fullText").removeClass("enabled");
	// Fix for Chrome Bug 377913 -- add and remove a random CSS style
	$("ul ~ *,.sectionNoteFormat+*").css("zoom", "1");
	$("ul ~ *,.sectionNoteFormat+*").css("zoom", "");
}

function fullText() {
	$("section.collapsible").addClass("expanded").removeClass("collapsed");
	$(".fullText").addClass("enabled");
	$(".summariesOnly").removeClass("enabled");
	// Fix for Chrome Bug 377913 -- add and remove a random CSS style
	$("ul ~ *,.sectionNoteFormat+*").css("zoom", "1");
	$("ul ~ *,.sectionNoteFormat+*").css("zoom", "");
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