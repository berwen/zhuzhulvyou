<?php 

$config = array('username' => 'root',
			    'password' => '');

//连接ticket数据库
function connect($config)
{
	try {
		$conn = new \PDO('mysql:host=localhost;dbname=ticket',
						$config['username'],
						$config['password']);

		$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

		return $conn;
	} catch(Exception $e) {
		return false;
	}
}

//无返回结果
function query_without_results($query, $bindings, $conn){
	$conn->query('set names utf8;');
	$stmt = $conn->prepare($query);
	$stmt->execute($bindings);
	return $stmt;
}

//查询数据库
function query($query, $bindings, $conn)
{
	$stmt = query_without_results($query, $bindings, $conn);

	$results = $stmt->fetchAll();

	return $results ? $results : false;
}

//返回优惠信息
function get_discount_info($conn){
	$info = query("SELECT * FROM ticket_discount WHERE CURDATE() BETWEEN start_date AND end_date", 
				   array(),
				   $conn);
	return $info;
}

//返回景区所有门票
function get_ticket_info($conn, $attraction_id){
	$info = query("SELECT * FROM ticket_info WHERE attraction_id = :attraction_id",
		   		    array('attraction_id' => $attraction_id),
		            $conn);
	return $info;

}

//订票信息
function get_ticket_book_info($conn, $ticket_id){
	$info = query("SELECT * FROM ticket_book_info WHERE id = :ticket_id",
				   array('ticket_id' => $ticket_id),
				   $conn);
	return $info;
}

//订票
function book_ticket($conn, $user_id, $ticket_id){
	//检测合法TO BE DONE
	query_without_results("INSERT INTO ticket_user_record (user_id,ticket_id,time) VALUES(:user_id,:ticket_id,NOW())",
		   array('user_id' => $user_id,
		   		 'ticket_id' => $ticket_id),
		   $conn);
}

//景点定位
function location_with_attraction($conn, $lat, $lon){
	$info = query("SELECT * FROM attraction_info WHERE pow(:lat-lat,2)+pow(:lon-lon,2)<=pow(radius,2)",
			       array('lat' => $lat, 'lon' => $lon),
			       $conn);
	return $info;
}

//景点介绍和游记
function get_detail_description($conn, $attraction_id){
	$info = query("SELECT * FROM attraction_description WHERE attraction_id = :attraction_id",
			       array('attraction_id' => $attraction_id),
			       $conn);
	return $info;
}

//获取门票
function get_ticket($conn, $id){
	$info = query("SELECT * FROM ticket_info WHERE id = :id",
		           array('id' => $id),
		           $conn);
}

?>
