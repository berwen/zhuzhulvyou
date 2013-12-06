



  $(document).ready(function() {
  $('#head_submit').click(function(){
   
  var name = document.getElementById("username").value;
 // var pass = document.getElementById("password").value;

  $.post("php/matching.php",
  {
      pName:name
    },
    function(data,status){
      for(x in data)
        alert(data[x]);
    //  if(data['identity'] == "c") 
   //   alert("Data: "+data["login"]);
    // alert(data[0]);
    // alert(data[1]);
    },"json");
  });
  
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


