<?php

$pName = $_POST['pName'];
$pOwner = $_POST['pOwner'];
$pBuyer = $_POST['pBuyer'];
$pValue = $_POST['pValue'];



require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->buybuilding($pName,$pOwner,$pBuyer,$pValue);
if($re){
	return true;
}
else{
	return false;
}

?>



