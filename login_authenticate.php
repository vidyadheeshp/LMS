<?php 
 
 if(isset($_POST['submit'])){
 	
 	include('pages/required/db_connection.php');
 	include('pages/required/functions.php');

	$user = $_POST['username'];
 	$pass = $_POST['password'];

 	$query = "SELECT id,name 
 				FROM employee_master 
 				WHERE username='".$user."'AND password='".$pass."' AND status = 1";
 
 	$result = db_one($query);
 	
 	if ($result != NULL){
 		session_start();

 		$_SESSION['name'] = $result['name'];
 		//$name = $_SESSION['name'];
 		header('Location: home.php');
 	}else{
 		header('Location: index.php');
 	}
 	
 }
?>