<?php

class funciones_BD {
 
    private $db;
 
    // constructor

    function __construct() {
        require_once 'connectbd.php';
        // connecting to database

        $this->db = new DB_Connect();
        $this->db->connect();

    }
 
    // destructor
    function __destruct() {
 
    }
 
    /**
     * agregar nuevo usuario
     */
    public function adduser($username, $password,$email) {
		mysql_query("set names utf8");
		$result = mysql_query("INSERT INTO users(username,mingzi,password,identity,caifu) VALUES('$email','$username','$password',1,200)");
		mysql_query("use iwebsns");
        $jiami = md5('$password');
		$sql="insert into isns_users (user_name,user_pws,user_sex,user_email,user_add_time,user_ico,invite_from_uid,is_pass,lastlogin_datetime,birth_year , birth_month , birth_day ,login_ip )"
					." values('$username','$jiami','1','$email','date(\"Y-m-d H:i:s\")','skin/default/jooyea/images/d_ico_1_small.gif',1,'','','','','','')";
		mysql_query($sql);
		mysql_query("use ourmap");
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function addcompany($companyname, $password,$email) {
        mysql_query("set names utf8");
        $result = mysql_query("INSERT INTO users(username,mingzi,password,identity,caifu) VALUES('$email','$companyname','$password',2,200)");
        mysql_query("use iwebsns");
        $jiami = md5('$password');
        $sql="insert into isns_users (user_name,user_pws,user_sex,user_email,user_add_time,user_ico,invite_from_uid,is_pass,lastlogin_datetime,birth_year , birth_month , birth_day ,login_ip )"
                    ." values('$companyname','$jiami','1','$email','date(\"Y-m-d H:i:s\")','skin/default/jooyea/images/d_ico_1_small.gif',1,'','','','','','')";
        mysql_query($sql);
        mysql_query("use ourmap");
        if ($result) {
            return true;
        } else {
            return false;
        }

    }
 
 
     /**
     * Verificar si el usuario ya existe por el username
     */

    public function isuserexist($username) {

        $result = mysql_query("SELECT username from users WHERE username = '$username'");

        $num_rows = mysql_num_rows($result); //numero de filas retornadas

        if ($num_rows > 0) {

            //exist

            return true;
        } else {
            // no exist
            return false;
        }
    }
 
   
	public function login($user,$passw){

	$result=mysql_query("SELECT COUNT(*) FROM users WHERE username='$user' AND password='$passw' "); 
	$count = mysql_fetch_row($result);

	/*como el usuario debe ser unico cuenta el numero de ocurrencias con esos datos*/


		if ($count[0]==0){

		return true;

		}else{

		return false;

		}
	}
	
	public function addplace($placename, $placetype, $placeintro,$lng,$lat,$pic,$sound) {
	   mysql_query("set names utf8");
        $result = mysql_query("SELECT placename from favplace WHERE placename = '$placename'");
        $num_rows = mysql_num_rows($result); //numero de filas retornadas
        if ($num_rows > 0) {
            //return true;
        } else {
            // no exist
            //return false;
            $result = mysql_query("INSERT INTO favplace(placename,visited,placetype,placeintro,lng,lat,pic,sound) VALUES('$placename','0', '$placetype', '$placeintro','$lng','$lat','$pic','$sound')");
        // check for successful store
	//	$newplacename = $placename.'_info';
	//	$userdate = $username.'_date';

       //     $result1 = mysql_query("create table '$placename'(id int not null primary key, guestname varchar(50))");
	//		 mysql_query("INSERT INTO favplace_guest(placename,guestname) VALUES('$placename','系统成员')");
	//	$result1 = mysql_query("create table $usergroup (socketgroup varchar(20) not null,num int not null)");
	//	$result1 = mysql_query("create table $userdate (start varchar(20) not null,end varchar(20) not null,content varchar(100) not null,name varchar(20) not null)");
		
	//	mysql_query("INSERT INTO $usergroup(socketgroup,num) VALUES('未分组',0)");
          }
        if ($result) {

            return true;

        } else {

            return false;
        }
    }

    public function addvisitor($placename, $username) {
       mysql_query("set names utf8");

        $result = mysql_query("INSERT INTO favplace_guest(guestname,placename) VALUES('$username','$placename')");
        mysql_query("UPDATE favplace set visited = visited + 1 WHERE placename = '$placename'");
    
        if ($result) {

            return true;

        } else {

            return false;
        }

    }

    public function updatebuilding($placename,$username,$value) {
       mysql_query("set names utf8");

     //   $result = mysql_query("INSERT INTO favplace_guest(placename,guestname) VALUES('$placename','$username')");
        mysql_query("UPDATE winner set value = value * 2  WHERE placename = '$placename'");
        mysql_query("UPDATE winner set fee = fee * 2  WHERE placename = '$placename'"); 
        mysql_query("UPDATE users set caifu = caifu -'$value' WHERE username = '$username'"); 
    }

    public function buybuilding($placename,$ownername,$buyername,$value) {
        mysql_query("set names utf8");
     //   $result = mysql_query("INSERT INTO favplace_guest(placename,guestname) VALUES('$placename','$username')");
        mysql_query("UPDATE winner set owner = '$buyername' WHERE placename = '$placename'");      
        mysql_query("UPDATE users set caifu = caifu -'$value' WHERE username = '$buyername'"); 
        mysql_query("UPDATE users set caifu = caifu +'$value' WHERE username = '$ownername'"); 
        mysql_query("use iwebsns");
        mysql_query("UPDATE isns_currentuser set caifu = caifu -'$value' WHERE id =1"); 
        mysql_query("use ourmap");
    }

    public function payfee($ownername,$buyername,$fee) {
        mysql_query("set names utf8");
     //   $result = mysql_query("INSERT INTO favplace_guest(placename,guestname) VALUES('$placename','$username')");
      //  mysql_query("UPDATE winner set owner = '$buyername' WHERE placename = '$placename'");      
        mysql_query("UPDATE users set caifu = caifu -'$fee' WHERE username = '$buyername'"); 
        mysql_query("UPDATE users set caifu = caifu +'$fee' WHERE username = '$ownername'"); 
        mysql_query("use iwebsns");
        mysql_query("UPDATE isns_currentuser set caifu = caifu -'$fee' WHERE id =1"); 
        mysql_query("use ourmap");
    }
    
  
}
 
?>
