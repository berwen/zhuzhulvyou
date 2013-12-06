
<?php

/*LOGIN*/

$usuario = $_POST['pName'];
$passw = $_POST['pPass'];
$func = $_POST['pFunc'];

require_once 'funciones_bd.php';
$db = new funciones_BD();
	if($func == "yes"){
		if($db->login($usuario,$passw)){

			$result=array("login"=>"0");
			//echo "false";
			}
			else{
			//echo json_encode("login");
			mysql_query("use ourmap");
			$feedback2=mysql_query("SELECT caifu FROM users WHERE username='$usuario' "); 
			$count2 = mysql_fetch_row($feedback2);
			$feedback3=mysql_query("SELECT identity FROM users WHERE username='$usuario' ");
			$count3 = mysql_fetch_row($feedback3); 

			mysql_query("use iwebsns");
			mysql_query("UPDATE isns_currentuser set username = '$usuario' WHERE id =1 ");
			$feedback1=mysql_query("SELECT integral FROM isns_users WHERE user_email='$usuario' "); 
			$count1 = mysql_fetch_row($feedback1);
			//$result["money"] = $count[0];
			$money = $count1[0] + $count2[0];
			$result=array("login"=>"1","money" => $count1[0] + $count2[0],"identity"=>$count3[0]);
			mysql_query("UPDATE isns_currentuser set caifu = '$money' WHERE id =1 ");
			
			}

			echo json_encode($result);
	}
	else if($func == "no"){

			mysql_query("use ourmap");
			$feedback2=mysql_query("SELECT caifu FROM users WHERE username='$usuario' "); 
			$count2 = mysql_fetch_row($feedback2);
			$feedback3=mysql_query("SELECT identity FROM users WHERE username='$usuario' ");
			$count3 = mysql_fetch_row($feedback3); 

			mysql_query("use iwebsns");
			mysql_query("UPDATE isns_currentuser set username = '$usuario' WHERE id =1 ");
			$feedback1=mysql_query("SELECT integral FROM isns_users WHERE user_email='$usuario' "); 
			$count1 = mysql_fetch_row($feedback1);
			//$result["money"] = $count[0];
			$money = $count1[0] + $count2[0];
			$result=array("login"=>"1","money" => $count1[0] + $count2[0],"identity"=>$count3[0]);
			mysql_query("UPDATE isns_currentuser set caifu = '$money' WHERE id =1 ");
			echo json_encode($result);
	}
	else if($func == "logout"){
			mysql_query("use iwebsns");
			$result = mysql_query("UPDATE isns_currentuser set username = '' WHERE id =1 ");
			echo json_encode($result);
	}




?>
