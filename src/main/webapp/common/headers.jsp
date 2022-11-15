<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.orm.hibernate5.SpringSessionContext"%>
<%@page import="javax.swing.Spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="img/coffee.ico" />
<title>CMS</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style2.css"
	rel="stylesheet">

<!-- bootstrap 5.2. not working with previous version on modal  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-expand-md navbar-fixed-top bg-success">
		<div class="container-fluid">
		 <div  > <!-- class="col-md-1 col-sm-1" -->
			<a class="navbar-brand"> <img src="img/cafe.ico" alt="" 
				width="30" height="30" class="d-inline-block align-text-center">
				
			</a>
			
			
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>                        
		      </button>
	     </div>   
		
		<div class="collapse navbar-collapse" id="myNavbar">
		 <div class="col-md-9 col-lg-10 col-sm-9">
				<ul class="navbar-nav me-auto justify-content-left">
					<li class="nav-item"><a class="nav-link"
						 href="/home">Dashboard</a></li>
						 
				<sec:authorize access="hasRole('CASHERMOF') or hasRole('CASHERPPA') or hasRole('CMANAGER')">		 
					<li class="nav-item "><a class="nav-link"
						 href="/sales">Sales</a></li>
				</sec:authorize>					

				<sec:authorize access="hasRole('MINI') or hasRole('CMANAGER')">
					<li class="nav-item "><a class="nav-link"
						 href="/batchItemRequests">Items Request</a></li>
				</sec:authorize>	
				
					<sec:authorize access="hasRole('MAIN') or hasRole('CMANAGER')">
					<li class="nav-item "><a class="nav-link"
						 href="/disposal">Disposal Request</a></li>	
					 </sec:authorize>
					
					<sec:authorize access="hasAnyRole('MAIN','CMANAGER','ACCOUNTANT')">
					 <li class="nav-item "><a class="nav-link"
						 href="purchaseBatchItems">Purchase Request</a></li>
					</sec:authorize>
					
									
				<sec:authorize access="hasRole('MAIN') ">
					<li class="nav-item "><a class="nav-link"
						 href="/itemPurchases">Record Purchase</a>
					</li>	
					<li class="nav-item dropdown "><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Approved </a>
						<ul class="dropdown-menu ">
							<li class="nav-item" style="margin:2px 2px; "><a class="nav-link txt2"
							 href="/approvedDisposal" style="color: DarkBlue">Approved Disposal</a></li>	
							<li class="nav-item" style="margin:2px 2px; "><a class="nav-link txt2"
							 href="/approvedBatchItemRequest" style="color: DarkBlue">Approved
								Items</a></li>	
						</ul>
					</li>	
						
					<li class="nav-item dropdown "><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Manage </a>
						<ul class="dropdown-menu ">
							<li class="nav-item" style="margin:2px 2px; "><a class="nav-link txt2"
						 		href="/items" style="color: DarkBlue">Items</a></li>
							<li class="nav-item" style="margin:2px 2px; "><a class="nav-link txt2"
							 href="/fixedassets" style="color: DarkBlue">Fixed Asset</a></li>
						</ul>
					</li>			
					
				
				</sec:authorize>
				
				<sec:authorize access="hasRole('CMANAGER')">
				<li class="nav-item "><a class="nav-link"
						 href="/foods">Manage Foods</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ADMIN')">
				
					<li class="nav-item "><a class="nav-link "
						 href="/users">Users Management</a></li>
				</sec:authorize>
					
				</ul>
			</div>
				
			<div class="col-md-2 col-sm-2 col-lg-2"> 
				<ul class="navbar-nav ms-auto  justify-content-right">
				<li class="nav-item dropdown "><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Reports </a>
						<ul class="dropdown-menu ">
							
							<li style="margin:3px 3px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/allSales">Sales</a></li>
								<li style="margin:3px 3px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/todaySales">Today Sales</a></li>
							<li style="margin:3px 3px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/allItemRequests">Item Request</a></li>
							<li style="margin:3px 3px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/allItemPurchase">Purchased Items</a></li>
							<li style="margin:3px 3px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/disposedItems">Disposed Items</a></li>
							<li style="margin:2px 2px;"><hr class="dropdown-divider"></li>
							<li style="margin:2px 2px;"><a class="nav-link txt2" style="color: DarkBlue"
								href="/home">Other</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<button class="dropbtn rounded-circle" ><%=SecurityContextHolder.getContext().getAuthentication().getName().toUpperCase().charAt(0)%></button>
						<div class="dropdown-content ">
							<a class="nav-link txt2" style="color: DarkBlue" 
								href="/logout-success"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
							<a class="nav-link txt2" style="color: DarkBlue"
								href="/changePassword"><i class="fa fa-key" aria-hidden="true"></i> Change Password</a>
						</div>
					</li>
					
		<!--   <li><%=SecurityContextHolder.getContext().getAuthentication().getAuthorities()%></li>
		-->		
			
				</ul>
				</div>
			</div>
		</div>

	</nav>
	

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
  <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}webjars/bootstrap/3.3.6/css/js/bootstrap.min.js"></script>
</body>
</html>