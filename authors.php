<?php

include('database.php');

$author_name;
$book_name;

$query='SELECT * FROM authors';

$result=mysql_query($query);

$row=mysql_fetch_assoc($result);


if($row==1)
{

$author_name=

