<div class="span3">
<div class="sidebar">
<ul class="widget widget-menu unstyled">
<li><a href="dashboard.php">
	<i class="menu-icon icon-dashboard"></i>Dashboard</a>
</li>
</ul>
<ul class="widget widget-menu unstyled">
	<li>
		<a class="collapsed" data-toggle="collapse" href="#togglePages">
			<i class="menu-icon icon-cog"></i>
				<i class="icon-chevron-down pull-right"></i>
				<i class="icon-chevron-up pull-right"></i>
								Manage Complaint
		</a>
	<ul id="togglePages" class="collapse unstyled">
		<li>
			<a href="notprocess-complaint.php">
				<i class="icon-tasks"></i>
					Not Process Yet Complaint
						<?php
						$subid = $_SESSION['suid'];
						$rt = mysqli_query($con, "SELECT * FROM complaints join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	where complaints.status is null and forwardhistory.ForwardTo='$subid'");
						$num1 = mysqli_num_rows($rt); {
							?>
										<b class="label orange pull-right">
										<?php echo htmlentities($num1); ?></b>
								<?php } ?>
			</a>
		</li>
		<li>
			<a href="inprocess-complaint.php">
				<i class="icon-tasks"></i>
				In Process Complaint
				   <?php
				   $status = "in Process";
				   $rt = mysqli_query($con, "SELECT * FROM complaints
join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	
 where status='$status' and forwardhistory.ForwardTo='$subid'");
				   $num1 = mysqli_num_rows($rt); { ?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>
										</a>
									</li>
									<li>
										<a href="closed-complaint.php">
											<i class="icon-inbox"></i>
											Closed Complaints
		 <?php
		 $status = "closed";
		 $rt = mysqli_query($con, "SELECT * FROM complaints
join forwardhistory on forwardhistory.ComplaintNumber=complaints.complaintNumber	
 where status='$status' and forwardhistory.ForwardTo='$subid' ");
		 $num1 = mysqli_num_rows($rt); { ?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>

										</a>
									</li>
								</ul>
							</li>
							
					
		 </ul>
		 


						


						<ul class="widget widget-menu unstyled">
						<li>
								<a href="manage-student.php">
									<i class="menu-icon icon-group"></i>
									Manage Student
								</a>
							</li>
		 </ul>


		 <ul class="widget widget-menu unstyled">
	<li>
		<a class="collapsed" data-toggle="collapse" href="#indication">
			<i class="menu-icon icon-cog"></i>
				<i class="icon-chevron-down pull-right"></i>
				<i class="icon-chevron-up pull-right"></i>
								Manage Indication
		</a>
	<ul id="indication" class="collapse unstyled">
		<li>
			<a href="notprocess-indication.php">
				<i class="icon-tasks"></i>
					Not Process Yet Indication
						<?php
						$subid = $_SESSION['suid'];
						$rt = mysqli_query($con, "SELECT * FROM  indication join forwardhistoryi on forwardhistoryi. IndicationNumber= indication. IndicationNumber	where  indication.status is null and forwardhistoryi.ForwardTo='$subid'");
						$num1 = mysqli_num_rows($rt); {
							?>
										<b class="label orange pull-right">
										<?php echo htmlentities($num1); ?></b>
								<?php } ?>
			</a>
		</li>
		<li>
			<a href="inprocess-indication.php">
				<i class="icon-tasks"></i>
				In Process  Indication
				   <?php
				   $status = "in Process";
				   $rt = mysqli_query($con, "SELECT * FROM  indication
join forwardhistoryi on forwardhistoryi. IndicationNumber=indication.IndicationNumber	
 where status='$status' and forwardhistoryi.ForwardTo='$subid'");
				   $num1 = mysqli_num_rows($rt); { ?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>
										</a>
									</li>
									<li>
										<a href="closed-indication.php">
											<i class="icon-inbox"></i>
											Closed  Indication
		 <?php
		 $status = "closed";
		 $rt = mysqli_query($con, "SELECT * FROM  indication
join forwardhistoryi on forwardhistoryi. IndicationNumber= indication.IndicationNumber	
 where status='$status' and forwardhistoryi.ForwardTo='$subid' ");
		 $num1 = mysqli_num_rows($rt); { ?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>

										</a>
									</li>
								</ul>
							</li>
							
					
		 </ul>
			<ul class="widget widget-menu unstyled">
							<li>
								<a href="logout.php">
									<i class="menu-icon icon-signout"></i>
									Logout
								</a>
							</li>
						</ul>

					</div><!--/.sidebar-->
				</div><!--/.span3-->
