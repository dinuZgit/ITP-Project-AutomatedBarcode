<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/custom.css">
<link rel="stylesheet" href="/css/glyphican.css">
<link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
<script type="text/javascript" src="/js/bootstrapValidator.js"></script>
<script src="/js/jquery.datetimepicker.full.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/proper.js"></script>
<script src="/js/bootstrap.js"></script>	
<script>
		function func1(){
		
		if(do.getElementById("y").checked){
			var val = do.geTelementById("y").value;
		}
		else if(do.getElementById("n").checked){
			var val = do.geTelementById("n").value;
		}
		}

</script>


<title>Installation Certificate</title>
</head>

<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0");  //Proxies

		if(session.getAttribute("USER")== null)
		{
			response.sendRedirect("signin");
		}
		
	%>
	<div class="container-fluid" style="height: 2000px">
		<div class="row" >
			<div class="header">
				<img src="Images/logo.png" style="width:12%;margin-left: 2%">
 				<font style="font-family: Good Times; font-size: 230%"><span style="color: white;margin-left: 2%;">Automated Barcode Solutions</span></font>
 				<a href="signout"><font style="font-family: Good Times; font-size: 100%"><span style="color: white;margin-left: 90%;">Sign Out</span></font></a>
 					<div class="navbar">
						<div class="dropdown">
  							<a href="dashemp" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Employee Management</button></a>
  							<div class="dropdown-content">
    							<a href="add">Add Employee</a>
							    <a href="remove">Remove Employee</a>
							    <a href="profile">Employee Profile</a>
      							<div class="dropdown-divider"></div>
							    <a href="payroll">Payroll System</a>
							    <a href="t&a">Time and Attendance System</a>
							    <a href="leave">Leaving System</a>
  							</div>  
  						</div>
						<div class="dropdown">
   							<a href="dashboard" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Client Management</button></a>
  							<div class="dropdown-content">
							    <a href="addClient">Add Client</a>
							    <a href="clientList">Client List</a>
							    <a href="branchList">Branch List</a>
							    <a href="newsLetter">Newsletter</a>
 							</div>
 						</div>
					 	<div class="dropdown">
					<a href="salesdashbord" style="color: black; text-decoration: none;">
						<button class="dropbtn dropdown-toggle">
							Sales Management
						</button></a>
						<div class="dropdown-content">
							    <a href="salesdashbord">Sales Dash Board</a>
							    <a href="viewclientorders">Today Orders</a>
							    <a href="viewclientorders2">Orders For Range</a>
							    <a href="viewsalesdetails">Sales Details</a>
							    <a href="viewinstallationcertificate">Installation Certificates</a>
  							</div>
					</div>
						<div class="dropdown">
   							<a href="orderdashboard" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Order Management</button></a>
						  	<div class="dropdown-content">
							    <a href="ClientOrder">ClientOrder</a>
							    <a href="SupplierOrder">SupplierOrder</a>
						       	<a href="ViewClientOrder">View Client Orders</a>
						       	<a href="ViewSupplierOrder">View Supplier Orders</a>
						       	<a href="AddSupplier">Add Supplier</a>
						       	<a href="ViewSupplier">View Suppliers</a>
						       	<div class="dropdown-divider"></div>
						  	</div>
						</div>
						<div class="dropdown">
   							<a href="invdash" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Inventory Management</button></a>
							<div class="dropdown-content">
							  <a href="dform">Register Device</a>
							    <a href="iform">Add to Inventory</a>
							    <div class="dropdown-divider"></div>
							    <a href="view">View Inventory</a>
						       	<a href="iview">View Devices</a>
							</div>
						</div>
						<div class="dropdown">
   							<a href="mainPaymentDashboard" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Payment Management</button></a>
						  	<div class="dropdown-content">
							    <a href="pettyCashRegister">Petty Cash</a>
						  	</div>
						</div>
						<div class="dropdown">
  				 			<a href="/faultdash" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Fault Management</button></a>
  							<div class="dropdown-content">
							    <a href="/form">Add Fault</a>
							    <a href="/pendingurgent">Pending urgent jobs</a>
							    <a href="/finished">Finished Jobs</a>
      							<div class="dropdown-divider"></div>
							    <a href="/detail">Jobs List</a>
							    <a href="/todayj">Today's Jobs</a>
							    <a href="/monreport">Get Monthly Report</a>
  							</div>
  						</div>
						<div class="dropdown">
   							<a href="vhome" style="color: black;text-decoration: none;"><button class="dropbtn dropdown-toggle">Visitor Management</button></a>
  							<div class="dropdown-content">
							    <a href="appform">Add appointment</a>
							    <a href="alog">Remove appointment</a>
					
      							<div class="dropdown-divider"></div>
							    <a href="alog"> Appointment Log</a>
							    <a href="evelog"> Event Log</a>
							
  							</div>
  						</div>
				</div>
			</div>
		</div>



		<div style="text-align: center; margin-left: 4%; margin-top: 7%">
			<h1 align="center">Installation Certificate</h1>
		</div>


		<div class="row mx-auto" style="margin-top: 1%; width: 50%">
			<div class="col-md-12">

				<form:form method="POST" modelAttribute="installationcertificate"
					class="form-horizontal" action="/saveins" id="icform1">


					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for=orID>Order ID<span class="glyphicon glyphicon-star" ></span></label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="text" class="form-control" path="orID" name="orID"
								id="ordId"   />
							<div class="has-error">
								<form:errors path="orID" class="help-inline" />
							</div>
						</div>

					</div>
					
					
					<!-- 
					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="clienId">Client ID</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="text" class="form-control" path="clienId" name="clienId"
								id="clienId" placeholder="C1" value="C1" />
							<div class="has-error">
								<form:errors path="clienId" class="help-inline" />
							</div>
						</div>
					</div>
-->
<!-- 

					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="techID">Technician ID</label>
						<div class="col-sm-4" style="margin-left: 12%;">
							<form:input type="text" class="form-control" path="techId" name="techId"
								id="techID" />
							<div class="has-error">
								<form:errors path="techId" class="help-inline" />
							</div>
						</div>
					</div>
					
 -->
<!--  					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="drivId">Driver ID</label>
						<div class="col-sm-4" style="margin-left: 12%;">

							<form:input type="text" class="form-control" path="drivId" name="drivId"
								id="drivId" placeholder="Emp1" value="Emp1" />
							<div class="has-error">
								<form:errors path="drivId" class="help-inline" />
							</div>
						</div>
					</div>

 -->
					<!-- 	<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="items">Items</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<textarea placeholder="Enter Items with serial number "
								id="items"></textarea>
						</div>
					</div>
				-->
					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="cableLen">Cable Length</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="number" step="0.01" class="form-control"
								path="cableLen" id="cableLen" placeholder="In Meters" name="cableLen"
								value="hide" min="0"/>
							<div class="has-error">
								<form:errors path="cableLen" class="help-inline" />
							</div>
						</div>

					</div>
					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="conduitLen">Conduit
							Length</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="number" step="0.01" class="form-control"
								path="conduitLen" id="conduitLen" name="conduitLen" placeholder="In Meters"
								value="hide" min="0"/>
							<div class="has-error">
								<form:errors path="conduitLen" class="help-inline" />
							</div>
						</div>
					</div>







					<div class="form-group row"
						style="margin-left: 25%; margin-top: 4%">
						<label style="width: 200px" for="swInstalled">Software
							Installed</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<input type="radio" id="y" value="Yes" name="swInstalled"
								path="swInstalled" onclick="func1();" 
							checked	/>Yes<br> <input
								type="radio" id="n" value="No" name="swInstalled"
								path="swInstalled" onclick="func1();" />No
							<form:textarea placeholder="Enter Description"
								path="swInstalledDescription" id="swInstalled" class="form-control" />
							

						</div>
					</div>

					<div class="form-group row"
						style="margin-left: 25%; margin-top: 4%">
						<label style="width: 200px" for="opTraining">Operator
							Training Provided</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<input type="radio" id="y" value="Yes" name="opTraining"
								path="opTraining" onclick="func1();" checked />Yes<br> <input
								type="radio" id="n" value="No" name="opTraining"
								path="opTraining" onclick="func1();" />No
							<form:textarea placeholder="Enter Description"
								path="opTrainingDescription" id="opTraining" class="form-control" />
							

						</div>
					</div>

					<div class="form-group row"
						style="margin-left: 25%; margin-top: 4%">
						<label style="width: 200px" for="fullyOperational">System
							Fully Operational</label>
						<div class="col-sm-4" style="margin-left: 12%">
							<input type="radio" id="y" value="Yes" name="fullyOperational"
								path="fullyOperational" onclick="func1();" checked/>Yes<br> <input
								type="radio" id="n" value="No" name="fullyOperational"
								path="fullyOperational" onclick="func1();" />No
							<form:textarea placeholder="Enter Description"
								path="fullyOperationalDescription" id="fullyOperational" class="form-control" />
							

						</div>
					</div>
				

					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="timeIn">Time in<span class="glyphicon glyphicon-star" ></span></label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="time" class="form-control" id="timeIn"
								path="timeIn" placeholder="hh/mm" value="hide" />
							<div class="has-error">
								<form:errors path="timeIn" class="help-inline" />
							</div>
						</div>
					</div>
					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="timeOut">Time out<span class="glyphicon glyphicon-star" ></span></label>
						<div class="col-sm-4" style="margin-left: 12%">
							<form:input type="time" class="form-control" id="timeOut"
								path="timeOut" placeholder="hh/mm" value="hide" />
							<div class="has-error">
								<form:errors path="timeOut" class="help-inline" />
							</div>
						</div>
					</div>



					<div class="form-group row"
						style="margin-left: 25%; margin-top: 2%">
						<label style="width: 200px" for="dateInstalled">Date<span class="glyphicon glyphicon-star" ></span></label>
						<div class="col-sm-4" style="margin-left: 12%;">
							<form:input type="date" class="form-control" id="dateInstalled" name="dateInstalled"
								path="dateInstalled" />
							<div class="has-error">
								<form:errors path="dateInstalled" class="help-inline" />
							</div>
						</div>
					</div>







					<div class="row" style="margin-left: 10%";>
						<div class="col text-center">
							<div class="form-actions ">
								<input type="submit" value="Add Items"
									class="btn btn-primary btn-sm">
							</div>
						</div>
					</div>

				</form:form>
				<script >
 
   			$(document).ready(function() {
			$('#icform1').bootstrapValidator({
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					
					orID: {
						validators: {
							
							notEmpty: {
								message: 'Enter First name'
							}
						}
					},
					}
				});
			});
   			
		</script>
		
			</div>
		</div>

	</div>


	<footer class="page-footer" style="background-color: #5c5d60;">
		<div class="footer-copyright text-center py-3">
			Copyright � 2018 Automated Barcode Solutions (Pvt) Ltd . All rights
			reserved </a>
		</div>
	</footer>

</body>
</html>