<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <%@ page isELIgnored="false" %> 
   <%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%> 
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/glyphican.css">
	<link rel="stylesheet" href="/css/jquery.datetimepicker.min.css">
	<link rel="stylesheet" href="/css/custom.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/proper.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script type="text/javascript" src="/js/bootstrapValidator.js"></script>
	<script src="/js/jquery.datetimepicker.full.js"></script>
	 	
	<title>Client Order</title>
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

		
		
		<div class="row mx-auto">
			<div class="col-md-12">
					<h2 align="middle" style="margin-top: 2%">Client Order</h2>
			
				<form:form method="POST" modelAttribute="clientOrder" id="validateForm1" class="form-horizontal" action="submit">
				
  	<!-- 		<div class="form-group row" style="margin-left: 30%;margin-top: 3%">
    				<label class="control-label col-sm-2" for="id">Client ID</label>
    					<div class="col-sm-4">
      						<input type="text" name="id" class="form-control" id="id" placeholder="Enter Client ID" value="123" />
    					</div>
 	 			</div>
 	 			
 	 			 -->	
 	 			
 	 			
 	 			
 	 			
 	 			<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="id">Client Name</label>
    					<div class="col-sm-4"> 
							<select  name="id" class="form-control" id="id" >
      							<option value=""></option>
      							
      							<%
      							try
					    		{
					    			String query ="select clientID, clientName from client";
					    			Class.forName("com.mysql.jdbc.Driver").newInstance();
					    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
					    			Statement stm = con.createStatement();
					    			ResultSet rs = stm.executeQuery(query);
					    			while(rs.next()){
					    				
					    				%><option value="<%=rs.getString("clientID")%>"><%=rs.getString("clientName") %></option>
					    				<% 	    				
					    			}
					    			

					    		}
					    		catch(Exception ex){
					    			
					    			ex.printStackTrace();
					    			
					    		}
      							%>
      							</select>
						</div>
  				</div>
  				
 	 			
  				
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="location">Client Location</label>
    					<div class="col-sm-4"> 
      						<input type="text" name="location" class="form-control"  id="location" placeholder="Enter location" />
    					</div>
  				</div>
  				
  	<!-- 			<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="item">Item</label>
    					<div class="col-sm-4"> 
      						<input type="text" name="item" class="form-control" id="item" placeholder="Enter Item" data-validation="number" />
    					</div>
  				</div>
  		 -->		
  				
  				
  				
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="item">Device</label>
    					<div class="col-sm-4"> 
							<select  name="item" class="form-control" id="item" >
      							<option value=""></option>
      							
      							<%
      							try
					    		{
					    			String query ="select deviceID from device";
					    			Class.forName("com.mysql.jdbc.Driver").newInstance();
					    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
					    			Statement stm = con.createStatement();
					    			ResultSet rs = stm.executeQuery(query);
					    			while(rs.next()){
					    				
					    				%><option value="<%=rs.getString("deviceID")%>"><%=rs.getString("deviceID") %></option>
					    				<% 	    				
					    			}
					    			
					    		}
					    		catch(Exception ex){
					    			
					    			ex.printStackTrace();
					    			
					    		}
      							%>
      							</select>
						</div>
  				</div>
  				
  				
  				
  				
  				
  				
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="quantity">Quantity</label>
    					<div class="col-sm-4"> 
      						<input type="text" name="quantity" class="form-control" id="quantity" placeholder="Enter quantity" data-validation="number" />
    					</div>
  				</div>
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="exdate">Expected date</label>
    					<div class="col-sm-4"> 
      						<input type="date" name="exdate" class="form-control" id="exdate" placeholder="Enter expected date" />
    					</div>
  				</div>
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="paytyp">Payment type</label>
    					<div class="col-sm-4"> 
      						<select  name="paytyp" class="form-control" id="paytyp" >
      						<option value="Cheque">Cheque</option>
							  <option value="Cash">Cash</option>
							  
							</select>
    					</div>
  				</div>

 				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="deltyp">Delivery Type</label>
    					<div class="col-sm-4"> 
      						<input type="text" class="form-control" id="deltyp" name="deltyp" placeholder="Enter deltyp" />
    					</div>
  				</div>	 
  	
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="description">Description</label>
    					<div class="col-sm-4"> 
      						<input type="text" name="description" class="form-control" id="description" placeholder="Enter discription" />
    					</div>
  				</div>
  				<div class="form-group row"  style="margin-left: 30%;margin-top: 4%">
    				<label class="control-label col-sm-2" for="email">E-Mail</label>
    					<div class="col-sm-4"> 
      						<input type="text" name="email" class="form-control" id="email" placeholder="Enter email" />
    					</div>
  				</div>
	 			<div class="form-group" style="margin-left: 42%;margin-top: 5%"> 
    				<div class="col-sm-offset-2 col-sm-10">
      					<button type="submit" id="submit" class="btn btn-primary">Submit</button><br><br>
      					<button type="reset" class="btn btn-primary">Reset</button>
    				</div>
    				
 	 			</div>
				</form:form>
				
				
				
				
				
<script type="text/javascript">
 
   			$(document).ready(function() {
			$('#validateForm1').bootstrapValidator({
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					
					paytyp: {
						validators: {
							notEmpty: {
								message: 'Select payment type'
							}
						}
					},
					
					exdate: {
						validators: {
							notEmpty: {
								message: 'Select date'
							}
						}
					},
					
					id: {
						validators: {
							notEmpty: {
								message: 'Enter Client Id'
							}
							
							
						}
					},
		
					location: {
						validators: {
							notEmpty: {
								message: 'Enter location'
							}
							
						}
					},
					
					item: {
						validators: {
							notEmpty: {
								message: 'Enter item'
							}
						}
					},
					
					quantity: {
						validators: {
							notEmpty: {
								message: 'Enter quantity'
							}
						}
						
						
					},
					
					deltyp: {
						validators: {
							notEmpty: {
								message: 'Enter delevery type'
							}
						}
						
					},

					},
				submitHandler: function(form) {
			        var postData = new FormData($(form)),
			            formURL = $(form).attr("action"),
			            method = $(form).attr("method");
			        return false;
				
			    },
				});
			});
   			
		</script>
				
			</div>
  		</div>
	


  </div>
  <footer class="page-footer" style="background-color:#5c5d60;">
	<div class="footer-copyright text-center py-3">Copyright � 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved </div>
  </footer>

</body>

</html>