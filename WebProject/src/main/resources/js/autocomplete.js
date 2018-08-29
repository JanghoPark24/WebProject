var cate = $("select[name='keyword']").val();
var tags_all = [];
var tags_univ = [];
$.ajax({
	url : 'autocomplete_lec.do',
	dataType : "json",
	success : function(data, response) {
		console.log('success')
		$.each(data, function(index, value) {
			tags_all.push(value);
		});
	}
})
$.ajax({
	url : 'autocomplete_univ.do',
	dataType : "json",
	success : function(data, response) {
		console.log('success')
		$.each(data, function(index, value) {
			tags_univ.push(value);
			tags_all.push(value);
		});
	}
})
function change_cate() {
	cate = $("select[name='keyword']").val();
	if (cate == 'univ') {
		tags = tags_univ;
	} else if (cate == 'all') {
		tags = tags_all;
	}
	console.log(cate);
	$(function() {
		$("input[name='search']").autocomplete({
			source : tags
		});
	});
	
}