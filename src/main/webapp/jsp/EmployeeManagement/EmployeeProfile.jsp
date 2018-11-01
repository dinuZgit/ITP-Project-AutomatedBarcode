<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="/css/custom.css">
	<link rel="stylesheet" href="/css/glyphican.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/proper.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script type="/text/javascript" src="js/bootstrapValidator.js"></script>
	 	
	<title>EmployeeProfile</title>
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
	
	<form method="GET"  action="getEmployee" >
		<div class="form-group row my-5">
     					<label for="employeeCode" class="col-md-2 col-form-label" style="margin-left:320px ">Select Employee Id</label>
   						<div class="col-md-5">
      						<div class="input-group">
						  		<select class="custom-select form-control" name="employeeCode" id="employeeCode">
							    	<option value=-1>Choose Id</option>
							    	<%
							    		try
							    		{
							    			String query ="select empcode,firstName,lastName from employee";
							    			Class.forName("com.mysql.jdbc.Driver").newInstance();
							    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
							    			Statement stm = con.createStatement();
							    			ResultSet rs = stm.executeQuery(query);
							    			while(rs.next()){
							    				
							    				%><option value="<%=rs.getString("empcode")%>"><%=rs.getString("empcode") %> <%=rs.getString("firstName") %> <%=rs.getString("lastName") %></option>
							    				<% 	    				
							    			}
							    			
							    		}
							    		catch(Exception ex){
							    			
							    			ex.printStackTrace();
							    			
							    		}
							    								    	
							    	%>
						  		</select>
						  		<button type="submit"  class="col-md-4 btn btn-primary ml-3">Generate Content</button>
						  	</div>
						  	
    					</div>
    					
  					</div>
		
		
	</form>
	
	
	
	
	<form:form method="POST" action="getEditEmployee" modelAttribute="employee">
		<div class="row">
			<div class="col-md-5 offset-1">

				<div class="row">
					<div class="col" style=" margin-top: 120px">
						 <img src="data:image/png;base64,${employee.profilePhoto}" width="330px" height="242px">
					</div>
				</div>
				
				<div class="row" style=" margin-top: 95px">
					<div class="col my-5 text-center"><Span style="text-decoration: underline;"><h4>Contact Information</h4></Span></div>
				</div>

				<div class="form-group row">
					<label for="currentAddress" class="col-md-5 col-form-label ml-4">Current Address</label>
    				<div class="col-md-6">
      					<form:input type="text" path="currentAddress" class="form-control" readonly="true" name="currentAddress" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="homeAddress" class="col-md-5 col-form-label ml-4" >Home Address</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="homeAddress" readonly="true" name="homeAddress" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="city" class="col-md-5 col-form-label ml-4" >City</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="city" name="city" readonly="true" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="postalCode" class="col-md-5 col-form-label ml-4" >Postal Code</label>
    				<div class="col-md-6">
      					<form:input type="number" class="form-control" path="postalCode" readonly="true" name="postalCode" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="contactNo1" class="col-md-5 col-form-label ml-4" >Contact No1</label>
    				<div class="col-md-6">
      					<form:input type="number" class="form-control" path="contactNo1" readonly="true" name="contactNo1" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="contactNo2" class="col-md-5 col-form-label ml-4" >Contact No2</label>
    				<div class="col-md-6">
      					<form:input type="number" class="form-control" path="contactNo2" readonly="true" name="contactNo2" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="email" class="col-md-5 col-form-label ml-4" >Email</label>
    				<div class="col-md-6">
      					<form:input type="email" class="form-control" name="email" readonly="true" path="email" placeholder="System Generated"/>
      				</div>
      			</div>
      			
				<div class="row">
					<div class="col my-5 text-center"><Span style="text-decoration: underline;"><h4>Other Information</h4></Span></div>
				</div>

				<div class="form-group row">
					<label for="bikeNo" class="col-md-5 col-form-label ml-4" >Assigned Bike No</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" name="bikeNo" readonly="true" path="bikeNo" placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="form-group row">
					<label for="VehicleNo" class="col-md-5 col-form-label ml-4" >Vehicle No</label>
   					 <div class="col-md-6">
      					<form:input type="text" class="form-control" path="VehicleNo"  readonly="true" name="VehicleNo" placeholder="System Generated"/>
      				</div>
      			</div>

			</div>
			
			<div class="col-md-5">
			
				<div class="row">
					<div class="col my-5 text-center"><Span style="text-decoration: underline;"><h4>Personal Information</h4></Span></div>
				</div>

				<div class="form-group row">
					<label for="firstName" class="col-md-5 col-form-label ml-4">First Name</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="firstName" readonly="true" name="firstName" placeholder="System Generated"/>
      				</div>
      			</div>
      			
				<div class="form-group row">
					<label for="lastName" class="col-md-5 col-form-label ml-4">Last Name</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="lastName" readonly="true" name="lastName" placeholder="System Generated"/>
      				</div>
      			</div>
      			
    			<div class="form-group row">
					<label for="NIC" class="col-md-5 col-form-label ml-4">N.I.C NO</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="NIC" readonly="true" name="NIC" placeholder="System Generated"/>
      				</div>
      			</div>
    
        		<div class="form-group row">
					<label for="maritalStatus" class="col-md-5 col-form-label ml-4">Marital Status</label>
    				<div class="col-md-6">
      					<div class="input-group">
  							<form:select class="custom-select" path="maritalStatus" readonly="true" name="maritalStatus">
    							<option value="${employee.maritalStatus}" selected>${employee.maritalStatus}</option>
							</form:select>
    					</div>
    				</div>
    			</div>
    			
    			
    			<div class="form-group row">
					<label for="bank" class="col-md-5 col-form-label ml-4">Bank</label>
      				<div class="col-md-6">
      					<div class="input-group">
  							<form:select class="custom-select" path="bank" id="bank" name="bank" readonly="true">
								<option value="${employee.bank}" selected >${employee.bank}</option>
							</form:select>
    					</div>
    				</div>
    			</div>
    
				<div class="form-group row">
					<label for="bankAccountNo" class="col-md-5 col-form-label ml-4">Bank Account Number</label>
    				<div class="col-md-6">
      					<form:input type="number" class="form-control" path="bankAccountNo" readonly="true" name="bankAccountNo"  placeholder="System Generated"/>
      				</div>
      			</div>

				<div class="row">
					<div class="col my-5  text-center"><Span style="text-decoration: underline;"><h4>Company Information</h4></Span></div>
				</div>
				
				<div class="form-group row">
	 				<label for="employeeCode" class="col-md-5 col-form-label ml-4">Employee ID</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="employeeCode" name="employeeCode" readonly="true" placeholder="System Generated"/>
    				</div>
    			</div>
    			    
				<div class="form-group row">
					<label for="basicSalary" class="col-md-5 col-form-label ml-4">Basic Salary</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="basicSalary" readonly="true" name="basicSalary" placeholder="System Generated"/>
    				</div>
    			</div>
    			
    			<div class="form-group row">
					<label for="designation" class="col-md-5 col-form-label ml-4">Designation</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="designation" readonly="true" name="designation" placeholder="System Generated"/>
    				</div>
    			</div>
    			
    
  				
   			 	<div class="form-group row">
     				<label for="joinedDate" class="col-md-5 col-form-label ml-4">Joined Date</label>
    				<div class="col-md-6">
    					<form:input type="text" class="form-control" path="joinedDate" name="joinedDate" readonly="true" placeholder="System Generated"/>
    				</div>
    			</div>
		
				
				
				<div class="row" style="margin-top: 176px">
					<div class="col my-5 text-center"><Span style="text-decoration: underline;"><h4>System Login Information</h4></Span></div>
				</div>

				<div class="form-group row">
					<label for="userName" class="col-md-5 col-form-label ml-4">User Name</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="userName" readonly="true" name="userName" placeholder="System Generated"/>
    				</div>
    			</div>
    
				<div class="form-group row">
	 				<label for="password" class="col-md-5 col-form-label ml-4">Password</label>
    				<div class="col-md-6">
      					<form:input type="text" class="form-control" path="password" readonly="true" name="password" placeholder="System Generated"/>
    				</div>
    			</div>
			</div>
		</div>
	
		<div class="form-group row">
			
			
			<div class="col md-5 offset-4 mt-5">
      			<button type="submit" class="btn btn-primary">Edit</button>
    		</div>
    				
    		
      	</div>
      	
      	
  	</form:form>	
  
  		<div class="row">
      		<div class="col md-5 offset-4 mt-5">
      			<button type="button" class="btn btn-primary" onclick="window.open('ProfilePdf')">Generate Profile PDF </button>
     		</div>
    	</div>

  		
  	<noscript>Enable JavaScript in your browser</noscript>
  	
  	<c:set var="id" value="${employee.employeeCode}" scope="session"/>
 	
  	</div>
 
 	<footer class="page-footer" style="background-color:#5c5d60;">
		<div class="footer-copyright text-center py-3">Copyright � 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved </a></div>
  	</footer>
  	
</body>
</html>