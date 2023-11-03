<?php
include('includes/config.php');
error_reporting(0);
if(isset($_POST['submit']))
{
	$fullname= mysqli_real_escape_string($con, $_POST['fullname']);
	$email= mysqli_real_escape_string($con, $_POST['email']);
	$idcode = mysqli_real_escape_string($con, $_POST['idcode']);
	$password=mysqli_real_escape_string($con , $_POST['password']);
	$cpassword=mysqli_real_escape_string($con, $_POST['cpassword']);
	$contactno=mysqli_real_escape_string($con , $_POST['contactno']);
	$status=1;
	//$password=md5($_POST['password']);

	$pass = md5($password);
    $cpass = md5($cpassword);

    // password_hash($password, PASSWORD_BCRYPT);
    // $cpass = password_hash($cpassword, PASSWORD_BCRYPT);


	$token = bin2hex(random_bytes(15));

	$emailquery = "select * from users where userEmail ='$email'";
	$query = mysqli_query($con,$emailquery);


	$emailcount = mysqli_num_rows($query);


	if($emailcount>0)
	{
		?>
<script>
alert("Email already exist");
</script>

<?php

		//echo "Email entered....";
	}else if ($password != $cpassword) {
		?>
<script>
alert("Password does not match with Confirm password");
</script>
<?php

	}else if(strlen($password) < 8){
		?>
<script>
alert("Password should not be less than 8 characters");
</script>
<?php

	}else if(strlen($contactno) != 10){
		?>
<script>
alert("Contact no should be of 10 digits");
</script>

<?php

	}else if (!ctype_digit($contactno)) {
		?>
<script>
alert("Contact no should only contains digits");
</script>

<?php
	}
		else{
		//if($password === $cpassword){
		
			$query = "insert into users(fullName,userEmail,password,cpassword,contactNo,status,token,status11,rollno) values('$fullname','$email','$pass','$cpass','$contactno','$status','$token','active','$idcode')";
			
			$iquery = mysqli_query($con, $query);
		?>

<script>
alert("User Created Successfully");
</script>
<<?php    } } ?>?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>CMS | User Registration</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <script>
        function userAvailability() {
            $("#loaderIcon").show();
            jQuery.ajax({
                url: "check_availability.php",
                data: 'email=' + $("#email").val(),
                type: "POST",
                success: function(data) {
                    $("#user-availability-status1").html(data);
                    $("#loaderIcon").hide();
                },
                error: function() {}
            });
        }
        </script>
    </head>

    <body>
        <div id="login-page">
            <div class="container">
                <h3 align="center" style="color:#fff"><a href="../index.html" style="color:#fff">Complaint Managent
                        System</a></h3>
                <hr />
                <form action="<?php echo htmlentities($_SERVER['PHP_SELF'])?>" class="form-login" method="post">
                    <h2 class="form-login-heading">User Registration</h2>
                    <p style="padding-left: 1%; color: green">
                        <?php if($msg){
echo htmlentities($msg);
		        		}?>


                    </p>
                    <div class="login-wrap">
                        <input type="text" class="form-control" placeholder="Full Name"
                            value="<?php echo $_POST['fullname'] ?>" name="fullname" required="required" autofocus>
                        <br>
                        <input type="email" class="form-control" placeholder="Email ID"
                            value="<?php echo $_POST['email'] ?>" id="email" onBlur="userAvailability()" name="email"
                            required="required">
                        <span id="user-availability-status1" style="font-size:12px;"></span>
                        <br>
                        <input type="text" class="form-control" placeholder="ID code"
                            value="<?php echo $_POST['idcode'] ?>" name="idcode" required="required" autofocus>
                        <br>
                        <input type="password" class="form-control" placeholder="Password" required="required"
                            name="password"><br>

                        <input type="password" class="form-control" placeholder="confirm Password" required="required"
                            name="cpassword"><br>

                        <input type="text" class="form-control" maxlength="10" name="contactno" placeholder="Contact no"
                            value="<?php echo $_POST['contactno'] ?>" required="required" autofocus>
                        <br>

                        <button class="btn btn-theme btn-block" type="submit" name="submit" id="submit"><i
                                class="fa fa-user"></i> Register</button>
                        <hr>

                        <div class="registration">
                            Already Registered<br />
                            <a class="" href="index.php">
                                Sign in
                            </a>
                        </div>

                    </div>



                </form>

            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>
        $.backstretch("assets/img/login-bg.jpg", {
            speed: 500
        });
        </script>


    </body>

    </html>