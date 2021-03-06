<%@page import="com.example.demo.controller.SalesManagement.SalesDashBoardController"%>
<%@page import="com.example.demo.controller.SalesManagement.SalesController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="js/jquery.js"></script>
	<script src="js/proper.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/Chart.bundle.min.js"></script>
<style>
table {
    border-collapse: collapse;
   	
}

th {
    background-color: #0171a1;
    color: white;
}


th, td {
    text-align: center;
    padding: 8px;
}



tr:nth-child(odd) {background-color: #9fc1cf;}
tr:hover {background-color:#2bb2cf;}
</style>
	 	
	<title>Sales Dash Board</title>
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

 
 
 
 		<br><br>
		<h1 align="center">Pending Orders For Today</h1>
		<br>
	<div>

 
 <form:form>
			<div class="table-responsive">



				


				<table id="salesTable01"  align="center">
					<tr align="center">
						<th>Sales ID</th>
						<th>Order ID</th>
						<th>Technician  ID</th>
						<th>Driver ID</th>
						<th>Status</th>
						
					</tr>
	
					
					

					<c:forEach var="sales" items="${list}">
						<tr align="center">
							<td>${sales.salesCode}</td>
							<td>${sales.orID}</td>
							<td>${sales.techID}</td>
							<td>${sales.driverID}</td>
							<td>${sales.status}</td>
							
							
				
		</tr>
					</c:forEach>

				</table>
				
				
			</div>


		</form:form>
 
 </div>
<!-- Order Status 01-->	
		<div class="row" style="margin-top: 150px;height: 300px;">
			<div class="col-md-5" style="background-color: rgba(255,255,255,0.8);margin-left: 90px;border-radius: 30px">
				<div id="canvas-holder">
					<canvas id="doughnut-chart-order-staus"></canvas>
				</div>
			</div>
<!-- Order Delivery Type 01-->
			<div class="col-md-5 ml-5" style="background-color: rgba(255,255,255,0.8);border-radius: 30px">
				<div id="canvas-holder" >
					<canvas id="doughnut-chart-delivery-type"></canvas>
				</div>
			</div>
		</div>
		

<!-- Buttons 		
		<div class="row" style="margin-top:120px">
			<div class="col text-center">
				<button id="line" class="btn btn-primary" style="width: 200px">Generate Line Chart</button>
	  			<button id="bar" class="btn btn-primary" style="width: 200px">Generate Bar Chart</button>
				<button id="pie" class="btn btn-primary" style="width: 200px">Generate Pie Chart</button>
			</div>
		</div>
<!-- Other chart  
		<div class="row" style="margin-top:30px;margin-left:260px;height:400px">
			<div class="col-md-9 " style="background-color: rgba(255,255,255,0.8);border-radius: 30px">
				<div id="canvas-holder" >
					<canvas id="chartAttendance"></canvas>
				</div>
			</div>
		</div>
 -->
  
 
 
<!-- Order Status 02-->	
		<script type="text/javascript">

			new Chart(document.getElementById("doughnut-chart-order-staus"), 
			{
    			type: 'doughnut',
    			data: 
    			{
      				labels: ["Completed", "Pending"],
      				datasets: 
      				[
        			{
          				label: "Total",
				        backgroundColor: ["#3e95cd", "#8e5ea2"],
				        data: [<%=SalesDashBoardController.Doughnut_chartX()%>,<%=SalesDashBoardController.Doughnut_chartY()%>]
        			}
      				]
    			},
    			
    			options: 
    			{
      				legend: 
      				{ 
      					display: true,
    	  				position:'bottom'
    	  			},
      				title: 
      				{
        				display: true,
        				text: 'Today Orders',
        				fontSize:20,
        				fontStyle:'italic'
      				}
    			}
			})

		</script>
<!-- Order Delivery Type 02-->
		<script type="text/javascript">

		new Chart(document.getElementById("doughnut-chart-delivery-type"), 
		{
    		type: 'doughnut',
    		data: 
    		{
      			labels: ["By Technician","By Driver"],
      			datasets: 
      			[
        		{
		          label: "Total",
		          backgroundColor: ["#008B8B", "#DA70D6"],
		          data: [<%=SalesDashBoardController.Doughnut_chartA()%>,<%=SalesDashBoardController.Doughnut_chartB()%>]
        		}
      			]
    		},
    		options: 
    		{
      			legend: 
      			{ 
      				display: true,
      				position:'bottom' 
      			},
      			title: 
      			{
			        display: true,
			        text: 'Order Delivery Type',
			        fontSize:20,
			        fontStyle:'italic'
      			}
    		}
    	})

		</script>
		

		
	
	</div>
 
 	<footer class="page-footer" style="background-color:#5c5d60;">
		<div class="footer-copyright text-center py-3">Copyright � 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved</div>
  	</footer>
  	
</body>
</html>