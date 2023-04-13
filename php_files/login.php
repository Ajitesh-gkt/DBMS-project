<?php 

include "connect.php";
// REGISTER USER

	$email=$_POST['email'];
	$password=$_POST['password'];

	$sqlQuery="SELECT * FROM renter where email='$email' and password='$password' ";
    
	$results= $conn ->query($sqlQuery);
 
    
    if($results->num_rows>0)
    {
        $row = $result->fetch_assoc();
        $userData = array(
            'name' => $row['name'],
            'email' => $row['email'],
            'mobile' => $row['mobile'],
            // Add any other relevant user data here
        );
        echo json_encode($userData);
        } else {
        // Login failed
        header("HTTP/1.1 401 Unauthorized");
        echo "Invalid login credentials";
        }
    
    echo "Login done";
?>