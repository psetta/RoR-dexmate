<?php
$servername = "localhost";
$username = "root";
$password = "ruedalarueda";
$dbname = "dexmate";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//$eventsRepeated = $conn->query("SELECT idcalendar from mod_calendars where anualRep=1;");
$conn->query("UPDATE mod_calendars SET date = DATE_ADD(date, interval 1 year) where anualRep=1;");
$conn->query("UPDATE mod_calendars SET dateF = DATE_ADD(dateF, interval 1 year) where anualRep=1;");


mysqli_close ( $conn );

?>