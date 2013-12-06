<?php

$pName = $_POST['placeName'];
$ptype = $_POST['placeType'];
$pIntro = $_POST['intro'];
$pLat = $_GET['pLat'];
$pLng = $_GET['pLng'];

require_once 'funciones_bd.php';
$db = new funciones_BD();




/*if ((($_FILES["file"]["type"] == "image/gif")
|| ($_FILES["file"]["type"] == "image/jpeg")
|| ($_FILES["file"]["type"] == "image/pjpeg"))
&& ($_FILES["file"]["size"] < 20000))
  {*/
  if ($_FILES["file"]["error"][0] > 0)
    {
 
    }
  else
    {
					  
      move_uploaded_file($_FILES["file"]["tmp_name"][0],
      "upload/" . $_FILES["file"]["name"][0]);
      
    }

  if ($_FILES["file"]["error"][1] > 0)
    {

    }
  else
    {


					  
      move_uploaded_file($_FILES["file"]["tmp_name"][1],
      "upload/" . $_FILES["file"]["name"][1]);


    }
	
		$re = $db->addplace($pName,$ptype, $pIntro,$pLng,$pLat,"upload/".$_FILES["file"]["name"][0],"upload/".$_FILES["file"]["name"][1]);
		
	  header("Location: /zhuzhulvyou/php/fav_map.php");     
		exit;  
/*else
  {
  echo "Invalid file";
  }*/
?>