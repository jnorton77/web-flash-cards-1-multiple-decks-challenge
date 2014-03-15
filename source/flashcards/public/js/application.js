$(document).ready(function() {
	 $("#answer").hide();
	 $("#hiddenAnswer").hide();
	 // var answer = $("#hidden").text


	 $("#card").on("submit", function() {
	 		event.preventDefault();


	 		$.post("/decks/count", {name: "hoh"}, function(data) {
	 			console.log(data)
	 			if (parseInt(data) == 0 ){
	 				window.location.href = "/results"
	 			}
	 			else {
	 				$("#answer span").text($("#hiddenAnswer").text());
	 				$("#answer").show();
	 				setTimeout(window.location.replace(""), 7000)
	 			}
	 			})
	 });
});
