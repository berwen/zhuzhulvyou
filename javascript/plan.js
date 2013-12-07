
// 百度地图API功能
var map = new BMap.Map("mapcontainer");
map.centerAndZoom(new BMap.Point(118.454, 32.955), 6);
map.enableScrollWheelZoom();
map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));   
map.addControl(new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT})); 
map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));     //2D图，卫星图

map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //左上角，默认地图控件
map.setCurrentCity("北京");   //由于有3D图，需要设置城市哦 

var points = [];
var gc = new BMap.Geocoder();
var placelist=[];





var curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能


// var bb =[];
// bb = curve.getPath();
// alert(bb.length);
// alert(bb[bb.length-1].lng);

map.addEventListener("dblclick",function(e){   //双击地图，形成多边形覆盖物
	points.push(new BMap.Point(e.point.lng,e.point.lat)); 
	//removeoverlay(curve);
	map.clearOverlays();
	curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    map.addOverlay(curve); //添加到地图中
	curve.enableEditing(); //开启编辑功能

	gc.getLocation(e.point, function(rs){
    var addComp = rs.addressComponents;
    addcity_funct(addComp.city);
    placelist.push(addComp.city);
    }); 

});


function addDestination(palcename){
//alert(palcename);
// 将地址解析结果显示在地图上,并调整地图视野
gc.getPoint(palcename, function(e){
	if(e){
		//alert(e.lng);
		globalMarker = new BMap.Marker(e);  
		 map.addOverlay(globalMarker); //添加到地图中
		newpoint = new BMap.Point(e.lng,e.lat);
		
		points.push(new BMap.Point(e.lng,e.lat)) 
	//removeoverlay(curve);

	map.clearOverlays();
	curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    map.addOverlay(curve); //添加到地图中
	curve.enableEditing(); //开启编辑功能
	}
}, "上海市");
	
}



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
		placelist.push($("#add_input").val());
		addcity_funct($("#add_input").val());
		addDestination($('#add_input').val());
	});
	$('.submit_plan').click(function(){
		$('.planlist').fadeOut(1);
		$('.after_submit').css('display','block');

		for(var i=0;i<placelist.length;i++)
			$('.place_list').children('select').append("<option value='"+placelist[i]+"'>"+placelist[i]+"</option>");
		
		// console.log(placelist);
	});
	$('.open_map').click(function(){
		window.open ("map.html")
	});


	$('.final_plan').click(function(){
		$('.after_submit').fadeOut(1);
		var name = $('.place_list').children('select').val();
		name = name + "";
		$.post("php/matching.php",
  		{
      		pName:name,
     		pCost:"0",
      		pFunc:"friends"
    		},
    	function(data,status){
    	//alert("f");
      for(x in data)
      // alert(data[x]);

    $(".go_together").append("<div class='item'><div class='photo'><img src='img/back_black.png'></div><p>"+data[x]+"</p></div>");

    },"json");
		//
		$('.after_final').css('display','block');
	});

	$('.search').click(function(){

	gc.getPoint($('.place_list').children('select').val(), function(e){
				newpoint = new BMap.Point(e.lng,e.lat);
		
				map.centerAndZoom(new BMap.Point(e.lng,e.lat), 14);

				var local = new BMap.LocalSearch(map, {
  					renderOptions:{map: map}
				});


				if($("input[id='zhusu']").is(':checked')) {
						map.clearOverlays();
						//local.search("");
						curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    					map.addOverlay(curve); //添加到地图中
						local.search("宾馆");
				}
				if($("input[id='canyin']").is(':checked')) {
						//map.clearOverlays();
						map.clearOverlays();
						//local.search("");
						curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    					map.addOverlay(curve); //添加到地图中
						local.search("饭店");
				}	
				if($("input[id='jiaotong']").is(':checked')) {
					map.clearOverlays();
						curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    					map.addOverlay(curve); //添加到地图中
						local.search("车站");

				 }	
				if($("input[id='yule']").is(':checked')) {
						map.clearOverlays();
						curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    					map.addOverlay(curve); //添加到地图中
						local.search("公园");
				}
	}, "上海市");
	
	
//	local.searchNearby("食宿", $('.place_list').children('select').val());
		//$('.after_submit').fadeOut(1);
		//$('.after_final').css('display','block');
	});
	

});
function addcity_funct()
{
	$("#plan_citylist").append("<div display='block'>"+$("#add_input").val()+"<span class='delete'><a href='#' onclick='delete_city(this)'>删除</a></span></div>");
	$('#city_input').css("display","none");
	$('#add_newcity').fadeIn(1);
}

function addcity_funct(placename)
{
	$("#plan_citylist").append("<div display='block'>"+placename+"<span class='delete'><a href='#' onclick='delete_city(this)'>删除</a></span></div>");
	$('#city_input').css("display","none");
	$('#add_newcity').fadeIn(1);
}

function delete_city(e){
	$(e).parent().parent().remove();
}

function addcity_redo()
{
	$("#plan_citylist").html("");
	for(x in points){
		gc.getLocation(points[x], function(rs){
    var addComp = rs.addressComponents;
    addcity_funct(addComp.city);

    }); 
	}
	//$("#plan_citylist").append("<div display='block'>"+placename+"</div>");
	//$('#city_input').css("display","none");
	//$('#add_newcity').fadeIn(1);
}


// function friends(name){

 
//  // var pass = document.getElementById("password").value;
  
//  }

// function redo()
// {
// 	$("#plan_citylist").html("");
// 	for(x in points){
// 		gc.getLocation(points[x], function(rs){
//     var addComp = rs.addressComponents;
//     addcity_funct(addComp.city);

//     }); 
// 	}
// var transit = new BMap.TransitRoute(map, {
//   renderOptions: {map: map}
// });
// transit.search("王府井", "西单");
// //local.search("景点");
// transit.search("天安门", "西单");
// }



