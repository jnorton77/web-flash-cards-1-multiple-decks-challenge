$(document).ready(function() {
	 $("#answer").hide();
	 $("#hiddenAnswer").hide();
	 // $("#results").hide();
	 // var answer = $("#hidden").text


	 $("#card").on("submit", function(event) {
	 		event.preventDefault();
			// $("#answer span").text($("#hiddenAnswer").text());
			// $("#answer").show();
			// setTimeout(window.location.replace(""), 7000);
			var data = $('#card').serialize();
			console.log(data)
	 		$.post("/decks", data, function(response) {
	 			// console.log(data)
	 			// if (parseInt(response) == 0 ){
	 			// 	window.location.href = "/results"
	 			// }
	 			// else {
	 				$("#answer span").text($("#hiddenAnswer").text());
	 				$("#answer").show();
	 				setTimeout(window.location.replace(""), 7000)
	 			// }
				})
	 });
});


