<%@page import="com.example.demo.controller.PaymentManagement.PaymentDashboardController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/custom.css">
	<script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
	<script src="/js/Chart.bundle.min.js"></script>
	 	
	<title>Pettycash Dashboard</title>
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
			
		<div class="row" style="margin-top: 150px;height: 300px">
			<div class="col-md-5" style="background-color: rgba(255,255,255,0.8);margin-left: 90px;border-radius: 30px">
				<div id="canvas-holder">
					<canvas id="pie-chart"></canvas>
				</div>
			</div>
			
		
			<div class="col-md-5" style="background-color: rgba(255,255,255,0.8);margin-left: 90px;border-radius: 30px">
				<div id="canvas-holder">
					<canvas id="bar-chart"></canvas>
				</div>
			</div>
			</div>
			
	<div class="row" style="margin-top: 150px;height: 300px">
	<div class="col-md-5" style="background-color: rgba(255,255,255,0.8);margin-left: 90px;border-radius: 30px">
				<div id="canvas-holder">
					<canvas id="bar-chart1"></canvas>
				</div>
			</div>
	</div>		
			
			
			
			
		<script type="text/javascript">

			new Chart(document.getElementById("pie-chart"), 
			{
    			type: 'doughnut',
    			data: 
    			{
      				labels: ["Cleared", "Not Cleared"],
      				datasets: 
      				[
        			{
          				label: "Total",
				        backgroundColor: ["#3e95cd", "#8e5ea2"],
				        data: [<%=PaymentDashboardController.chartl()%>,<%=PaymentDashboardController.chartm()%>]
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
        				text: 'Cheque Status',
        				fontSize:20,
        				fontStyle:'italic'
      				}
    			}
			})
	
			</script>
	
			
			<script type="text/javascript">
			var chartData = {
				labels: ["Cash","Cheque"],
		      	datasets: 
		      	[
		        {
		          	label: "Total",
		          	backgroundColor: ["#3e95cd", "#8e5ea2"],
		          	data: [<%=PaymentDashboardController.chartW()%>,<%=PaymentDashboardController.chartM()%>]
		        }
		      ]		
			};
		
			var ctx = document.getElementById("bar-chart");	

			var chartAttendance = new Chart(ctx, 
			{
		  		type: 'bar',
		  		data: chartData,
		    	options: 
		    	{
				    legend: 
				    { 
				    	display: false 
				    },
				    
				    scales: 
				    {
						yAxes: 
						[
						{
		                  display: true,
		                  ticks: 
		                  {
		                      beginAtZero: true,
		                      stepSize: 0,
		                      max:100000
		                  }
		              	}
						]
		      		},
		      
		      		title: 
		      		{
				        display: true,
				        text: 'Income By types',
				        fontSize:20,
				        fontStyle:'italic'
		      		}
		    	}
		  	}); 

		</script>
		
		<script type="text/javascript">
			var chartData = {
				labels: ["Income","Expenditure"],
		      	datasets: 
		      	[
		        {
		          	label: "Total",
		          	backgroundColor: ["#3e95cd", "#8e5ea2"],
		          	data: [<%=PaymentDashboardController.chartz()%>,<%=PaymentDashboardController.chartx()+PaymentDashboardController.chartemp()%>]
		        }
		      ]		
			};
		
			var ctx = document.getElementById("bar-chart1");	

			var chartAttendance = new Chart(ctx, 
			{
		  		type: 'bar',
		  		data: chartData,
		    	options: 
		    	{
				    legend: 
				    { 
				    	display: false 
				    },
				    
				    scales: 
				    {
						yAxes: 
						[
						{
		                  display: true,
		                  ticks: 
		                  {
		                      beginAtZero: true,
		                      stepSize: 0,
		                      max:1000000
		                  }
		              	}
						]
		      		},
		      
		      		title: 
		      		{
				        display: true,
				        text: 'Income and Expenditure Difference',
				        fontSize:20,
				        fontStyle:'italic'
		      		}
		    	}
		  	}); 

		</script>
		




		
	</div>


<br><br><br>

 
 	<footer class="page-footer" style="background-color:#5c5d60;">
		<div class="footer-copyright text-center py-3">Copyright � 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved</div>
  	</footer>
  	
</body>
</html>