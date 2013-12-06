<?php

$pName = $_POST['pName'];
$pUser = $_POST['pUser'];
$pValue = $_POST['pValue'];

require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->updatebuilding($pName,$pUser,$pValue);
if($re){
	return true;
}
else{
	return false;
}

?>



