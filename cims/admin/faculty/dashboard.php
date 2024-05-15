
<?php
session_start();
error_reporting(1);
include ('../include/config.php');
if (strlen($_SESSION['subalogin']) == 0) {
	header('location:../index.php');
} else {
	date_default_timezone_set('Asia/Kolkata');// change according timezone
	$currentTime = date('d-m-Y h:i:s A', time());


	?>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Faculty| Not Precessed Yet Complaints</title>
		<link type="text/css" href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link type="text/css" href="../css/theme.css" rel="stylesheet">
		<link type="text/css" href="../images/icons/css/font-awesome.css" rel="stylesheet">
		<link type="text/css" href='../http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>

	</head>
	<body>
	<?php include ('include/header.php'); ?>

		<div class="wrapper">
			<div class="container">
				<div class="row">
	<?php include ('include/sidebar.php'); ?>				
				<div class="span9">
						<div class="content">

		<div class="module">
								<div class="module-head">
									<h3>Dashboard</h3>
								</div>
	<div class="module-body table">
	<table border="2" align="center" width="80%" style="">
		<tr>
			<th style="color:#000;text-align:center; font-size:22px;">Total complaints </th>
			<th style="color:red;text-align:center; font-size:22px;">Not Processed Yet complaints </th>
			<th style="color:orange;text-align:center;font-size:22px">In Process complaints </th>
			<th style="color:green;text-align:center;font-size:22px">Closed complaints </th>
		</tr>

													<?php
													$subid = $_SESSION['suid'];
													$rt = mysqli_query($con, "SELECT * FROM complaints 
join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	
	where complaints.status is null and forwardhistory.ForwardTo='$subid'");
													$notprocessedyet = mysqli_num_rows($rt);
													//inprocess
													$status = "in Process";
													$rt1 = mysqli_query($con, "SELECT * FROM complaints
join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	
 where status='$status' and forwardhistory.ForwardTo='$subid'");
													$inprocess = mysqli_num_rows($rt1);
													//closed
													$status = "closed";
													$rt2 = mysqli_query($con, "SELECT * FROM complaints
join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	
 where status='$status' and forwardhistory.ForwardTo='$subid' ");
													$closed = mysqli_num_rows($rt2);

													?>

		<tr>
			<th style="color:#000;text-align:center; font-size:18px;"><?php echo $notprocessedyet + $inprocess + $closed; ?></th>
			<th style="color:#000;text-align:center; font-size:18px;"><a href="notprocess-complaint.php"><?php echo $notprocessedyet; ?></a></th>
			<th style="color:#000;text-align:center;font-size:18px"><a href="inprocess-complaint.php"><?php echo $inprocess; ?></a></th>
			<th style="color:#000;text-align:center;font-size:18px"><a href="closed-complaint.php"><?php echo $closed; ?></a></th>
		</tr>

	</table>
						</div>




	<div class="module-body table">
	<table border="2" align="center" width="80%" style="">
		<tr>
			<th style="color:#000;text-align:center; font-size:22px;">Total Indication</th>
			<th style="color:red;text-align:center; font-size:22px;">Not Processed Yet Indication</th>
			<th style="color:orange;text-align:center;font-size:22px">In Process Indication</th>
			<th style="color:green;text-align:center;font-size:22px">Closed Indication</th>
		</tr>

													<?php
													$subid = $_SESSION['suid'];
													$rt = mysqli_query($con, "SELECT * FROM indication
join forwardhistoryi on forwardhistoryi.IndicationNumber=indication.IndicationNumber	
	where indication.status is null and forwardhistoryi.ForwardTo='$subid'");
													$notprocessedyet = mysqli_num_rows($rt);
													//inprocess
													$status = "in Process";
													$rt1 = mysqli_query($con, "SELECT * FROM indication
join forwardhistoryi on forwardhistoryi.IndicationNumber=indication.IndicationNumber	
 where status='$status' and forwardhistoryi.ForwardTo='$subid'");
													$inprocess = mysqli_num_rows($rt1);
													//closed
													$status = "closed";
													$rt2 = mysqli_query($con, "SELECT * FROM indication
join forwardhistoryi on forwardhistoryi.IndicationNumber=indication.IndicationNumber	
 where status='$status' and forwardhistoryi.ForwardTo='$subid' ");
													$closed = mysqli_num_rows($rt2);

													?>

		<tr>
			<th style="color:#000;text-align:center; font-size:18px;"><?php echo $notprocessedyet + $inprocess + $closed; ?></th>
			<th style="color:#000;text-align:center; font-size:18px;"><a href="notprocess-indication.php"><?php echo $notprocessedyet; ?></a></th>
			<th style="color:#000;text-align:center;font-size:18px"><a href="inprocess-indication.php"><?php echo $inprocess; ?></a></th>
			<th style="color:#000;text-align:center;font-size:18px"><a href="closed-indication.php"><?php echo $closed; ?></a></th>
		</tr>

	</table>
</div>
		
							
						</div><!--/.content-->
					</div><!--/.span9-->
				</div>
			</div><!--/.container-->
		</div><!--/.wrapper-->

	

		<script src="../scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="../scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="../scripts/flot/jquery.flot.js" type="text/javascript"></script>
		<script src="../scripts/datatables/jquery.dataTables.js"></script>
		<script>
			$(document).ready(function() {
				$('.datatable-1').dataTable();
				$('.dataTables_paginate').addClass("btn-group datatable-pagination");
				$('.dataTables_paginate > a').wrapInner('<span />');
				$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
				$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
			} );
		</script>
	</body>
<?php } ?>