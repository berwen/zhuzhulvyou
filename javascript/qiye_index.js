$(document).ready(function() {
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("<p>aaa</p>");
	});
	$('.date').datepicker();
	$("#attraction").click(function(){
		$("#edit_attraction").css("display","block");
		$("#edit_discount").css("display","none");
		$("#edit_ticket").css("display","none");
		$("#view_discount_detail").css("display","none");
		$("#view_ticket_detail").css("display","none");
	});
	$("#discount").click(function(){
		$("#edit_attraction").css("display","none");
		$("#edit_discount").css("display","block");
		$("#edit_ticket").css("display","none");
		$("#view_discount_detail").css("display","none");
		$("#view_ticket_detail").css("display","none");
	});
	$("#ticket").click(function(){
		$("#edit_attraction").css("display","none");
		$("#edit_discount").css("display","none");
		$("#edit_ticket").css("display","block");
		$("#view_discount_detail").css("display","none");
		$("#view_ticket_detail").css("display","none");
	});
	$("#view_discount").click(function(){
		$("#edit_attraction").css("display","none");
		$("#edit_discount").css("display","none");
		$("#edit_ticket").css("display","none");
		$("#view_discount_detail").css("display","block");
		$("#view_ticket_detail").css("display","none");
	});
	$("#view_ticket").click(function(){
		$("#edit_attraction").css("display","none");
		$("#edit_discount").css("display","none");
		$("#edit_ticket").css("display","none");
		$("#view_discount_detail").css("display","none");
		$("#view_ticket_detail").css("display","block");
	});
});