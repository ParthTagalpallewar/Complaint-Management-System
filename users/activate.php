<?php
	
session_start();

include 'includes/config.php';

if(isset($_GET ['token']))
{
	$token = $_GET ['token'];

	$updatequery = " update users set status11 = 'active' where token = '$token'";

	$query = mysqli_query($con , $updatequery);

	if ($query)
	 {
		if(isset($_SESSION ['msg1']))
		{
			$_SESSION['msg1'] = "Account updated successfully";
			header('Location:index.php');
		}else
		{
			$_SESSION['msg1'] = "Account updated successfully";
			header('Location:index.php');

		}
	 }else{
		$_SESSION['msg1'] = "Account not updated ";
			header('Location:registration.php');
	}
}
?>


