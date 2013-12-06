<?php 
require "php\uplevel.php";
$discount_info = discount($config);
 ?>
<html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<head>
	<title>猪猪旅游-游记</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" type="text/css" href="css/ticket.css">
	<link rel="stylesheet" type="text/css" href="jquery-ui-themes-1.10.3/themes/smoothness/jquery-ui.css"> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=1bbe1bfaa50c4eb69022911a5a8735ea;"></script>
	<!-- // <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
	<!-- // <script src="javascript/jquery.min.js"></script> -->
	<!-- <script src="javascript/index.js"></script> -->
	<!-- // <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
</head>
<body>
	<!-- <div style="display:none;"><img src="bg.jpg"></div> -->
	<div id="up_part">
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
			      <a class="brand" href="#">猪猪旅游</a>
			      <!-- Everything you want hidden at 940px or less, place within here -->
			      <div class="nav-collapse collapse" id="head_menu">
			        <!-- .nav, .navbar-search, .navbar-form, etc -->
			        <ul class="nav">
					  <li ><a href="index.html">主页</a></li>
					  <li><a href="destination_index.html">目的地</a></li>
					  <li class="active"><a href="#">票务</a></li>
					  <li><a href="#">我的空间</a></li>
					</ul>
			      </div>
			      <div class="navbar-form pull-left" id="head_login">
					  <input type="text" class="span2" placeholder="用户名">
					  <input type="text" class="span2" placeholder="密码">
					  <button type="submit" class="btn" id="head_submit">登录</button>
					  <button type="submit" class="btn">注册</button>
				  </div>
			 
			    </div>
			  </div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row main">
			<div class="span4">
				<div class="row search">
					<h3>搜索</h3>
					<p>出发日期<input type="text" class="date"></p>
					<p>返回日期<input type="text" class="date"></p>
					<form class="form-search">
					  <div class="input-append">
					  	<input type="text" class="span1" placeholder="出发地" id="startplace">
					    <input type="text" class="span1" placeholder="目的地" id="destplace">
					    
					    <button type="submit" class="btn">Search</button>
					  </div>
					</form>
				</div>
				<div class="row youhui">
					<h3>优惠推荐</h3>
					<?php 
					foreach ($discount_info as $row) {
						echo '<li>'.$row['name'].$row['description'].'</li>';
					}
					 ?>
				</div>
			</div>
			<div class="span8">
				<div class="row">
					<h3>地图</h3>
					<div class="map" id="mapcontainer"></div>

					<div id = "ticket_info">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="footer">
		<div class="container">
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
	<script src="javascript/ticket.js"></script>
	<script src="javascript/ticketmap.js"></script>
	<script type="text/javascript" src="jquery-ui-themes-1.10.3/jquery-ui.js"></script>
	 

</body>
<html>