<?php 

include "connect.php";


	$car_no=$_POST['car_no'];
    $logged_name=$_POST['logged_name'];


	$sqlQuery="SELECT * FROM cars where car_no='$car_no'";

    
	$results=$conn->query($sqlQuery);

    if (mysqli_num_rows($results) > 0) {
        echo "done";
// output data of each row

    while($row = mysqli_fetch_assoc($results)) {
        $row1 = $row["model_name"];
        $row2 = $row["car_no"];
        $row3 = $row["rent_per_day"];
        $row4 = $row["dealer"];
//Insert Data to another table
            $sql = "INSERT INTO booking_reqeuest(model_name,car_no,rent,dealer_name,renter_name)
            VALUES ('$row1', '$row2', '$row3','$row4','$logged_name');";
            $conn->query($sql);
            
        
    }
}

   
    
?>