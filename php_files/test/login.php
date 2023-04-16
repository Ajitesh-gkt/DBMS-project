<?php 

include "connect.php";
// REGISTER USER

	$email=$_POST['email'];
	$password=$_POST['password'];


	$sqlQuery="SELECT * FROM renter where email='$email' and password='$password'";
    
	$results=$conn->query($sqlQuery);
    $list=array();

    if($results->num_rows>0)
    {
        

        if($results)
        {
            while($row=mysqli_fetch_assoc($results))
            {
                $list[]=$row;
            }
            
            echo json_encode($list);
            return json_encode($list);
    
        }
        // $row = $result->fetch_assoc();
        // $return["success"] = true;
        // $return["name"]= $row->name;
        // // $userData = array(
        // //     'name' => $row['name'],
        // //     'email' => $row['email'],
        // //     'mobile' => $row['mobile'],
        // //     // Add any other relevant user data here
        // // )    ;
        // echo "login successful";
       
        // echo json_encode($row);
        } else {
        // Login failed
        header("HTTP/1.1 401 Unauthorized");
        $result["error"]=true;
        echo "Invalid login credentials";
        }

        echo json_encode($return);

    
    
?>