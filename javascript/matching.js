

function friends(){

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