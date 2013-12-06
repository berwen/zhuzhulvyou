
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
// 覆盖区域图层测试
//map.addTileLayer(new BMap.PanoramaCoverageLayer());

// var stCtrl = new BMap.PanoramaControl(); //构造全景控件
// stCtrl.setOffset(new BMap.Size(20, 20));
// map.addControl(stCtrl);//添加全景控件
//   var a = $.getJSON(url);
var points = [];
var gc = new BMap.Geocoder();






var curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能


// var bb =[];
// bb = curve.getPath();
// alert(bb.length);
// alert(bb[bb.length-1].lng);

map.addEventListener("dblclick",function(e){   //双击地图，形成多边形覆盖物
	points.push(new BMap.Point(e.point.lng,e.point.lat)) 
	//removeoverlay(curve);
	map.clearOverlays();
	curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5});
    map.addOverlay(curve); //添加到地图中
	curve.enableEditing(); //开启编辑功能

	gc.getLocation(e.point, function(rs){
    var addComp = rs.addressComponents;
    addcity_funct(addComp.city);
    }); 

});


function addDestination(palcename){
//alert(palcename);
// 将地址解析结果显示在地图上,并调整地图视野
gc.getPoint(palcename, function(e){
	if(e){
		//alert(e.lng);
		globalMarker = new BMap.Marker(e);  // 创建标注

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
		addcity_funct($("#add_input").val());
		addDestination($('#add_input').val());
	});
	$('.submit_plan').click(function(){
		$('.planlist').fadeOut(1);
		$('.after_submit').css('display','block');
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



