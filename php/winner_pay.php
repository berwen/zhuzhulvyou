<?php


$pOwner = $_POST['pOwner'];
$pBuyer = $_POST['pBuyer'];
$pFee = $_POST['pFee'];



require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->payfee($pOwner,$pBuyer,$pFee);
if($re){
	return true;
}
else{
	return false;
}

?>



