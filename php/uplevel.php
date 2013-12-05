<?php
require "functions.php";


function discount($config){
	$conn = connect($config);
	$info = query("SELECT ticket_info.name,ticket_discount.description FROM ticket_discount INNER JOIN ticket_info 
		           ON ticket_info.id = ticket_discount.ticket_id
		           WHERE CURDATE() BETWEEN start_date AND end_date",
		           array(), $conn);
	return $info;
} 
 ?>