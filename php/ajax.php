<?php 
$item = $_POST['item'];

require "functions.php";
switch ($item) {
	case 'ticket_info':
		$lat = $_POST['lat'];
		$lon = $_POST['lon'];

		$conn = connect($config);
		$info = location_with_attraction($conn, $lat, $lon);
			
		$data = query("SELECT * FROM ticket_info INNER JOIN ticket_book_info
					   ON ticket_info.id = ticket_book_info.id
					   WHERE ticket_info.attraction_id = :id",
					   array('id' => $info[0]['id']),
					   $conn);
		$result = array();
		$result['attraction_name'] = $info[0]['name'];
		$result['detail'] = $data;
		echo json_encode($result);
		break;
	
	case 'book_ticket':
		$ticket_id = $_POST['ticket_id'];
		$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      }  
                      mysql_query("set names utf8");
                      mysql_query("use iwebsns");
		$result=mysql_query("SELECT username FROM isns_currentuser WHERE id='1'");//用户名已经记录了
		$count = mysql_fetch_row($result);
		$username= $count[0];
		mysql_query("use ourmap");
		$result1=mysql_query("SELECT id FROM users WHERE username='$username'");
		$count1 = mysql_fetch_row($result1);
		$user_id = $count1[0]; // TO BE DONE
		$result = array();
		
		if ($username!=""){//改为登录
			$conn = connect($config);
			book_ticket($conn, $user_id, $ticket_id);
			$result['status'] = 'success';
		}
		else {$result['status'] = 'nologin';}
		echo json_encode($result);	
		break;
		
	case 'search_travel_notes':
		$attraction = '%'.$_POST['attraction'].'%';
		$conn = connect_blog($config);
		$data = query("SELECT log_id,log_title,add_time FROM isns_blog 
					   WHERE (log_sort_name = '游记') AND (tag LIKE :attraction)",
					   array('attraction' => $attraction),
					   $conn);
		echo json_encode($data);
		break;
	default:
		# code...
		break;
}

 ?>
