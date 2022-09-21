<?php 
 
 if(isset($_POST['submit'])){
 	//echo 'Form Submitted';

 	//$username = "abc@gmail.com";
 	//$password = 'abc123';

 	//Database connectivity.
 	$servername = "localhost";
	$username = "root";
	$password = "";
	$db = "my-project";

// Create connection
	$conn = mysqli_connect($servername, $username, $password,$db);

	// Check connection
	if (!$conn) {
	  die("Connection failed: " . mysqli_connect_error());
	}
	echo "Connected successfully";

	$user = $_POST['username'];
 	$pass = $_POST['password'];

 	$query = "SELECT id,name FROM users WHERE username='$user'AND password='$pass'";
 
 	$result = mysqli_query($conn, $query);
 	
 	 $row = mysqli_fetch_assoc($result);

 	 $user_name = $row['name'];

 	if (mysqli_num_rows($result) >= 1) {
 		session_start();

 		$_SESSION['name'] = $user_name;
 		//$name = $_SESSION['name'];
 		header('Location: index.php');
 	}else{
 		header('Location: login.php');
 	}
 	

 	/*if($user == $username && $pass == $password){
 		//session_start();
 		header('Location: index.php');
 	}else{
 		header('Location: login.php');
 	}*/
 }
?>