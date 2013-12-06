
<?php

/*LOGIN*/

$placename = $_POST['pName'];


			
			$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      } 
	
			//echo json_encode("login");
                      mysql_query("set names utf8");
			mysql_query("use iwebsns");
			$result=mysql_query("SELECT event_id FROM isns_event WHERE location='$placename' "); 
	//		$count2 = mysql_fetch_row($feedback2);
			$dataArray=array();
			$cnt = 0;	
			$num = 0;
			while($row = mysql_fetch_row($result)){
				$tmp = $row[$cnt];
				$result1=mysql_query("SELECT user_name FROM isns_event_members WHERE event_id='$tmp' ");
				$cnt1=0;
				while($row1 = mysql_fetch_row($result1)){
					$dataArray[$num] = $row1[$cnt1];
					$num++;
					//$cnt1++;
				}
				//$cnt++;
			}
						// $cnt=0;
      //                 $dataArray=array();
      //                 while($row1 = mysql_fetch_array($result)){
      //                 	$result1=mysql_query("SELECT user_name FROM isns_event_members WHERE event_id='$row1' ");
      //                 	$count3 = mysql_fetch_row($feedback3); 
      //                 	$dataArray[$cnt]=$row1;
      //                 	$cnt++;
      //                 }



			echo json_encode($dataArray);
	





?>
