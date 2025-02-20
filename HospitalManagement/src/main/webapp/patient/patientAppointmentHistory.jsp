<%@page import="com.entity.Patient"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty patientObj }">
		<c:redirect url="patientSignin.jsp"></c:redirect>
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
		<h3 class="text-center">Appointment History</h3>
		<a href="patientAppointment.jsp" class="btn btn-success float-right">Make Appointment</a>
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
					<th>Appoint Date</th>
					<th>Reason</th>
					<th>Doctor Name</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Patient p = (Patient) session.getAttribute("patientObj");
					AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					List<Appointment> list = dao.getAllAppointmentByLoginPatient(p.getId());
					if (list.isEmpty()) {
				%>
				<tr>
							<td colspan="10" class="text-center text-danger">No Appointment found</td>
				</tr>
						<%
					     	} else {
					
					for (Appointment ap : list) {
						Doctor d = dao2.getDoctorById(ap.getDoc_id());
				%>
				<tr>
					<td><%=ap.getAppoint_date_time()%></td>
					<td><%=ap.getPatient_diseases() %></td>
					<td><%=d.getName()%></td>
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
							if ("Pending".equals(ap.getConfirmation())) {
						%> 
						<a href="../patientCancelAppointment?id=<%=ap.getId()%>"
						class="btn btn-sm btn-danger"
						onclick="return confirm('Are you sure you want to cancel this appointment?');">Cancel</a>
						<%
							} else {
						%> 
						<span class="text-muted">N/A</span> 
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