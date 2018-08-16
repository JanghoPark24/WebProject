var tags = []

$(function() {
	$.ajax({
		url : 'autocomplete_univ.do',
		dataType : "json",
		success : 
			function(data, response) {
			$.each(data, function(index, value) {
				tags.push(value);
			});
		}
	})
	$("#search").autocomplete({
		source : tags
	});
});
