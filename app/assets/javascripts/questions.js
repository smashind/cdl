function setCorrect() {
	$('#attempt_score').val(parseInt(sessionStorage.getItem("score")));
	$('#finish-score').val(parseInt(sessionStorage.getItem("score")));
}

function setIncorrect() {
	$('#attempt_incorrect').val(parseInt(sessionStorage.getItem("incorrect")));
	$('#finish-incorrect').val(parseInt(sessionStorage.getItem("incorrect")));
}

function submitPressed() {
	sessionStorage.setItem("submitted", true);
}

function setNotAnswered() {
	sessionStorage.setItem("answered", false);
}

$(document).on("page:change", function() {
	// Scoring mechanism after clicking submit
	$('#check-answer').click(function() {
		// correct answer
		if ((sessionStorage.getItem("answered") === "true") || (sessionStorage.getItem("submitted") === "true")) {
			sweetAlert("You already answered this one!", "Please press the 'Next' button.");
		} else {
			if($('#correct').is(':checked')) { 
				$('input:checked').parent('li').addClass("correct");
				sweetAlert("That's correct!", "", "success");
				if (sessionStorage.getItem("score") === null) { 
					sessionStorage.setItem("score", 1);
					setCorrect();
				} else {
					sessionStorage.setItem("score", parseInt(sessionStorage.getItem("score")) + 1);
					setCorrect();
				}
				setCorrect();
				// incorrect answer
			} else {
				$('input:checked').parent('li').addClass("incorrect");
				$("input[id=correct]").parent('li').addClass("correct");
				sweetAlert("Incorrect.", "The correct answer was " + '"' + $("input[id=correct]").attr("data-value") + '"', "error");
				if (sessionStorage.getItem("incorrect") === null) { 
					sessionStorage.setItem("incorrect", 1);
					setIncorrect();
				} else {
					sessionStorage.setItem("incorrect", parseInt(sessionStorage.getItem("incorrect")) + 1);
					setIncorrect();
				}
				setIncorrect();
			}
		}
		// Navigation
		$("#save").fadeOut("fast");
		$("#check-answer").fadeOut("fast", function() {
      $("#test-nav").fadeIn("fast");
		});
		setCorrect();
		setIncorrect();
		submitPressed();
	});
  
  // Set user score
	var user_score = parseInt(sessionStorage.getItem("score"));
	$('#attempt_score').val(user_score);
  // Set user incorrect
  var user_missed = parseInt(sessionStorage.getItem("incorrect"));
  $('#attempt_incorrect').val(user_missed);

  // Highlight selected choice
  $('li').click(function() {
  	$('li').not(this).removeClass('selected');
  	$(this).addClass('selected');
  })
});