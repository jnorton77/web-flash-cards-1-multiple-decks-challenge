$(document).ready(function() {

	$("#answerdisplay").hide();

		//Main request stored in a variable 
		var request = function(correct) {$.ajax({
		       type: "POST",
		       url: "/decks/:deck_name",
		       data: "correct=" + correct + "",
		       success: function(data) {
	       	 render(data)
	       	 if (data["endgame"])
	       		 window.location.href = "/results"
	       	 }
		     })}

		//Render to HTML
		var render = function(data) {
			console.log(data["question"])
			$("li span").text(data["question"])
			$("#answerdisplay span").text(data["answer"])
		}

	  var hide = function() { $("#answerdisplay").hide();}
	  var show = function() { $("#answerdisplay").show();}

		var showHideLogic = function(correct) {
		 	show();
		 	setTimeout( request, 2000, [correct])
		 	setTimeout( hide, 2000 )
	 	}



	// Get initial data
	  $.ajax({
	 	  type:"Post",
	 	  url: "/decks/:deck_name",
      success: function(data) {
     	render(data)
			}
	  })
	 

	  $("#card").on("submit", function() {
	 		event.preventDefault();

	 		//main logic
	 		console.log($("#answerdisplay span").text())
	 		if ($("#answerdisplay span").text() == $("input").val()) {
				showHideLogic(true);
			}
			else {
				showHideLogic(false);
			}
		});	

}); //end ready()
