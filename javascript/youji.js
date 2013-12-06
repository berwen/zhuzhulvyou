$(document).ready(function() {
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("aaa");
	});
});

function submit_comment(log_id){
	if ($('#youji_comment').val()=="") alert("评论不能为空！");
	else {
		$.ajax({
			url: 'php/ajax.php',
			type: 'POST',
			dataType: 'JSON',
			data: {item: 'submit_comment', comment: $('#youji_comment').val(), log_id:log_id},
		})
		.done(function(data) {
			console.log(data);
			if (data['status'] == 'success'){
				$('#youji_comment').text="";
				location.reload();
			}
			else if (data['status'] == 'nologin'){
				alert("请先登录！");
			}
		})
		.fail(function() {
			alert("请检查您的网络连接！");
		});
		
		/*$.ajax({
			url: 'php/ajax.php',
			type: 'POST',
			dataType: 'JSON',
			data: {item: 'submit_comment', comment: $('#youji_comment').val(), log_id: log_id},
		})
		.done(function(data) {
			console.log(data);
			if (data['status'] = 'success'){
				$('#youji_comment').text="";
				location.reload();
			}
			else if (data['status'] = 'nologin'){
				alert("请先登录！");
			}
		})
		.fail(function() {
			alert("请检查您的网络连接！");
		});*/
	}	
}