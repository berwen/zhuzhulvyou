username=getCookie('curname');
tmoney=getCookie('money');
if (username!=null && username!="")
{
  $('#head_login').fadeOut(1);
  $('#head_menu').append("<p style='float:left' id='user_info'>"+username+"欢迎登陆   当前财富"+tmoney+"</p>");
  $('#head_menu').append("<button type='submit' class='btn' id='logout'>退出</button>");

 $('body').on("click","#logout",function(){
        $('#logout').remove();
        $('#user_info').remove();
        $('#head_login').fadeIn(1);
        setCookie('curname',"",3);
        $.post("php/access.php",
        {
          pName:"name",
          pPass:"pass",
          pFunc:"logout"
        },
        function(data,status){

        },"json");
    });
	
	
}
else 
{
$(document).ready(function() {
	$('#head_submit').click(function(){
	var name = document.getElementById("username").value;
  var pass = document.getElementById("password").value;

  $.post("php/access.php",
  {
      pName:name,
      pPass:pass,
      pFunc:"yes"
    },
    function(data,status){
      
    //  if(data['identity'] == "c") 
   //   alert("Data: "+data["login"]);
     if(data["login"] =="1"){
          $('#head_login').fadeOut(1);
          $('#head_menu').append("<p style='float:left' id='user_info'>"+name+"欢迎登陆   当前财富"+data["money"]+"</p>");
          $('#head_menu').append("<button type='submit' class='btn' id='logout'>退出</button>");
          setCookie("curname",name,3);
          setCookie("money",data["money"],3);
          if(data['identity'] == "v") {
          window.location.href="qiye_index.html"; 
          return;
      }
     }else{
      alert("登陆信息错误，请重新登陆！");
     }
    },"json");
  });
    $('body').on("click","#logout",function(){
      $('#logout').remove();
      $('#user_info').remove();
      $('#head_login').fadeIn(1);
      setCookie('curname',"",3);
      $.post("php/access.php",
      {
        pName:"name",
        pPass:"pass",
        pFunc:"logout"
      },
      function(data,status){
      },"json");

    });
 });
}
	
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
										'<span><a href="youji.php?log_id='+data[i]['log_id']+'&attraction='+$('#appendedInputButton').val()+'">'+data[i]['log_title']+'</a></span>'+ 
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







function setCookie(c_name,value,expiredays)
{
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+
((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}

function getCookie(c_name)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { 
    c_start=c_start + c_name.length+1 
    c_end=document.cookie.indexOf(";",c_start)
    if (c_end==-1) c_end=document.cookie.length
    return unescape(document.cookie.substring(c_start,c_end))
    } 
  }
return ""
}

















