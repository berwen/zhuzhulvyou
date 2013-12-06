$(document).ready(function() {
	$(function(){
		$(".date").datepicker();
	});
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("aaa");
	});
	$('#add_newcity').click(function(){
		$('#add_newcity').fadeOut(1);
		$('#city_input').css("display","block");
	});
	$('#add_button').click(function(){
		addcity_funct();
	});
	$('body').on('click','.delete',function(){

	});
});
function addcity_funct()
{
	$("#plan_citylist").append("<div display='block'>"+$("#add_input").val()+"<span class='delete'><a href='#' onclick='delete_city(this)'>删除</a></span>"+"</div>");
	$('#city_input').css("display","none");
	$('#add_newcity').fadeIn(1);
}

function delete_city(e)
{
	$(e).parent().parent().remove();
}