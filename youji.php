<?php 
require "php/functions.php";
$log_id = $_GET['log_id'];
$conn = connect_blog($config);
$data = query("SELECT * FROM isns_blog WHERE log_id = :log_id",
			   array('log_id' => $log_id),
			   $conn);
 ?>

<html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<head>
	<title>猪猪旅游-游记</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" type="text/css" href="css/youji.css">
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
					  <li class="active"><a href="#">目的地</a></li>
					  <li><a href="ticket.html">票务</a></li>
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
		<div class="row">
			<div class="span8" id="leftside">
				<div class="row article">
					<?php 
						echo '<h3>' .$data[0]['log_title']. '</h3>';
						echo $data[0]['log_content'];
					 ?>
				</div>
				<div class="row article_list">
					<h3>相关推荐</h3>
					<ul class="list">
						<li>
							<a href="http://www.mafengwo.cn/gonglve/mdd-10068.html">哈尔滨</a>
						</li>
						<li>
							<a href="http://www.mafengwo.cn/gonglve/mdd-10127.html">雪乡</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="span4" id="rightside">
				<div class="row lytieshi">
					<h3>旅游贴士</h3>
					<p>漠河气温极低，大家注意保暖！</p>
					<p>ps：南方的同学千万不要在室外把舌头放到铁上面去哦~~</p>
				</div>
				<div class="row comment">
					<h3>评论</h3>
					<p>猪猪：</p>
					<p>哈~不错，我请大家一起去！</p>
					<p>2013/11/30 11:35</p>
					<textarea rows="3"></textarea>
					<button type="submit" class="btn btn-primary">评论</button>
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
	<script src="javascript/youji.js"></script>
</body>
<html>