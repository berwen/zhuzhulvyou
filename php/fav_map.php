


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  <script type="text/javascript">
    user = <?php 
             $con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      }  
                      mysql_query("set names utf8");
                      mysql_query("use iwebsns");
                      $result1 = mysql_query("select * from isns_currentuser;");
                      $cnt=0;
                      $userArray=array();
                      $row1 = mysql_fetch_array($result1);
                   //     $tmp = $row1['placename'];
                      $userArray=$row1['username'];
//                      setcookie('ouruser','$userArray');
                      echo json_encode($userArray);
          ?>

    dataArray = <?php
                      $con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      }  
                      mysql_query("set names utf8");
                      mysql_query("use iwebsns");
                      $result1 = mysql_query("select * from isns_currentuser;");
                      $row1 = mysql_fetch_array($result1);
                      $user=$row1['username'];
                      mysql_query("use ourmap");
                      $aString="";
                      $result1 = mysql_query("select * from favplace;");
                      $cnt=0;
                      $dataArray=array();
                      while($row1 = mysql_fetch_array($result1)){
                        $tmp = $row1['placename'];
                        $dataArray[$cnt][0]=$row1['placename'];
                        $dataArray[$cnt][1]=$row1['visited'];
                        $dataArray[$cnt][2]=$row1['placetype'];
                        $dataArray[$cnt][3]=$row1['placeintro'];
                        $dataArray[$cnt][4]=$row1['lng'];
                        $dataArray[$cnt][5]=$row1['lat'];
                       // $user = $_COOKIE['ouruser'];
                        $result2 = mysql_query("SELECT * from favplace_guest WHERE placename = '$tmp' AND guestname = '$user'");
                        $dataArray[$cnt][6]=0;
                        while($row1 = mysql_fetch_array($result2))
                        {
                          $dataArray[$cnt][6]++;
                        }
                        $result3 = mysql_query("SELECT pic from favplace WHERE placename = '$tmp'");
                        $dataArray[$cnt][7]=mysql_fetch_row($result3);
                        $result4 = mysql_query("SELECT sound from favplace WHERE placename = '$tmp'");
                        $dataArray[$cnt][8]=mysql_fetch_row($result4);
                        $cnt++;
                      }
                      echo json_encode($dataArray);
                  ?>
   </script> 
<title>行政区域工具</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2&ak=1bbe1bfaa50c4eb69022911a5a8735ea"></script>

</head>
<body>
<div style="width:100%;height:700px;border:1px solid gray" id="container"></div>




<table style="width:100%;height:70px;">
<tr>
<td style="width:50%;height:50px;"><input id="startBtn" type="button" onclick="favfriend();" value="找基友" /></td>
<td style="width:50%;height:50px;"><input type="button" value="猜你喜欢" onclick="favplace()" /></td>
</tr>
<tr>
<td style="width:50%;height:100px;"><div id = "showfriend" name = "showfriend"> </div></td>
<td style="width:50%;height:100px;"><div id = "showplace" name = "showplace"> </div></td>
</tr>
</table>
<script type="text/javascript" src="../javascript/jquery-1.10.2.min.js"></script>
</body>
</html>

<script type="text/javascript">
map = new BMap.Map("container");                        // 创建Map实例
map.centerAndZoom("闵行区", 12);     // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom();

var key = 1;    //开关
var newpoint;   //一个经纬度
var points = [];    //数组，放经纬度信息
var polyline = new BMap.Polyline(); //折线覆盖物
y=dataArray.length-1;

  for (var x=0;x<=y;x++) 
  {

      tPlace=dataArray[x][0];
      tVisited=dataArray[x][1];
      tType=dataArray[x][2]; 
      tIntro=dataArray[x][3];
      tLat=dataArray[x][4];
      tLng=dataArray[x][5];
      tHave=dataArray[x][6];

     if(tHave==0) {
        if(dataArray[x][8] != "upload/") sSound = "<br><audio controls='controls' height='100' width='100'><source src='/zhuzhulvyou/"+dataArray[x][8]+"' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio> </div>";
        else sSound = "</div>";
        if(dataArray[x][7] != "upload/") sImg =  "<div><img style='float:center;margin:4px' id='imgDemo' src='/zhuzhulvyou/"+dataArray[x][7]+"' width='80%' height='120' /></div>" ;
        else sImg = "";
        sContent ="<div><h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+tPlace+"</p></h4><div width='50%'><ul><li>类型："+tType+"</li><li>介绍:" + tIntro+ "</li></ul><div id='vButton'><input type='Button' name='visited' id='visited' style='float:right;' value='标记去过' onclick='displayUsernameByDOM();''></div></div>";
        sContent = sContent + sImg + sSound;
      }  
      else{
        newpoint = new BMap.Point(tLat,tLng);
        points.push(newpoint);  //将新增的点放到数组中
        polyline.setPath(points);   //设置折线的点数组
        map.addOverlay(polyline);   //将折线添加到地图上
        if(dataArray[x][8] != "upload/") sSound = "<br><audio controls='controls' height='100' width='100'><source src='/zhuzhulvyou/"+dataArray[x][8]+"' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio></div>";
        else sSound = "</div>";
        if(dataArray[x][7] != "upload/") sImg =  "<div><img style='float:center;margin:4px' id='imgDemo' src='/zhuzhulvyou/"+dataArray[x][7]+"' width='80%' height='120'/></div>" ;
        else sImg = " ";
        sContent =
        "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+tPlace+"</h4><div ><ul><li>类型："+tType+"<br></li><li>介绍:" + tIntro+ "</li></ul><input type='Button' name='visited' id='visited' style='filter:Alpha(opacity=30);background:gray;float:right;' value='已去过''>";
        sContent = sContent + sImg + sSound;
      }

      var createMark = function(Lat,Lng,sContent) {  
      var _marker = new BMap.Marker(new BMap.Point(Lat, Lng));  
      _marker.addEventListener("mouseover", function(e) {  
          this.openInfoWindow(new BMap.InfoWindow(sContent));  
      });  
      return _marker;  
          };  

      var marker = createMark(tLat, tLng, sContent);  
      map.addOverlay(marker);  
  }



function startTool(){   //开关函数
if(key==1){
        document.getElementById("startBtn").style.background = "green";
        document.getElementById("startBtn").style.color = "white";
        document.getElementById("startBtn").value = "开启状态";
        key=0;
    }
    else{
        document.getElementById("startBtn").style.background = "red";
        document.getElementById("startBtn").value = "关闭状态";
        key=1;
    }
}

var contextMenu = new BMap.ContextMenu();
var txtMenuItem = [
  {
   text:'放大',
   callback:function(){map.zoomIn()}
  },
  {
   text:'缩小',
   callback:function(){map.zoomOut()}
  },
  {
   text:'放置到最大级',
   callback:function(){map.setZoom(18)}
  },
  {
   text:'查看全国',
   callback:function(){map.setZoom(4)}
  },
  {
   text:'在此添加标注',
   callback:function(p){
    var marker = new BMap.Marker(p), px = map.pointToPixel(p);
    map.addOverlay(marker);
   }
  },
  {
   text:'添加兴趣点',
   callback:function(p){
    key = 3;
   // var vReturnValue = window.showModalDialog('adduser.html');
  
   }
  }
 ];


 for(var i=0; i < txtMenuItem.length; i++){
  contextMenu.addItem(new BMap.MenuItem(txtMenuItem[i].text,txtMenuItem[i].callback,100));
  if(i==1 || i==3) {
   contextMenu.addSeparator();
  }
 }
 map.addContextMenu(contextMenu);
 
 
 // 定义一个控件类,即functionz
function ZoomControl(){
  // 默认停靠位置和偏移量
  this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
  this.defaultOffset = new BMap.Size(10, 10);
}

// 通过JavaScript的prototype属性继承于BMap.Control
ZoomControl.prototype = new BMap.Control();

// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
ZoomControl.prototype.initialize = function(map){
  // 创建一个DOM元素
  var div = document.createElement("div");
  // 添加文字说明
  div.appendChild(document.createTextNode("放大2级"));
  // 设置样式
  div.style.cursor = "pointer";
  div.style.border = "1px solid gray";
  div.style.backgroundColor = "white";
  // 绑定事件,点击一次放大两级
  div.onclick = function(e){
    map.setZoom(map.getZoom() + 2);
  }
  // 添加DOM元素到地图中
  map.getContainer().appendChild(div);
  // 将DOM元素返回
  return div;
}
// 创建控件
var myZoomCtrl = new ZoomControl();
// 添加到地图当中
map.addControl(myZoomCtrl);
 
 
 var globalLat;
 var globalLng;
var globalMarker;
map.addEventListener("click",function(e){   //单击地图，形成折线覆盖物

	if(!e.overlay){
    newpoint = new BMap.Point(e.point.lng,e.point.lat);
    if(key == 3){
  globalLat = e.point.lat;
  globalLng = e.point.lng;
  
    var sContent1 =
    "<form action='upload_file.php?pLat="+e.point.lat+"&pLng="+e.point.lng+"' method='post' enctype='multipart/form-data'><p id=addfavplace>添加兴趣点：<br>名称:<br><input type='Text' name='placeName' id='placeName'><br>类型:<br><input type='Text' name='placeType' id='placeType'>"+
    "<br>介绍:<br><textarea rows='5' cols='20' name='intro' id='intro'></textarea><br></p>"+
    "<label for='file'>Filename:</label><input type='file' name='file[]' /><br /><input type='file' name='file[]' /> <br /><input type='submit' name='submit' value='Submit' /></form>";
        globalMarker = new BMap.Marker(newpoint);  // 创建标注
        map.addOverlay(globalMarker);              // 将标注添加到地图中

        InfoWindow = new BMap.InfoWindow(sContent1);
    globalMarker.addEventListener("click", function(){this.openInfoWindow(InfoWindow);});
    }
	}
});



map.addEventListener("dblclick",function(e){   //双击地图，形成多边形覆盖物
if(key==0){
        map.disableDoubleClickZoom();   //关闭双击放大
var polygon = new BMap.Polygon(points);
        map.addOverlay(polygon);   //将折线添加到地图上
    }
});


function displayUsernameByDOM(){
  //var name = document.getElementById("aa").value;
  var name=document.getElementById("aa").innerHTML;
 document.getElementById("vButton").innerHTML ="<input type='Button' name='visited' id='visited' style='filter:Alpha(opacity=30);background:gray ;' value='已去过''>" ;

  if(window.XMLHttpRequest)
    {
        //Mozilla 浏览器
        ajax = new XMLHttpRequest();
        if (ajax.overrideMimeType)
        {//设置MiME类别
            ajax.overrideMimeType("text/xml");
        }
    }
    else if (window.ActiveXObject)
    {   // IE浏览
        try
        {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            try
            {
                ajax = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!ajax)
    { 
        window.alert("不能创建XMLHttpRequest对象实例.");
        return false;
    }             
  var ajax = false;
  ajax = new XMLHttpRequest();
  ajax.overrideMimeType("text/xml");
//通过document.getElementById方法得到username的值
//alert(name);

  ajax.open("POST","visitedplace.php",true);
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("pName="+name+"&pUser="+user);
 // alert(name+ " "+user);
  window.location.href="/zhuzhulvyou/php/fav_map.php"; 
}



function displayUsernameByDOM2(){
  var name = document.getElementById("placeName").value;
  var pType = document.getElementById("placeType").value;
  var intro = document.getElementById("intro").value;
  if(window.XMLHttpRequest)
    {
        //Mozilla 浏览器
        ajax = new XMLHttpRequest();
        if (ajax.overrideMimeType)
        {//设置MiME类别
            ajax.overrideMimeType("text/xml");
        }
    }
    else if (window.ActiveXObject)
    {   // IE浏览
        try
        {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            try
            {
                ajax = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!ajax)
    { 
        window.alert("不能创建XMLHttpRequest对象实例.");
        return false;
    }             
  var ajax = false;
  ajax = new XMLHttpRequest();
  ajax.overrideMimeType("text/xml");
  ajax.open("POST","passplace.php",true);
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("pName="+name+"&pType="+pType+"&pIntro="+intro+"&pLat="+globalLat+"&pLng="+globalLng);

document.getElementById("addfavplace").innerHTML  ="<h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+name+"</p></h4>" + 
        "<img style='float:right;margin:4px' id='imgDemo' src='http://app.baidu.com/map/images/tiananmen.jpg' width='139' height='104' title='天安门'/>" + 
        "类型："+pType+"<br>介绍:" + intro+ "</div><div id='vButton'><input type='Button' name='visited' id='visited' value='标记去过' onclick='displayUsernameByDOM();''> </div><input type='Submit' name='enviar' value='赞'> ";
}


function favfriend(){

document.getElementById("showfriend").innerHTML = "匹配出志同道合的好友有: <br>";
var gc = new BMap.Geocoder();
friendsarray = [];

  $.post("matching.php",
  {
      pName:user,
      pCost:"cost",
      pFunc:"favfriend"
    },
    function(data,status){
     
       for(x in data){

            if(data[x]!=""){
              if($.inArray(data[x], friendsarray)==-1){
                friendsarray.push(data[x]);
             //   placecount.push(1);
                document.getElementById("showfriend").innerHTML += "<li>" + friendsarray[x] + "</li> ";
               // alert();
              }
          }
  
      }
    },"json");

}

 function favplace(){

var gc = new BMap.Geocoder();
placearray = [];
    placecount = [];
document.getElementById("showplace").innerHTML = "匹配出您喜欢的地方: <br>";
  $.post("matching.php",
  {
      pName:user,
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
                document.getElementById("showplace").innerHTML += "<li>" + addComp.city + "</li> ";
               // alert(addComp.city);
              }
              else{
                placecount[$.inArray(addComp.city, placearray)]++;
              }
 
          }
          }); 
      }
    },"json");
 }


</script>

