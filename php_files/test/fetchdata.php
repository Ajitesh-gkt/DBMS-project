<?php 

include "connect.php";


	$email=$_GET['email'];
	$password=$_GET['password'];

	$sqlQuery="SELECT name FROM renter where email='$email' and password='$password' ";
    
	$results= $conn ->query($sqlQuery);
    
    
    if($results->num_rows>0)
    {
        $row = $result->fetch_assoc();
        return json_encode($row);
       
        echo json_encode($row);
        } else {
        // Login failed
        header("HTTP/1.1 401 Unauthorized");
        echo "Invalid login credentials";
        }
    
    echo "Login done";
?>