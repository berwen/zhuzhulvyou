<?php 
	$company_id = $_GET['company_id'];
	$attraction_id = $_POST['attraction'];
	$name = $_POST['name'];
	$price = $_POST['price'];
	$max = $_POST['max'];
	$description = $_POST['description'];

	require "functions.php";
	$conn = connect($config);
	query_without_results("INSERT INTO ticket_info (name,description,user_id,attraction_id)
						   VALUES(:name,:description,:user_id,:attraction_id)",
						   array('name'=>$name, 'description'=>$description, 'user_id'=>intval($company_id), 'attraction_id'=>intval($attraction_id)),
						   $conn);
	query_without_results("INSERT INTO ticket_book_info (price,max,now)
						   VALUES(:price,:max,0)",
						   array('price'=>intval($price), 'max'=>intval($max)),
						   $conn);
	header("location:../qiye_index.php");

 ?>