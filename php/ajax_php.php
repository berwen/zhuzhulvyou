<?php 
$item = $_POST['item'];
switch ($item) {
	case 'get_ticket_info':
		$lat = $_POST['lat'];
		$lon = $_POST['lon'];

		require "functions.php";

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
	default:
		break;
}

 ?>