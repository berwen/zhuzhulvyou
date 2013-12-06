$(document).ready(function() {
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("<p>aaa</p>");
	});
	$('#company').click(function(){
		$('#select_type').fadeOut(1);
		$('#company_user').css('display','block');
	});
	$('#personal').click(function(){
		$('#select_type').fadeOut(1);
		$('#personal_user').css('display','block');
	});
});