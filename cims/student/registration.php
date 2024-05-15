
<?php


require_once('includes/config.php');
error_reporting(E_ALL);
ini_set('display_errors', 1);
$msg = '';
if(isset($_POST['submit'])) 
{
    $fullname = $_POST['fullname'];
    $eid = $_POST['eid'];
    $email = $_POST['email'];
    $course = $_POST['course'];
    $semester = $_POST['semester'];
    $password = $_POST['password'];
    $hashed_password = md5($password);
    $contactno = $_POST['contactno'];
    $status = 1;
    $query = mysqli_query($con, "INSERT INTO student (fullName, eid, email, course, semester, password, contactNo, status) VALUES ('$fullname', '$eid', '$email', '$course', '$semester', '$hashed_password', '$contactno', '$status')");
    $msg = "Registration successful. Now You can login!";



}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Student Registration</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div id="login-page">
	  	<div class="container">
	<h3 align="center" style="color:#fff"><a href="../index.html" style="color:#fff">Complaint Managent And Indication System</a></h3>
	<hr />
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">Student Registration</h2>
		        <p style="padding-left: 1%; color: green">
		        	 <?php if($msg){
						 echo htmlentities($msg);
		        		}?> 
		        </p>
		        <div class="login-wrap">
		         <input type="text" class="form-control" placeholder="Full Name" name="fullname" required="required" autofocus>
		            <br>
					<input type="text" class="form-control" placeholder="E.Id" name="eid" required="required" autofocus>
					<br>

		            <input type="email" class="form-control" placeholder="Email ID" id="email" onBlur="userAvailability()" name="email" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>

					<select name="course" class="form-control" placeholder="course" required="required">
					<option value="B.SC(CA&IT)">B.SC(CA&IT)</option>
					<option value="B.SC(DATA SCINCE)">B.SC(DATA SCINCE)</option>
					<option value="B.SC(IT)">B.SC(IT)</option>
					<option value="MSC(IT)">MSC.IT</option>
					<option value="MSC(IT)">MSC.(CA&IT)</option>
					</select>
					<br>
					
					<select name="semester" class="form-control b-tech" placeholder="semester" required="required" style="display:block;">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					</select>

					<!-- For master option -->
					<select name="semester" class="form-control m-tech" placeholder="semester" required="required" style="display:none;">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					</select>

					<br>
		            <input type="password" class="form-control" placeholder="Password" required="required" name="password"><br >
		             <input type="text" class="form-control" maxlength="10" name="contactno" placeholder="Contact no" required="required" autofocus>
		            <br>
		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
		            <hr>
		            <div class="registration">
		                Already Registered<br/>
		                <a class="" href="index.php">
		                   Sign in
		                </a>
		            </div>
		
		        </div>
		      </form>	  	
	  	
	  	</div>
	  </div>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
</script>
<script>
		$('select').on('change',function name(params) {
			var option = $("option:selected", this);
			var value = this.value;

			if(value == "MSC(IT)"){
				$('.m-tech').show();
				$('.b-tech').hide();
			}else if(value == "B.SC(CA&IT)" || value == "B.SC(CA&IT)" ||value == "B.SC(IT)" ){
				$('.b-tech').show();
				$('.m-tech').hide();
			}
			
		});
	</script>

  </body>
</html>
