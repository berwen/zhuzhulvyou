$(document).ready(function() {
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("<p style='float:left' id='user_info'>aaa</p>");
		$('#head_menu').append("<button type='submit' class='btn' id='logout'>退出</button>");
	});
	$('body').on("click","#logout",function(){
		$('#logout').remove();
		$('#user_info').remove();
		$('#head_login').fadeIn(1);
	});
});