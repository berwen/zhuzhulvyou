<?php

$pName = $_POST['pName'];


require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->updatebuilding($pName);
if($re){
	return true;
}
else{
	return false;
}

?>



