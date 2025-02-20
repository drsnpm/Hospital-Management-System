<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty docObj}">
		<c:redirect url="doctorSignin.jsp" />
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
		<h3 class="text-center">Patient Details</h3>
		<c:if test="${not empty errorMsg}">
			<p class="fs-4 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<p class="fs-4 text-center text-success">${succMsg}</p>
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
					<th>Mobile</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Doctor d = (Doctor) session.getAttribute("docObj");
					AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
					List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
					if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="10" class="text-center text-danger">No Appointment found</td>
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
					<td><%=ap.getPatient_phno()%></td>
					<td style="color:
					    <% 
					        if ("Confirmed".equals(ap.getConfirmation())) { 
					            out.print("green"); 
					        } else if ("Canceled".equals(ap.getConfirmation())) { 
					            out.print("red"); 
					        } else { 
					            out.print("orange"); 
					        } 
					    %>;">
					    <%= ap.getConfirmation() %>
					</td>
					<td>
						<%
							if ("Pending".equals(ap.getConfirmation()) || "Canceled".equals(ap.getConfirmation())) {
						%> 
						<a href="doctorEditAppointment.jsp?id=<%=ap.getId()%>"
						class="btn btn-success btn-sm">Approve</a>
						<%
							} else {
					    %> 
					    <a href="doctorEditAppointment.jsp?id=<%=ap.getId()%>"
						class="btn btn-success btn-sm">Approved</a>
						<%
							}
					    %>
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
