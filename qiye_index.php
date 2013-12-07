<?php 
require "php/functions.php";
$company_id = 121;
$conn = connect($config);
$attraction = query("SELECT id,name FROM attraction_info WHERE user_id = :id",
				     array('id' => $company_id),
				     $conn);
$ticket = query("SELECT id,name FROM ticket_info WHERE user_id = :id",
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
	<div class="row">
		<div class="container main_frame">
		<div class="row">
			<div class="span3" id="left_bar">
				<div>系统功能</div>
				<div id="attraction"><a href="#">编辑景点信息</a></div>
				<div id="discount"><a href="#">编辑优惠信息</a></div>
				<div id="ticket"><a href="#">编辑票务信息</a></div>
			</div>
			<div class="span8" id="right_bar">
				<div id="edit_attraction">
					<!-- <div class="form-horizontal"> -->
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
					  <div class="control-group map">
					  	地图
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="inputTicketPrice">门票价格&nbsp;&nbsp;</label>
					    <div class="controls">
					      <input class='span6'type="text" id="inputTicketPrice" placeholder="景点名称">
					    </div>
					  </div>
					  <div class="control-group">
						    <label class="control-label" for="inputTicketNumber">最大票量&nbsp;&nbsp;</label>
						    <div class="controls">
						      <input class='span6'type="text" id="inputTicketNumber" placeholder="最大票量">
						    </div>
						</div>
					  <div class="control-group">
					    <div class="controls control_button">
					      <button type="submit" class="btn">提交</button>
					      <button type="clear" class="btn">重置</button>
					    </div>
					  </div>
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