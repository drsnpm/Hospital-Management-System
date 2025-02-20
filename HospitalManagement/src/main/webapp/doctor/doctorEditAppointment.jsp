<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
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
	
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4" style="font-size: 2.5rem">Patient Details</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

						Appointment ap = dao.getAppointmentById(id);
						%>
						<form action="../doctorApproveAppointment" method="post">
							<div class="mb-3 row">
	                            <div class="col-6">
									<label>Patient Name</label> <input type="text" readonly
										value="<%=ap.getPatient_name()%>" class="form-control">
								</div>
								<div class="col-6">
									<label>Address</label> <input type="text" readonly
										value="<%=ap.getPatient_address()%>" class="form-control">
								</div>
							</div>
							
							<div class="mb-3 row">
	                            <div class="col-6">
									<label>Gender</label> <input type="text" readonly
										value="<%=ap.getPatient_gender()%>" class="form-control">
								</div>
								<div class="col-6">
								<label>Date of Birth</label> <input type="text" value="<%=ap.getPatient_dob()%>"
									readonly class="form-control">
								</div>
							</div>

							<div class="mb-3 row">
	                            <div class="col-6">
									<label>Mob No</label> <input type="text" readonly
									value="<%=ap.getPatient_phno()%>" class="form-control">
								</div>
								<div class="col-6">
									<label>Email</label> <input type="text" readonly
										value="<%=ap.getPatient_email()%>" class="form-control">
								</div>
							</div>
							<div class="mb-3 row">
	                            <div class="col-6">
									<label>Reason</label> <input type="text" readonly
										value="<%=ap.getPatient_diseases()%>" class="form-control">
								</div>
								<div class="col-6">
								    <label>Appointment Date</label>
								    <input type="datetime-local" 
								           value="<%= ap.getAppoint_date_time() %>" class="form-control">
								</div>
							</div>
							<div class="mb-3 row">
								<div class="col-6">
									<label>Confirmation</label> 
									<select class="form-control" name="comm" required>
										<option value="Pending">Pending</option>
										<option value="Confirmed">Approved</option>
										<option value="Canceled">Canceled</option>
									</select>
								</div>
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId()%>"> 
							<input type="hidden" name="did" value="<%=ap.getDoc_id()%>">

							<button class=" mt-3 btn btn-success col-md-6 offset-md-3">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>