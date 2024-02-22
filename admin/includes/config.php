<?php
define('DB_SERVER','localhost');
define('DB_USER','u304447791_admin');
define('DB_PASS' ,'Illuminati@india71');
define('DB_NAME','u304447791_newsportal');
$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>