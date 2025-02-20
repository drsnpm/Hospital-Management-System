<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
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
<title>Admin Manage Doctor</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
	<h3 class="text-center">Manage Doctor</h3>
	<a href="adminAddDoctor.jsp" class="btn btn-success float-right">Add Doctor</a>
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
            	<th>Doctor Name</th>
            	<th>Qualification</th>
            	<th>Specialist</th>
            	<th>Doctor Email</th>
            	<th>Phone Number</th>
            	<th>Gender</th>
            	<th>Action</th>
            </tr>    
        </thead>
        <tbody>
        	<%
	        	DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
				List<Doctor> list = dao2.getAllDoctor();
				if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="8" class="text-center text-danger">No Doctor found</td>
			</tr>
			<%
			     } else {
			        for (Doctor p : list) {
			%>
			<tr>
				<td><%=p.getName()%></td>
				<td><%=p.getQualification() %></td>
				<td><%=p.getSpecialist() %></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getPhNo()%></td>
				<td><%=p.getGender()%></td>
				<td>
					<a href="adminUpdateDoctor.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-primary">Edit</a> 
					<a href="../adminDeleteDoctor?id=<%=p.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Doctor?');">Delete</a>
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