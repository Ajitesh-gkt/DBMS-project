<?php 
include "connect.php";


	$model_name=$_POST['model_name'];
	$car_age=$_POST['car_age']  ;
	$car_no=$_POST['car_no'];
	$car_cond=$_POST['car_cond'];
    $state=$_POST['state'];
    $district=$_POST['district'];
    $rent_per_day=$_POST['rent_per_day'];

	$sqlQuery="INSERT INTO cars (model_name,car_age,car_no,car_cond,state,district,rent_per_day) VALUES ('$model_name','$car_age','$car_no','$car_cond','$state','$district','$rent_per_day')";
	$results= $conn ->query($sqlQuery);
 
  
    if($results>0)
    {
        echo "car for rent added successfully";
    }
    
    ?>