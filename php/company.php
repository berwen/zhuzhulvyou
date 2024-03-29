<?php 
	$item = $_GET['item'];
	

	switch ($item) {
		case "edit_ticket":
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
			break;
		
		case "edit_discount":
			$company_id = $_GET['company_id'];
			$ticket_id = $_POST['ticket'];
			$name = $_POST['name'];
			$description = $_POST['description'];
			$start_date = date('Y-m-d', strtotime($_POST['start_date']));
			$end_date = date('Y-m-d', strtotime($_POST['end_date']));

			require "functions.php";
			$conn = connect($config);
			query_without_results("INSERT INTO ticket_discount (name,ticket_id,start_date,end_date,description,user_id)
								   VALUES(:name,:ticket_id,:start_date,:end_date,:description,:user_id)",
								   array('name'=>$name,'ticket_id'=>$ticket_id,'start_date'=>$start_date,'end_date'=>$end_date,
								   		 'description'=>$description,'user_id'=>$company_id),
								   $conn);
			header("location:../qiye_index.php");
			break;

		case "delete_discount":
			$discount_id = $_GET['discount_id'];

			require "functions.php";
			$conn = connect($config);
			query_without_results("DELETE FROM ticket_discount WHERE id = :id",
								   array('id'=>$discount_id),
								   $conn);

			header("location:../qiye_index.php");
			break;

		case "submit_attraction":
			$company_id = $_POST['company_id'];
			$name = $_POST['name'];
			$description = $_POST['description'];
			$lat = $_POST['lat'];
			$lon = $_POST['lon'];

			require "functions.php";
			$conn = connect($config);
			query_without_results("INSERT INTO attraction_info (name,description,lat,lon,user_id)
								   VALUES(:name,:description,:lat,:lon,:user_id)",
								   array('name'=>$name,'description'=>$description,'lat'=>$lat,'lon'=>$lon,'user_id'=>$company_id),
								   $conn);
			$result =array();
			$result['status'] = 'success';
			echo json_encode($result);
			break;
		default:
			break;
	}
	

 ?>