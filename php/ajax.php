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
		$user_id = 121; // TO BE DONE
		$ticket_id = $_POST['ticket_id'];
		$result = array();

		if (true){//改为登录	
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
