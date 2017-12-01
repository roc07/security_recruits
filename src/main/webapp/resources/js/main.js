function colorAppraisal(review){
	var result = $(review).text();
	if (result == 1){
		$(".appraisal-text").css({"color":"red", "font-size":"85%", "background-color":"#ffcccc", "border": "1px solid black"});
	} else if (result == 2){
		$(".appraisal-text").css({"color":"#ff6600", "font-size":"95%", "background-color":"#ffe0cc", "border": "1px solid black"});	
	} else if (result == 3){
		$(".appraisal-text").css({"color":"#ffcc00", "font-size":"105%", "background-color":"#fff5cc", "border": "1px solid black"});	
	} else if (result == 4){
		$(".appraisal-text").css({"color":"#73e600", "font-size":"120%", "background-color":"#e6ffcc", "border": "1px solid black"});
	} else if (result == 5){
		$(".appraisal-text").css({"color":"#00cc00", "font-size":"135%", "background-color":"#ccffcc", "border": "1px solid black"});	
	}
}

function scoreEvaluator(current, max, scClass, percentage) {
	$(".curr-score").each(function() {
		if ($(this).text() < 100){
			$(this).css("background-color","red");
			$(this).text();
		} else {
			$(this).css("background-color","lightgreen");
			$(this).text();
		}
	})
}

function colorTrickShow() {
	$(".color-button").click();
	$("#colorTrickHide").css("display","table-cell");
	$("#colorTrickShow").css("display","none");
}

function colorTrickHide() {
	$("#colorTrickHide").css("display","none");
	$("#colorTrickShow").css("display","table-cell");
}

$(document).ready(function(){
    colorAppraisal(".app-review"); 
});

