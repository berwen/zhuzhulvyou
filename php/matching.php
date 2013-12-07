
<?php


$placename = $_POST['pName'];
$cost = $_POST['pCost'];
$func = $_POST['pFunc'];

		if($func=="friends"){
			$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      } 
            mysql_query("set names utf8");
			mysql_query("use iwebsns");
			$result=mysql_query("SELECT event_id FROM isns_event WHERE location='$placename' "); 
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
				}
			}
			echo json_encode($dataArray);
		}
		else if($func == "jingdian"){
			$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      } 
            mysql_query("set names utf8");
			mysql_query("use ourmap");
			$result=mysql_query("SELECT * FROM tourist_spot WHERE (mincost <$cost and maxcost >$cost) and (timefrom <$placename  and timeto >$placename) "); 
			$cnt=0;
            $dataArray=array();
            while($row = mysql_fetch_array($result)){
            	$dataArray[$cnt][0]=$row['placename'];
                $dataArray[$cnt][1]=$row['danji'];
                $cnt++;
            }
           echo json_encode($dataArray);
		}
		else if($func=="favplace"){
			$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      } 
            mysql_query("set names utf8");
			mysql_query("use ourmap");
			$result=mysql_query("SELECT placename FROM favplace_guest WHERE guestname='$placename' "); 
			$dataArray=array();
			//$cnt = 0;	
			$num = 0;
			while($row = mysql_fetch_row($result)){
				$tmp = $row[0];
				$result1=mysql_query("SELECT lng FROM favplace WHERE placename='$tmp' ");
				$row1 = mysql_fetch_row($result1);
				$dataArray[$num]["lng"] = $row1[0];
				$result2=mysql_query("SELECT lat FROM favplace WHERE placename='$tmp' ");
				$row2 = mysql_fetch_row($result2);
				$dataArray[$num]["lat"] = $row2[0];
				$num++;
			}
			echo json_encode($dataArray);
		}
		else if($func=="favfriend"){
			$con = mysql_connect("localhost","root","");
                      if (!$con){  
                        die('Could not connect: ' . mysql_error());
                      } 
            mysql_query("set names utf8");
			mysql_query("use ourmap");
			$result=mysql_query("SELECT placename FROM favplace_guest WHERE guestname='$placename' "); 
			$dataArray=array();
			//$cnt = 0;	
			$num = 0;
			while($row = mysql_fetch_row($result)){
				$tmp = $row[0];
				$result1=mysql_query("SELECT guestname FROM favplace_guest WHERE placename='$tmp' and guestname!='$placename' ");
				//$row1 = mysql_fetch_row($result1);
				while($row1 = mysql_fetch_row($result1)){
					$tmp1=$row1[0];
					$result2=mysql_query("SELECT mingzi FROM users WHERE username='$tmp1' ");
					$row2 = mysql_fetch_row($result2);
					$dataArray[$num]=$row2[0];
					 
			//	$result2=mysql_query("SELECT lat FROM favplace WHERE placename='$tmp' ");
			//	$row2 = mysql_fetch_row($result2);
			//	$dataArray[$num]["lat"] = $row2[0];
				$num++;
			}
			}
			echo json_encode($dataArray);
		}
	





?>
