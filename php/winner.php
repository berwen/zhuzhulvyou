

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script type="text/javascript">
    userArray = <?php 
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
                      $userArray[0]=$row1['username'];
                      $userArray[1]=$row1['caifu'];
                      echo json_encode($userArray);
          ?>
          
    dataArray = <?php
                      $con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      }  
                      mysql_query("set names utf8");
                      mysql_query("use ourmap");
                      $aString="";
                      $result1 = mysql_query("select * from winner;");
                      $cnt=0;
                      $dataArray=array();
                      while($row1 = mysql_fetch_array($result1)){
                   //     $tmp = $row1['placename'];
                        $dataArray[$cnt][0]=$row1['placename'];
                        $dataArray[$cnt][1]=$row1['placeintro'];
                        $dataArray[$cnt][2]=$row1['lng'];
                        $dataArray[$cnt][3]=$row1['lat'];
                        $dataArray[$cnt][4]=$row1['pic'];
                        $dataArray[$cnt][5]=$row1['sound'];
                        $dataArray[$cnt][6]=$row1['owner'];
                        $dataArray[$cnt][7]=$row1['builder'];
                        $dataArray[$cnt][8]=$row1['value'];
                        $dataArray[$cnt][9]=$row1['fee'];
                        }
                  //      $result2 = mysql_query("SELECT * from favplace_guest WHERE placename = '$tmp' AND guestname = '$user'");
                  //      $dataArray[$cnt][6]=0;
                  /*      while($row1 = mysql_fetch_array($result2))
                        {
                          $dataArray[$cnt][6]++;
                        }
                        $result3 = mysql_query("SELECT pic from favplace WHERE placename = '$tmp'");

                        $dataArray[$cnt][7]=mysql_fetch_row($result3);
                        $cnt++;
                      }
                      */
                      echo json_encode($dataArray);
                  ?>

                
                //  var a = <?php 
                //   $url="http://api.map.baidu.com/location/ip?ip=112.65.223.31&ak=1bbe1bfaa50c4eb69022911a5a8735ea&coor=bd09ll";
                //     $json_data=file_get_contents($url);
                //     $xml_data=json_decode($json_data);
                //     $result=array();
                //     $result=$xml_data->address; //获取国家名称
                //  //   $result[]=$xml_data->data->area;  //获取区域名称，如华东
                // ///    $result[]=$xml_data->data->region;  //获取省份名称
                //  //   $result[]=$xml_data->data->city;  //获取城市名称
                //   //  $result[]=$xml_data->data->isp;   //获取运营商名称
                //     echo json_encode($result);
                //     ?>

 //  alert(a[0]);
   </script> 
<title>行政区域工具</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2&ak=1bbe1bfaa50c4eb69022911a5a8735ea"></script>

</head>
<body>

<div style="width:100%;height:700px;border:1px solid gray" id="container"></div>
<!-- JiaThis Button BEGIN -->
<div class="jiathis_style_32x32">
	<a class="jiathis_button_qzone"></a>
	<a class="jiathis_button_tsina"></a>
	<a class="jiathis_button_tqq"></a>
	<a class="jiathis_button_weixin"></a>
	<a class="jiathis_button_renren"></a>
	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1373849947402474" charset="utf-8"></script>
<script type="text/javascript" src="../javascript/jquery-1.10.2.min.js"></script>
<script src="../javascript/winner.js"></script>
<!-- JiaThis Button END -->

</body>
 
</html>


<script type="text/javascript">

map = new BMap.Map("container");                        // 创建Map实例
map.centerAndZoom("闵行区", 12);     // 初始化地图,设置中心点坐标和地图级别


y=dataArray.length-1;
  for (var x=0;x<=y;x++) 
  {
      tPlace=dataArray[x][0];
      tIntro=dataArray[x][1];
      tLng=dataArray[x][2]; 
      tLat=dataArray[x][3];
      tPic=dataArray[x][4];
      tSound=dataArray[x][5];
      tOwner=dataArray[x][6];
      tBuilder=dataArray[x][7];
      tValue=dataArray[x][8];
      tFee=dataArray[x][9];
    //  alert(dataArray[x][6]);
  //  var sContent = placeInfo(tPlace,,tVisited,tType,tIntro);
     if(tOwner==userArray[0]) {

        if(tSound != "") sSound = "<br><audio controls='controls' height='100' width='100'><source src='/zhuzhulvyou/"+tSound+"' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio> ";
        else sSound = "";
        if(tPic != "") sImg = "<img style='float:right;margin:4px' id='imgDemo' src='/zhuzhulvyou/"+tPic+"' width='139' height='104' />" 
        else tPic = " ";
        sContent ="<td><h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+tPlace+"</p></h4>所有者:<div id='owner'>"+tOwner+"</div><p>介绍:"+tIntro+"</p></td><td>价值:<div id='value'>"+tValue+"</div>收费:<div id='fee'>"+tFee+"</div> <input type='Button' name='visited' id='visited' value='升级' onclick='displayUsernameByDOM();''></td>";
      //    "<audio controls='controls' height='100' width='100'><source src='http://127.0.0.1/map/upload/4.mp3' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio> <input type='Button' name='visited' id='visited' value='升级' onclick='displayUsernameByDOM();''></div>";
      }  
      else{

         if(tSound != "") sSound = "<br><audio controls='controls' height='100' width='100'><source src='/zhuzhulvyou/"+tSound+"' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio> ";
        else sSound = "";
        if(tPic != "") sImg = "<img style='float:right;margin:4px' id='imgDemo' src='/zhuzhulvyou/"+tPic+"' width='139' height='104' />" 
        else tPic = " ";
        sContent ="<td><h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+tPlace+"</p></h4>所有者:<div id='owner'>"+tOwner+"</div><p>介绍:"+tIntro+"</p></td><td>价值:<div id='value'>"+tValue+"</div>收费:<div id='fee'>"+tFee+"</div><input type='Button' name='visited' id='visited' value='购买' onclick='displayUsernameByDOM1();''> <input type='Button'  value='模拟缴费' onclick='displayUsernameByDOM2();''></td>";
    
        // sContent ="<h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+tPlace+"</p><p id='value'>"+tValue+"</p><p id='fee'>"+tFee+"</p></h4>" + 
        // "<p id='owner'>"+tOwner+"</p>"+tBuilder+"<img style='float:right;margin:4px' id='imgDemo' src='http://127.0.0.1/map/"+tPic+"' width='139' height='104' title='天安门'/>" + 
        //  tIntro+ "</div><audio controls='controls' height='100' width='100'><source src='http://127.0.0.1/map/upload/4.mp3' type='audio/mp3' /><embed height='100' width='100' src='song.mp3' /></audio> <input type='Button' name='visited' id='visited' value='购买' onclick='displayUsernameByDOM1();''> <input type='Button'  value='模拟缴费' onclick='displayUsernameByDOM2();''></div>";
      
        }

      var createMark = function(Lng,Lat,sContent) {  
      var _marker = new BMap.Marker(new BMap.Point(Lat, Lng));  
      _marker.addEventListener("mouseover", function(e) {  
          this.openInfoWindow(new BMap.InfoWindow(sContent));  
      }); 
     
      return _marker;  
      };  

      var marker = createMark(tLat, tLng, sContent);  
      map.addOverlay(marker);  
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
 
 

function displayUsernameByDOM(){
  
  //var name = document.getElementById("aa").value;
  var name=document.getElementById("aa").innerHTML;
  var value=document.getElementById("value").innerHTML;
  var fee=document.getElementById("fee").innerHTML;
// document.getElementById("vButton").innerHTML ="<input type='Button' name='visited' id='visited' style='filter:Alpha(opacity=30);background:gray ;' value='已去过''>" ;


var r=confirm("您将花费"+value*2+"元进行升级,是否确认？");
if (r==true)
  {
    if(userArray[1] < value*2){
    alert("余额不足，升级失败！");
    return 0;
    }
    userArray[1] -= value * 2;
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

    ajax.open("POST","winner_update.php",true);
    ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    ajax.send("pName="+name+"&pUser="+userArray[0]+"&pValue="+value*2);
     window.location.href="/zhuzhulvyou/php/winner.php"; 
  }
else
  {
  return;
  }
}



//  window.location.href="http://127.0.0.1/map/fav_map.php"; 


function displayUsernameByDOM1(){
  //var name = document.getElementById("aa").value;
  var name=document.getElementById("aa").innerHTML;
  var value=document.getElementById("value").innerHTML;
  var fee=document.getElementById("fee").innerHTML;
  var owner = document.getElementById("owner").innerHTML;
// document.getElementById("vButton").innerHTML ="<input type='Button' name='visited' id='visited' style='filter:Alpha(opacity=30);background:gray ;' value='已去过''>" ;

var r=confirm("您将花费"+value+"元购买该地区,是否确认？");
if (r==true)
  {
    
if(userArray[1] < value){
  alert("余额不足，购买失败！");
  return 0;
}
 userArray[1] -= value;
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

  ajax.open("POST","winner_buy.php",true);
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("pName="+name+"&pOwner="+owner+"&pBuyer="+userArray[0]+"&pValue="+value);
   window.location.href="/zhuzhulvyou/winner.php"; 
  }
else
  {
  return;
  }




//  window.location.href="http://127.0.0.1/map/fav_map.php"; 
}


function displayUsernameByDOM2(){
  //var name = document.getElementById("aa").value;
  var name=document.getElementById("aa").innerHTML;
  var value=document.getElementById("value").innerHTML;
  var fee=document.getElementById("fee").innerHTML;
  var owner = document.getElementById("owner").innerHTML;
// document.getElementById("vButton").innerHTML ="<input type='Button' name='visited' id='visited' style='filter:Alpha(opacity=30);background:gray ;' value='已去过''>" ;

  payContent = "进入"+owner +"的地盘，支付过路费"+ fee+"元";
  alert(payContent);
if(userArray[1] < fee){
  
 userArray[1] = 0;
}
 userArray[1] -= fee;
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

  ajax.open("POST","winner_pay.php",true);
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("pOwner="+owner+"&pBuyer="+userArray[0]+"&pFee="+fee);

//  window.location.href="http://127.0.0.1/map/fav_map.php"; 
}


// function displayUsernameByDOM3(){
//   var name = document.getElementById("placeName").value;
//   var pType = document.getElementById("placeType").value;
//   var intro = document.getElementById("intro").value;
//   if(window.XMLHttpRequest)
//     {
//         //Mozilla 浏览器
//         ajax = new XMLHttpRequest();
//         if (ajax.overrideMimeType)
//         {//设置MiME类别
//             ajax.overrideMimeType("text/xml");
//         }
//     }
//     else if (window.ActiveXObject)
//     {   // IE浏览
//         try
//         {
//             ajax = new ActiveXObject("Msxml2.XMLHTTP");
//         }
//         catch (e)
//         {
//             try
//             {
//                 ajax = new ActiveXObject("Microsoft.XMLHTTP");
//             } catch (e) {}
//         }
//     }
//     if (!ajax)
//     { 
//         window.alert("不能创建XMLHttpRequest对象实例.");
//         return false;
//     }             
//   var ajax = false;
//   ajax = new XMLHttpRequest();
//   ajax.overrideMimeType("text/xml");
//   ajax.open("POST","passplace.php",true);
//   ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
//   ajax.send("pName="+name+"&pType="+pType+"&pIntro="+intro+"&pLat="+globalLat+"&pLng="+globalLng);

// document.getElementById("addfavplace").innerHTML  ="<h4 style='margin:0 0 5px 0;padding:0.2em 0'><p id='aa'>"+name+"</p></h4>" + 
//         "<img style='float:right;margin:4px' id='imgDemo' src='http://app.baidu.com/map/images/tiananmen.jpg' width='139' height='104' title='天安门'/>" + 
//         "类型："+pType+"<br>介绍:" + intro+ "</div><div id='vButton'><input type='Button' name='visited' id='visited' value='标记去过' onclick='displayUsernameByDOM();''> </div><input type='Submit' name='enviar' value='赞'> ";
// }
// var InfoWindow = "h";
// globalMarker.addEventListener("mouseover", function(e){this.openInfoWindow(InfoWindow);});


</script>