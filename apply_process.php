<?php

	$mysqli = new mysqli('localhost', 'root','','employee_ls') or die(mysqli_error($mysqli));

   if (isset($_POST['request'])) 
{  	
	session_start();
	
	$employee_id = $_SESSION['employee_id']; 
	$leave_type = $_POST['leave_type'];
	$fromdate = date('d-m-Y', strtotime($_POST['begin']));
	$todate = date('d-m-Y', strtotime($_POST['end']));
	$description = $_POST['description'];  
	$status = 0;
	$isread = 0;
	$leave_days = $_POST['leave_days'];
	

	if($fromdate > $todate)
	{
	    echo "<script>alert('End Date should be greater than Start Date');</script>";
	    echo "<script type='text/javascript'> document.location = 'leave_page.php'; </script>";
	  }
	elseif($leave_days <= 0)
	{
		echo "<script>alert('YOU HAVE EXCEEDED YOUR LEAVE LIMIT. LEAVE APPLICATION FAILED');</script>";
		echo "<script type='text/javascript'> document.location = 'leave_page.php'; </script>";
	  }

	elseif ($leave_days >= 0)
	{
		
		
		$begin = date_create($fromdate);
		$end = date_create($todate);

		$diff = date_diff($begin, $end);
		// $num_days = ($begin-$end);
		$num_days = (1 + $diff->format("%a"));
		
$query = "INSERT INTO leave_details (type, startdate, enddate, employee_id, reasons, status, isread, remaining_days) VALUES ('$leave_type', '$fromdate', '$todate', '$employee_id', '$description', '$status', '$isread', '$num_days')";

		$result = mysqli_query($mysqli, $query);
		var_dump($result);
		
		$first = 'your';
		$last = 'Leave was successful';
		$msg = $first." ".$leave_type." ".$last;
		 $_SESSION['message'] = $msg;
		 $_SESSION['msg_type'] = "success"; 
		header("location:leave_history.php");

	}
	else{

		echo "<script>alert('Something went wrong. Please try again');</script>";
	}
	
}
	
?>