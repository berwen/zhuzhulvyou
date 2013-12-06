<?php

$pName = $_POST['pName'];
$pUser = $_POST['pUser'];

require_once 'funciones_bd.php';
$db = new funciones_BD();

$re = $db->addvisitor($pName,$pUser);

?>



