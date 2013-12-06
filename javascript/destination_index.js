$(document).ready(function() {
	$('#head_submit').click(function(){
		$('#head_login').fadeOut(1);
		$('#head_menu').append("aaa");
	});

	$('#search_button').click(function() {
		if ($('#appendedInputButton').val() != ""){
			$.ajax({
				url: 'php/ajax.php',
				type: 'POST',
				dataType: 'JSON',
				data: {item: 'search_travel_notes', attraction: $('#appendedInputButton').val()},
			})
			.done(function(data) {
				if (data){
					var code = '';
					for (var i=0; i<data.length; i++){
						var temp = '<li>'+
										'<span><a href="youji.php?log_id='+data[i]['log_id']+'">'+data[i]['log_title']+'</a></span>'+ 
										'<span>'+data[i]['add_time']+'</span>'+
									'</li>';
						code += temp;
					}
					$('#recommend_place').fadeOut('slow', function() {
						$('#recommend_place').html(code);
						$('#recommend_place').fadeIn('slow');
					});
				}
				else window.location.href = "destination_index.html";

			})
			.fail(function() {
				alert("请检查您的网络连接！");
			});
		}
		else window.location.href = "destination_index.html";
	});
});

