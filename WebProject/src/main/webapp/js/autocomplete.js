$(function() {
		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		$("#search").autocomplete({
			source : availableTags
		
		function( request, response ){$.ajax({
			url: 'univ_list.do',
			dataType:"json",
			success:function (data){
			}
		})
		}});
	});
	function chageLangSelect(){
		var langSelect = document.getElementsByName("");
	}