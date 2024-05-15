<?php session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{ ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>CIMS | Indication Details</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
  </head>
  <body>
  <section id="container" >
<?php include('includes/header.php');?>
<?php include('includes/sidebar.php');?>
      <section id="main-content" style="padding-left:5%; color:#000">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Indication Details</h3>
            <hr />

 <?php $query=mysqli_query($con,"select indication.*,category.categoryName as catname from indication join category on category.id=indication.category where studentId='".$_SESSION['id']."' and IndicationNumber='".$_GET['id']."'");
while($row=mysqli_fetch_array($query))
{?>
          	<div class="row mt">
              <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped  display" width="100%">
           <tr>
                      <td><b>Indication Number</b></td>
                      <td><?php echo htmlentities($row['IndicationNumber']);?></td>
                      <td><b>Indication Name</b></td>
                      <td> <?php echo htmlentities($row['name']);?></td>
                      <td><b>Reg Date</b></td>
                      <td><?php echo htmlentities($row['regDate']);?>
                      </td>
                    </tr>

<tr>
                      <td><b>Category </b></td>
                      <td><?php echo htmlentities($row['catname']);?></td>
                      <td><b>SubCategory</b></td>
                      <td> <?php echo htmlentities($row['subcategory']);?></td>
                      <td><b>Indication Type</b></td>
                      <td><?php echo htmlentities($row['IndicationType']);?>
                      </td>
                    </tr>
<tr>
                      <td><b>State </b></td>
                      <td><?php echo htmlentities($row['state']);?></td>
                      <td ><b>Nature of Indication</b></td>
                      <td colspan="3"> <?php echo htmlentities($row['noc']);?></td>
                      
                    </tr>
<tr>
                      <td><b>Indication Details </b></td>
                      
                      <td colspan="5"> <?php echo htmlentities($row['IndicationDetails']);?></td>
                      
                    </tr>

                      </tr>
<tr>
                      <td><b>File(if any) </b></td>
                      
                      <td colspan="5"> <?php $cfile=$row['complaintFile'];
if($cfile=="" || $cfile=="NULL")
{
  echo "File NA";
}
else{?>
<a href="../STUDENT/complaintdocs/<?php echo htmlentities($row['complaintFile']);?>" target="_blank"/> View File</a>
<?php } ?></td>
</tr>

<tr>
<td><b>Final Status</b></td>                      
<td colspan="5" style="color:red"><?php if($row['status']==""){ echo "Not Process Yet";
} else {
echo htmlentities($row['status']);
}?></td>
</tr>


<?php
$cmpno=intval($_GET['id']);
$qry=mysqli_query($con,"select  faculty.FacultyName,faculty.Department,forwardhistoryi.ForwadDate from forwardhistoryi join faculty on faculty.id=forwardhistoryi.ForwardTo where forwardhistoryi.IndicationNumber='$cmpno'");
while($result=mysqli_fetch_array($qry))
{
?>
<tr>
<td><b>Forward to </b></td>
<td colspan="3"> <?php echo htmlentities($result['FacultyName']);?>- (<?php echo htmlentities($result['Department']);?>)</td>
<td><b>Forward Date </b></td>
<td> <?php echo htmlentities($result['ForwadDate']);?></td>
</tr>
<?php } ?>


<?php $ret=mysqli_query($con,"select indicationremark.remark as remark,indicationremark.status as sstatus,indicationremark.remarkDate as rdate from indicationremark join indication on indication.IndicationNumber=indicationremark.IndicationNumber where indicationremark.IndicationNumber='".$_GET['id']."'");
while($rw=mysqli_fetch_array($ret))
{
?>
<tr>
<td><b>Remark</b></td>
<td colspan="3"><?php echo  htmlentities($rw['remark']); ?> 
<th>Remark By :</th>
<td>Admin</td>
</tr>

<tr>
<td><b>Status</b></td>
<td colspan="3"><?php echo  htmlentities($rw['sstatus']); ?></td>
<th>Remark Date :</th>
<td ><?php echo  htmlentities($rw['rdate']); ?></td>
</tr>
<?php }?>


<?php $ret1=mysqli_query($con,"select remark.indicationremark,remark.IndicationStatus,remark.PostingDate,
  faculty.FacultyName,faculty.Department from facultyremark 
  join indication on indication.IndicationNumber=remark.IndicationNumber 
  join faculty on faculty.id=indicationremark.RemarkBy 
  where remark.IndicationNumber='".$_GET['id']."'");
while($rww=mysqli_fetch_array($ret1))
{
?>
<tr>
<td><b>Remark</b></td>
<td colspan="3"><?php echo  htmlentities($rww['indicationremark']); ?> 
<th>Remark By :</th>
<td><?php echo  htmlentities($rww['FacultyName']); ?>-(<?php echo  htmlentities($rww['Department']); ?>)</td>
</tr>
<tr>
<td><b>Status</b></td>
<td colspan="3"><?php echo  htmlentities($rww['IndicationStatus']); ?></td>
<th>Remark Date :</th>
<td ><?php echo  htmlentities($rww['PostingDate']); ?></td>
</tr>
<?php }?>
                    <?php  } ?>
                    
                </table>

              </div>
		</section>
    
<?php include('includes/footer.php');?>


    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
  
  </body>
</html>
<?php } ?>
