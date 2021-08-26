<?php 
include 'process_login.php';

	if (isset($_SESSION['email']))
    {
      session_destroy();
      unset($_SESSION['email']);
      header("location: index.php");
    }

?>