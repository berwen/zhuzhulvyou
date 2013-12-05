

var gc = new BMap.Geocoder();


map = new BMap.Map("mapcontainer");                        // 创建Map实例
map.centerAndZoom("中国", 5);     // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom();
var globalLat;
var globalLng;
var globalMarker;
document.getElementById("startplace").value = "上海市";
map.addEventListener("click",function(e){   //单击地图，形成折线覆盖物
  if(!e.overlay){
    newpoint = new BMap.Point(e.point.lng,e.point.lat);
    globalLat = e.point.lat;
    globalLng = e.point.lng;
   // displayUsernameByDOM();
    map.removeOverlay(globalMarker);
    var newpoint = new BMap.Point(globalLng,globalLat);
    globalMarker = new BMap.Marker(newpoint);  // 创建标注
    map.addOverlay(globalMarker);              // 将标注添加到地图中
    gc.getLocation(e.point, function(rs){
    var addComp = rs.addressComponents;
    
    document.getElementById("destplace").value = addComp.city;
    
    sContent = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
    InfoWindow = new BMap.InfoWindow(sContent);
    globalMarker.addEventListener("click", function(){
        this.openInfoWindow(InfoWindow);
       });
    }); 
   
    displayUsernameByDOM();
	}
	
});

function displayUsernameByDOM(){

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

//alert(globalLng);

  /*ajax.open("POST","visitedplace.php",true);
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("pName="+name+"&pUser="+user);*/
  $.ajax({
      url: 'php/ajax_php.php',
      type: 'POST',
      dataType: 'JSON',
      data: {item: 'get_ticket_info',lat: globalLat, lon: globalLng}
  })
  .done(function(data) {
      if (data['detail']){
          var code = '<h3>票务信息</h3>'+
                        '<div class="row list_title">'+
                            '<ul>'+
                                '<li >景点</li>'+
                                '<li >项目</li>'+
                                '<li >费用</li>'+
                                '<li >订票</li>'+
                            '</ul>'+
                        '</div>';

          for (var i=0; i<data['detail'].length; i++){
            var temp=   '<div class="row row ticket_list">'+
                            '<div class="sightspot">'+data['attraction_name']+'</div>'+
                            '<div class="project">'+data['detail'][i]['name']+'</div>'+
                            '<div class="cost">'+data['detail'][i]['price']+'</div>'+
                            '<div class="booking">预定</div>'+
                        '</div>';
            code += temp;
          }
          $("#ticket_info").fadeOut('slow', function() {
          	 $("#ticket_info").html(code);
         	 $("#ticket_info").fadeIn('slow');	
          });
      }
      else {
        $("#ticket_info").fadeOut('slow');
    }
  });
    
}







