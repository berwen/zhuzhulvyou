

function friends(){
curname = getCookie('curname');

if(curname == ""){
  alert("请先登录！");
  return;
}
  var name = document.getElementById("place").value;
 // var pass = document.getElementById("password").value;
  $.post("php/matching.php",
  {
      pName:name,
      pCost:"0",
      pFunc:"friends"
    },
    function(data,status){
      for(x in data)
        alert(data[x]);
    //  if(data['identity'] == "c") 
   //   alert("Data: "+data["login"]);
    // alert(data[0]);
    // alert(data[1]);
    },"json");
 }

 function travelplace(){
curname = getCookie('curname');

if(curname == ""){
  alert("请先登录！");
  return;
}
  var cost = document.getElementById("yusuan").value;
    var name = document.getElementById("yuefen").value;

 // var pass = document.getElementById("password").value;
  $.post("php/matching.php",
  {
      pName:name,
      pCost:cost,
      pFunc:"jingdian"
    },
    function(data,status){
       //alert(cost+"F"+name);
      for(x in data)
        alert(data[x][0] + data[x][1]);
    },"json");
 }




 function favplace(){
curname = getCookie('curname');

if(curname == ""){
  alert("请先登录！");
  return;
}
var gc = new BMap.Geocoder();
placearray = [];
     placecount = [];
  //var cost = document.getElementById("yusuan").value;
 //   var name = document.getElementById("yuefen").value;

 // var pass = document.getElementById("password").value;
  $.post("php/matching.php",
  {
      pName:curname,
      pCost:"cost",
      pFunc:"favplace"
    },
    function(data,status){
     //  alert("F"+data);
     
       for(x in data){
          var newpoint = new BMap.Point(data[x]["lng"],data[x]["lat"]);
          gc.getLocation(newpoint, function(rs){
            var addComp = rs.addressComponents;
            if(addComp.city!=""){
              if($.inArray(addComp.city, placearray)==-1){
                placearray.push(addComp.city);
                placecount.push(1);
                alert(addComp.city);
              }
              else{
                placecount[$.inArray(addComp.city, placearray)]++;
              }
 
          }
          }); 
      }



    },"json");
 }




 function favfriend(){
curname = getCookie('curname');
//alert(curname);
if(curname == ""){
  alert("请先登录！");
  return;
}
var gc = new BMap.Geocoder();
friendsarray = [];

  $.post("php/matching.php",
  {
      pName:curname,
      pCost:"cost",
      pFunc:"favfriend"
    },
    function(data,status){
     
       for(x in data){

            if(data[x]!=""){
              if($.inArray(data[x], friendsarray)==-1){
                friendsarray.push(data[x]);
             //   placecount.push(1);
                alert(data[x]);
              }
              else{
            
              }

          }
  
      }
    },"json");
 }



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