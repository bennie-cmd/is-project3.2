<?php
	session_start();
if (isset($_SESSION['email'])) {
		
	}
	$conn = mysqli_connect('localhost','root', '','employee_ls');
		
	if (isset($_POST['login'])){

			$email = $_POST['email'];
			$password = $_POST['pass'];
			$admin ="admin";
			$employee = "employee";
			
			
			
	    if (!empty($_POST['email']) && !empty($_POST['pass']))
	  {
	  		$password= md5($password);
	  		$query="SELECT * FROM `register` WHERE `email`= '$email' AND `password` = '$password' limit 1";

	  		$result=mysqli_query($conn, $query);

	  		if (mysqli_num_rows($result) == 1) {
	  			$row = mysqli_fetch_assoc($result);
	  			if ($row['user_type'] == "employee") {
	  				$_SESSION['email']=$row['email'];
	  				$_SESSION['employee_id']=$row['employee_id'];
	  				header("location:leave_page.php");
	  			}
	  			elseif ($row['user_type'] == "admin")
	  			{
	  			$_SESSION['email']=$row['email'];
	  			$_SESSION['employee_id']=$row['employee_id'];
	  			header("location:admin_interface.php");
				}
	  		} 


	  } 
	  } 
?>	 	