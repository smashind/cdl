$(document).on("page:change", function() {
	$('#check-answer').click(function() {
		if($('#correct').is(':checked')) { 
			alert("You chose the right answer");
			if (sessionStorage.getItem("score") === null) { 
				sessionStorage.setItem("score", 1);
				$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
				$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
			} else {
				sessionStorage.setItem("score", parseInt(sessionStorage.getItem("score")) + 1);
				$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
				$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
			}
			$('#yourscore').html(sessionStorage.getItem("score"));
			$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
			$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
		} else {
			alert("Incorrect. The correct answer was " + '"' + $("input[id=correct]").attr("data-value") + '"');
			$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
			$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
		}
		$("#check-answer").fadeOut("fast");
		$("#test-nav").fadeIn("fast");
		$("#save").fadeOut("fast");
		$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
		$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
	});
});
// Update user's score
$(document).on("page:change", function() {
	var user_score = parseInt(sessionStorage.getItem("score"));
	$('#attempt_score').val(user_score);
  $('#yourscore').html(parseInt(sessionStorage.getItem("score")));
});