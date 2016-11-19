<?php


error_reporting(-1);
ini_set('dispaly_errors','true');

require_once('database.php');

session_start();

$usercheck=$_SESSION['SESS_username'];

$query="SELECT * FROM login WHERE username='".$usercheck."'";

$result=mysql_query($query);

$row=mysql_fetch_assoc($result);

$login_session=$row['username'];

if(!isset($login_session))
{
mysql_close($conn);
header("location:login.php");
}

?>
