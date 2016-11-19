<?php
$conn=mysql_connect('localhost','root','rs@420');
if(!$conn)
{
  die('ERROR: Could not connect to the MySql Server');
}

mysql_select_db('LibraryManagement',$conn) or die('ERROR: Could not connect to the Database');
?>



