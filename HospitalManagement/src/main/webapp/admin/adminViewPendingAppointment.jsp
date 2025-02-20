<%@page import="com.entity.Patient"%>
<%@page import="com.dao.PatientDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h3 class="text-center">Manage Appointments</h3>
		<div class="dropdown mb-3">
			<a class="btn btn-primary dropdown-toggle" href="#"
				id="navbarDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">Appointment Status</a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item"
					href="<%= basePath %>/admin/adminManageAppointment.jsp">Manage
					Appointment</a> <a class="dropdown-item"
					href="<%= basePath %>/admin/adminViewApprovedAppointment.jsp">Approved
					Appointment</a> <a class="dropdown-item"
					href="<%= basePath %>/admin/adminViewPendingAppointment.jsp">Pending
					Appointment</a> <a class="dropdown-item"
					href="<%= basePath %>/admin/adminViewCanceledAppointment.jsp">Canceled
					Appointment</a>
			</div>
		</div>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Reason</th>
					<th>Appointment Date</th>
					<th>Address</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Mobile</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<%
				AppointmentDao dao2 = new AppointmentDao(DBConnect.getConn());
				List<Appointment> list = dao2.getAlPendingAppointment();
				if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="10" class="text-center text-danger">No
						Appointment found</td>
				</tr>
				<%
			     	} else {
					for (Appointment ap : list) { 
				%>
				<tr>
					<td><%=ap.getPatient_name()%></td>
					<td><%=ap.getPatient_diseases()%></td>
					<td><%=ap.getAppoint_date_time()%></td>
					<td><%=ap.getPatient_address()%></td>
					<td><%=ap.getPatient_gender()%></td>
					<td><%=ap.getPatient_dob()%></td>
					<td><%=ap.getPatient_phno()%></td>
					<td><%=ap.getPatient_email()%></td>

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