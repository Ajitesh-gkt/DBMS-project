<?php 
include "connect.php";
// REGISTER USER

	$name=$_POST['name'];
	$email=$_POST['email'];
	$mobile=$_POST['mobile'];
	$password=$_POST['password'];

	$sqlQuery="INSERT INTO renter (name,email,mobile,password) VALUES ('$name','$email','$mobile','$password')";
    // $name = mysqli_real_escape_string($conn, $_POST['name']);
    // $email = mysqli_real_escape_string($conn, $_POST['email']);
    // $mobile = mysqli_real_escape_string($conn, $_POST['mobile']);
	// $password = mysqli_real_escape_string($conn, $_POST['password']);
	// print($name);
	$results= $conn ->query($sqlQuery);
 
    //     $query = "INSERT INTO renter (name, email,mobile,password)
  	// 		  VALUES('$name', '$email','$mobile','$password')";
    // $results = conn_query($connect, $query);
    if($results>0)
    {
        echo "user added successfully";
    }
    
    ?>