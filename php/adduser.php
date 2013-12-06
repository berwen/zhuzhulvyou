<?php
$email = $_POST['email'];
$username = $_POST['name'];
$passw = $_POST['password'];

require_once 'funciones_bd.php';
$db = new funciones_BD();

	if($db->isuserexist($user)){

	echo '<script language="javascript">return alert("该用户名已被注册！");</scipt>';
	}else{

		if($db->adduser($username,$passw,$email))
		{	
			
			Header("HTTP/1.1 303 See Other"); 
			Header("Location: /zhuzhulvyou/index.html"); 
			echo '<script language="javascript">return alert("注册成功！");</scipt>';
			exit;
			 }else{
			echo '<script language="javascript">return alert("注册失败！");</scipt>';
			}		

	}





?>



