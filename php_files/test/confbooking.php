<?php 

include "connect.php";


	$car_no=$_POST['car_no'];
   


	$sqlQuery="INSERT INTO confirmed_bookings SELECT * FROM booking_reqeuest where car_no='$car_no'";
    $sql = "DELETE FROM booking_reqeuest where car_no='$car_no'";
    $sql1 = "UPDATE cars SET availbility='0' where car_no='$car_no'";
   
    
    
	$conn->query($sqlQuery);
    $conn->query($sql);
    $conn->query($sql1);

   

   
    
?>