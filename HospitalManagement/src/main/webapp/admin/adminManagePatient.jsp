<%@page import="com.entity.Patient"%>
<%@page import="com.dao.PatientDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminSignin.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Patient</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
	<h3 class="text-center">Manage Patient</h3>
	<a href="adminAddPatient.jsp" class="btn btn-success float-right">Add Patient</a>
	<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
	</c:if>
	<table class="table table-bordered" >
    	<thead>
        	<tr>
            	<th>Patient Name</th>
            	<th>Patient Email</th>
            	<th>Mobile Number</th>
            	<th>Gender</th>
            	<th>Date Of Birth</th>
            	<th>Address</th>
            	<th>Action</th>
            </tr>    
        </thead>
        <tbody>
        	<%
	        	PatientDao dao2 = new PatientDao(DBConnect.getConn());
				List<Patient> list = dao2.getAllPatient();
				if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="8" class="text-center text-danger">No passenger found</td>
			</tr>
			<%
			     } else {
			        for (Patient p : list) {
			%>
			<tr>
				<td><%=p.getName()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getPhNo()%></td>
				<td><%=p.getGender()%></td>
				<td><%=p.getDob()%></td>
				<td><%=p.getAddress()%></td>
				<td>
					<a href="adminUpdatePatient.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-primary">Edit</a> 
					<a href="../deletePatient?id=<%=p.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Patient?');">Delete</a>
				</td>
			</tr>
			<%
				}
			        }
			%>
        </tbody>
     </table>
     </div>
</body>
</html>