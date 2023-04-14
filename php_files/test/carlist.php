<?php 
include "connect.php";


$sqlQuery="SELECT * FROM cars";
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