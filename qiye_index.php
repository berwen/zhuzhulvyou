<?php 

require "php/functions.php";



 $con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      }  
                      mysql_query("set names utf8");
                      mysql_query("use iwebsns");
                      $result1 = mysql_query("select username from isns_currentuser where id=1");
                     // $userArray=array();
                      $row1 = mysql_fetch_row($result1);
                      $tmp = $row1[0];
                      mysql_query("use ourmap");
                      $result2 = mysql_query("select id from users where username='$tmp'");
                     // $userArray=array();
                      $row2 = mysql_fetch_row($result2);

$company_id = $row2[0];
$conn = connect($config);
$attraction = query("SELECT * FROM attraction_info WHERE user_id = :id",
				     array('id' => $company_id),
				     $conn);
$ticket = query("SELECT * FROM ticket_info WHERE user_id = :id",
				 array('id' => $company_id),
				 $conn);
$discount = query("SELECT ticket_info.name as ticket_info_name,ticket_discount.name as ticket_discount_name,start_date,end_date,ticket_discount.id FROM ticket_discount INNER JOIN ticket_info 
			       ON ticket_discount.ticket_id=ticket_info.id WHERE ticket_discount.user_id = :id",
				   array('id' => $company_id),
				   $conn);
 ?>
<html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<head>
	<title>猪猪旅游-企业用户</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" type="text/css" href="css/qiye_index.css">
	<link rel="stylesheet" type="text/css" href="jquery-ui-themes-1.10.3/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=8c505add0e724b81c3e14ae6692e8531"></script>
	<!-- // <script src="javascript/jquery.min.js"></script> -->
	<!-- <script src="javascript/index.js"></script> -->
	<!-- // <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
</head>
<body>
	<!-- <div style="display:none;"><img src="bg.jpg"></div> -->
	<div id="header">
		<div class="navbar row">
		  <div class="navbar-inner">
		    <div class="container">
		 
		      <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
		      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </a>
		 
		      <!-- Be sure to leave the brand out there if you want it shown -->
		      <a class="brand" href="index.html">猪猪旅游</a>
		      <!-- Everything you want hidden at 940px or less, place within here -->
		      <div class="nav-collapse collapse" id="head_menu">
		        <!-- .nav, .navbar-search, .navbar-form, etc -->
		        <ul class="nav">
				  <li>
				    <a href="index.html">主页</a>
				  </li>
				  <li><a href="destination_index.html">目的地</a></li>
				  <li><a href="ticket.php">票务</a></li>
				<!--  <li><a href="#">我的空间</a></li>  -->
				</ul>
		      </div>
		      <!-- <div class="navbar-form pull-left" id="head_login">
				  <input type="text" class="span2" placeholder="用户名">
				  <input type="text" class="span2" placeholder="密码">
				  <button type="submit" class="btn" id="head_submit">登录</button>
				  <button type="submit" class="btn">注册</button>
			  </div> -->
		 
		    </div>
		  </div>
		</div>
	</div>
	<div class="row">
		<div class="container main_frame">
		<div class="row">
			<div class="span3" id="left_bar">
				<div>系统功能</div>
				<div id="attraction"><a href="#">编辑景点信息</a></div>
				<div id="discount"><a href="#">编辑优惠信息</a></div>
				<div id="ticket"><a href="#">编辑票务信息</a></div>
				<div id="view_discount"><a href="#">查看已填加优惠信息</a></div>
				<div id="view_ticket"><a href="#">查看已填加的票务</a></div>
			</div>
			<div class="span8" id="right_bar">
				<div id="edit_attraction">
					<!-- <div class="form-horizontal"> -->
					<form>					
						  <div class="control-group">
						    <label class="control-label" for="AttractionName">景点名称&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class='span6'type="text" id="inputAttractionName" placeholder="景点名称">
						    </div>
						  </div>
						  <div class="control-group">
						    <label class="control-label" for="inputAttractionDescription">景点描述&nbsp;&nbsp;</label>
						    <div class="controls">
						      <textarea class="span6" rows="6" id="inputAttractionDescription" placeholder="景点描述"></textarea>
						    </div>
						  </div>
						  <div class="control-group map" id ="mapcontainer">
						  	地图
						  </div>
						  <div class="control-group">
						    <div class="controls control_button">
						      <input type="submit" class="btn" onclick=<?php echo '"submit_attraction('.$company_id.')"' ?>></button>
						      <input type="reset" class="btn"></button>
						    </div>
						  </div>
					</form>
					<!-- </div> -->
				</div>
				<div id='edit_discount'>
					<form action=<?php echo 'php/company.php?item=edit_discount&company_id='.$company_id ?> method="post">
						<div class="control-group">
						    <label class="control-label" for="DiscountTicketName">票务名称&nbsp;&nbsp;</label>
						    <div class="controls">
						      	<select class='span6' name="ticket" id="DiscountTicketName">
						      		<?php 
						      		if($ticket){
						      			foreach ($ticket as $row) {
						    				echo '<option value='.$row['id'].'>'.$row['name'].'</option>';
						    			}
						      		}
						      		 ?>
						      	</select>
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputDiscountName">优惠名称&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class='span6'type="text" id="inputDiscountName" placeholder="优惠名a称" name="name">
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputDiscountDescription">优惠描述&nbsp;&nbsp;</label>
						    <div class="controls">
						      <textarea class="span6" rows="6" id="inputDiscountDescription" placeholder="优惠描述" name="description"></textarea>
						    </div>
						</div>
						<div>
							<p>开始日期<input type="text" class="date" name="start_date"></p>
							<p>结束日期<input type="text" class="date" name="end_date"></p>
						</div>
						<div class="control-group">
						    <div class="controls control_button">
						      <input type="submit" class="btn"></button>
						      <input type="reset" class="btn"></button>
						    </div>
						 </div>
					</form>
				</div>
				<div id="edit_ticket">
					<form action=<?php echo 'php/company.php?item=edit_ticket&company_id='.$company_id ?> method="post">
					 	<div class="control-group">
						    <label class="control-label" for="inputTicketAttraction">景点名称&nbsp;&nbsp;</label>
						    <div class="controls">
<!-- 						      <input class='span6'type="text" id="inputTicketAttraction" placeholder="景点名称" name="attraction"> -->
						    	<select class='span6' name="attraction" id="inputTicketAttraction">
						    		<?php 
						    		if($attraction){
						    			foreach ($attraction as $row) {
						    				echo '<option value='.$row['id'].'>'.$row['name'].'</option>';
						    			}
						    		}
						    		 ?>
						    	</select>
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputTicketName">门票名称&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class='span6'type="text" id="inputTicketName" placeholder="门票名称" name="name">
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputPrice">门票价格&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class="span6" type="text"rows="6" id="inputPrice" placeholder="门票价格" name="price">
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputTicketNumber">最大票量&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class="span6" type="text" id="inputTicketNumber" placeholder="最大票量" name="max">
						    </div>
						</div>
						<div class="control-group">
						    <label class="control-label" for="inputTicketDescription">门票介绍&nbsp;&nbsp;</label>
						    <div class="controls">
						      <textarea class="span6" rows="6" id="inputTicketDescription" placeholder="门票介绍" name="description"></textarea>
						    </div>
						</div>
						<div class="control-group">
						    <div class="controls control_button">
						      <input type="submit" class="btn"></button>
						      <input type="reset" class="btn"></button>
						    </div>
						</div>
					</form>
				</div>
				<div id="view_discount_detail">
					<div class="control-group">
					<?php
						if ($discount){
							foreach ($discount as $row) {
								echo '<li>'.
										'<span>'.$row['ticket_info_name'].'</span>'.
										'<span>'.$row['ticket_discount_name'].'</span>'.
										'<span>'.$row['start_date'].'</span>'.
										'<span>'.$row['end_date'].'</span>'.
										'<span><a href="php/company.php?item=delete_discount&discount_id='.$row['id'].'">删除</a>'.
									 '</li>';
							}
						}
						else echo "无已填加的优惠信息！";
					 ?>
					</div>
				</div>
				<div id="view_ticket_detail">
					<div class="control-group">
					<?php 
						$ticket_detail = query("SELECT ticket_info.id,name,price,max,now FROM ticket_info INNER JOIN ticket_book_info
												ON ticket_info.id = ticket_book_info.id WHERE user_id = :id",
												array('id'=>$company_id),
												$conn);
						if ($ticket_detail){
							foreach ($ticket_detail as $row) {
								echo '<li>'.
										'<span>'.$row['name'].'&nbsp;&nbsp;</span>'.
										'<span>'.$row['price'].'&nbsp;&nbsp;</span>'.
										'<span>'.$row['max'].'&nbsp;&nbsp;</span>'.
										'<span>'.$row['now'].'&nbsp;&nbsp;</span>'.	
									 '</li>';	
								$book_detail = query("SELECT user_id FROM ticket_user_record WHERE ticket_id=:id",
													  array('id'=>$row['id']),
													  $conn);
								if ($book_detail){
									foreach ($book_detail as $line) {
										echo $line['user_id'].'&nbsp;&nbsp;';
									}
								}
							}
						}else echo "无添加票务记录！";	
					 ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="row" id="footer">
		<div class="container" >
			<div class="footer_about">
				<p>我们是谁？我们是“妈妈说和猪猪一起写代码才能进决赛队”!</p>
			</div>
			<div>
				<p>2013-2014&copy;妈妈说和猪猪一起写代码才能进决赛队</p>
			</div>
		</div>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- // <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> -->
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
	<script type="text/javascript" src="javascript/jquery-1.10.2.min.js"></script>
	<script src="javascript/qiye_index.js"></script>
	<script type="text/javascript" src="jquery-ui-themes-1.10.3/jquery-ui.js"></script>

</body>
</html>

<script >
var gc = new BMap.Geocoder();
map = new BMap.Map("mapcontainer");                        // 创建Map实例
map.centerAndZoom("中国", 5);     // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom();
var globalLat;
var globalLng;
var globalMarker;
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
    
  //  document.getElementById("destplace").value = addComp.city;
    
    sContent = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
    InfoWindow = new BMap.InfoWindow(sContent);
    globalMarker.addEventListener("click", function(){
        this.openInfoWindow(InfoWindow);
       });
    }); 
   
   // displayUsernameByDOM();
	}
	
});

function submit_attraction(id){
	if ($('#inputAttractionName').val()!="" && $('#inputAttractionDescription').val()!="" && typeof(globalLat) !='undefined' && typeof(globalLng)!='undefined'){
		$.ajax({
			url: 'php/company.php?item=submit_attraction',
			type: 'POST',
			dataType: 'JSON',
			data: {company_id: id, name: $('#inputAttractionName').val(), description: $('#inputAttractionDescription').val(),lat: globalLat, lon: globalLng},
		})
		.done(function(data) {
			switch (data['status']){
				case 'success': alert("成功添加"); break;
				default : alert("添加失败");
			}
		})
		.fail(function() {
			alert("请检查您的网络链接！");
		});
	}else alert("不能为空！");
	
}

	

</script>
