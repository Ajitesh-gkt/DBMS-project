<?php 
include "connect.php";
$logged_name=$_POST['logged_name'];


$sqlQuery="SELECT * FROM booking_reqeuest where dealer_name='$logged_name'";
$results= $conn ->query($sqlQuery);
$list=array();
    if($results)
    {
        while($row=mysqli_fetch_assoc($results))
        {
            $list[]=$row;
        }
        
        echo json_encode($list);
        return json_encode($list);

    }


    ?>