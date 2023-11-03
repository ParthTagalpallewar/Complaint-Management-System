<!DOCTYPE html>
<html lang="en">

<head>


    <!-- <style type="text/css">
 		*{
 			margin: 0;
 			padding: 0;
 			box-sizing: border-box;
 			font-family: sans-serif;
 		}

 		body {
 			
 			align-items: center;
 			justify-content: center;
 			height: 100px;
 		}
 		
 		
 		
        
 		
 		

 	
	</style>
	 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title> Report </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>

<body>
    <script type="text/javascript"></script>

    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 style="font-size:20px">Report Summary</style>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><a
                                        href="http://localhost/cms/admin/change-password.php"
                                        class="btn btn-primary">Back to Portal</a></b></h5></b>
                            <!-- <h5>Report Summary</h5> -->
                        </div>
                        <div class="card-body">



                            <form action="" method="GET">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label style="font-size:15px" for="">From Date</label>
                                            <input style="font-size:14px" type="date" name="from_date"
                                                placeholder="From Date">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label style="font-size:15px" for="">To Date</label>
                                            <input style="font-size:14px" type="date" name="to_date"
                                                placeholder="From Date">
                                        </div>

                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label style="font-size:15px" for="status">Status : </label>
                                            <select style="font-size:14px" name="status" id="color">
                                                <option value="any">Any</option>
                                                <option value="not process">Not Process</option>
                                                <option value="in process">In Process</option>
                                                <option value="closed">Closed</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="cl-md-4">
                                        <div class="form-group1">
                                            <!-- <label for="">Check</label><br> -->
                                            <button type="submit" name="search" value="search" onclick="search"
                                                class="btn btn-primary">Search</button>

                                            <button type="submit" name="generate" value="generate" onclick="generate"
                                                class="btn btn-primary">Generate</button>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="cl-md-4">
                                        </div>
                            </form>

                            <div class="card mt-3">
                                <div class="card-body">
                                    <h5>Complaint list</h5>
                                    <hr>
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>ID Code</th>
                                                <th>Name</th>
                                                <th>Complaint-Details</th>
                                                <th>status</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
									

 									if(isset($_GET['from_date']) && isset($_GET['to_date']))
 									{
 										if(strtotime($_GET['from_date']) < strtotime($_GET['to_date']))
 										{
											$from_date=$_GET['from_date'];
											$to_date=$_GET['to_date']; 
											$status = $_GET['status'];
											$con = mysqli_connect(
												"",
												"",
												"",
												"cms");

											if($status == "any"){
												$query = "SELECT tblcomplaints.complaintNumber, tblcomplaints.rollno, tblcomplaints.complaintDetails, tblcomplaints.status, users.fullName FROM tblcomplaints JOIN users ON tblcomplaints.rollno = users.rollno  WHERE tblcomplaints.regDate between '$from_date' and '$to_date'";
											}else if($status == "not process"){
												$query = "SELECT tblcomplaints.complaintNumber, tblcomplaints.rollno, tblcomplaints.complaintDetails, tblcomplaints.status, users.fullName FROM tblcomplaints JOIN users ON tblcomplaints.rollno = users.rollno  WHERE tblcomplaints.regDate between '$from_date' and '$to_date' and tblcomplaints.status IS NULL";
											}else{
												$query = "SELECT tblcomplaints.complaintNumber, tblcomplaints.rollno, tblcomplaints.complaintDetails, tblcomplaints.status, users.fullName FROM tblcomplaints JOIN users ON tblcomplaints.rollno = users.rollno  where tblcomplaints.regDate between '$from_date' and '$to_date' and tblcomplaints.status LIKE '%$status'";
											}

											$query_run = mysqli_query($con, $query);

											
											



											if(mysqli_num_rows($query_run)>0)
											{

												if(isset($_GET['generate'])){
													ob_end_clean();
													require('./fpdf.php');
													$pdf=new FPDF();

													$pdf->AddPage();
													
													$pdf->SetFont('Arial', 'B', 14);

													$pdf->Cell(50,10, "");

													$pdf->Cell(10,10, "Government Polytechnic, Amravati");
													$pdf->Ln();

													$pdf->Cell(70,0, "");
													$pdf->Cell(10,10, "Complaint Reports");
													$pdf->Ln();
													
													

													$pdf->Ln();
													$pdf->Ln();

													$pdf->SetFont('Arial', 'B', 12);
													$pdf->SetFillColor(193,229,252);

													$pdf->Cell(20, 10, "Id", 1, 0, 'C', true);
													$pdf->Cell(20, 10, "Roll No", 1, 0, 'C', true);
													$pdf->Cell(50, 10, "Name",  1, 0, 'C', true);
													$pdf->Cell(30, 10, "Status",  1, 0, 'C', true);
													$pdf->Cell(70, 10, "Complaint",  1, 0, 'C', true);
													$pdf->Ln();
													

													$h = 10;
													$pdf->SetFont('Arial', '', 10);
													foreach ($query_run as $row) {
														$pdf->Cell(20, $h, $row['complaintNumber'], 1, 0, 'C', false);
														$pdf->Cell(20, $h, $row['rollno'], 1, 0, 'C', false);
														$pdf->Cell(50, $h, $row['fullName'], 1, 0, 'C', false);
														$status = is_null($row['status']) ? "not process" : $row['status'];
														$pdf->Cell(30, $h, $status, 1, 0, 'C', false);
														$pdf->Cell(70, $h, $row['complaintDetails'], 1, 0, 'C', false);
														$pdf->Ln();
													
													}


													$pdf->Output();
												}
												

												
												foreach($query_run as $row) 
												{
													
													?>

                                            <td><?php echo $row['complaintNumber'];?></td>
                                            <td><?php echo $row['rollno'];?></td>
                                            <td><?php echo $row['fullName'];?></td>
                                            <td><?php echo $row['complaintDetails'];?></td>
                                            <?php $status = is_null($row['status']) ? "not process" : $row['status']; ?>
                                            <td><?php echo $status; ?></td>
                                            </tr>

                                            <?php



												}
											}
											else
											{
												
												?>

                                            <tr>
                                                <td colspan="4">
                                                    <h5>No record found</h5>
                                            </tr>
                                            <?php
											}

											}
											else
											{
												//echo "From date is greater than to-date. Please change";
												?>

                                            <tr>
                                                <td colspan="4">
                                                    <h5>Select date</h5>
                                            </tr>
                                            <?php
											}
 									}
 									?>

                                        </tbody>

                                    </table>

                                </div>



                            </div>

    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous">
    </script>

</body>

</html>