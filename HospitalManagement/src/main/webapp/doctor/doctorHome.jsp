<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty docObj}">
		<c:redirect url="doctorSignin.jsp" />
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-5">

	<%
	Doctor d = (Doctor) session.getAttribute("docObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	AppointmentDao dao2 = new AppointmentDao(DBConnect.getConn());
	%>
	<div class="row">
			<div class="col-md-4 p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Doctor <br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4  p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br>
							<%=dao2.countAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-spinner fa-3x"></i><br>
						<p class="fs-4 text-center">
							Pending Appointment <br>
							<%=dao2.countPendingAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4  p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-person-circle-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Aprroved Appointment <br>
							<%=dao2.countApprovedAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4  p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-ban fa-3x"></i><br>
						<p class="fs-4 text-center">
							Canceled Appointment <br>
							<%=dao2.countPCanceledAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
	</div>
	</div>
</body>
</html>