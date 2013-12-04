$(document).ready(function() {
	$('.date').datepicker();
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("aaa");
	});
});