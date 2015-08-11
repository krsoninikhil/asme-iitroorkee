$(document).ready(function(){
	$("#dropdownMenuLogin").click(function(){
		$(".widget-box").toggle();
	});
	$(window).scroll(function (event) {
    var scroll = $(window).scrollTop();
		if(scroll > 0)	$("#main-navigation").addClass('opaque');
		else $("#main-navigation").removeClass('opaque');
	});
	$( "section, #myCarousel" ).click(function(){
		$(".widget-box").hide();
	});
});