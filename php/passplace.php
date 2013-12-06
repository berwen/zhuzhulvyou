<?php

$pName = $_POST['pName'];
$ptype = $_POST['pType'];
$pIntro = $_POST['pIntro'];
$pLat = $_POST['pLat'];
$pLng = $_POST['pLng'];

require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->addplace($pName,$ptype, $pIntro,$pLng,$pLat);
if($re){
	return true;
}
else{
	return false;
}

?>



