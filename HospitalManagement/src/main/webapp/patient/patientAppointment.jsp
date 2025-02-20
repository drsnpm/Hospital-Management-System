<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
	if (session.getAttribute("patientObj") == null) {
	    response.sendRedirect("patientSignin.jsp");
	    return;
	}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
	</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>
	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
                        <p class="fs-4 text-center" style="font-size: 2.5rem;">Make Appointment</p>
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <form action="${pageContext.request.contextPath}/patientAppointment" method="post">
                            <input type="hidden" name="patientid" value="${patientObj.id }">
							<input type="hidden" name="name" value="${patientObj.name }">
							<input type="hidden" name="address" value="${patientObj.address }">
							<input type="hidden" name="gender" value="${patientObj.gender }">
							<input type="hidden" name="dob" value="${patientObj.dob }">
							<input type="hidden" name="email" value="${patientObj.email }">
							<input type="hidden" name="phNo" value="${patientObj.phNo }">

                            <div class="mb-3 row">
	                            <div class="col-6">
	                                <label class="form-label">Appointment Date</label>
	                                <input type="datetime-local" class="form-control" required name="appoint_date">
                            	</div>
                            	<div class="col-6">
	                                <label class="form-label">Reason</label>
	                                <input required type="text" class="form-control" name="diseases">
                            	</div>
							</div>
                            <div class="mb-3">
                                <label class="form-label">Doctor</label>
                                <select required class="form-control" name="doctId">
                                    <option value="">--select--</option>
                                    <%
                                    DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor d : list) {
                                    %>
                                    <option value="<%=d.getId()%>"><%=d.getName()%> (<%=d.getSpecialist()%>)</option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <button class="btn bg-success text-white col-md-12">Submit</button>
                             </form>
                            </div>
                            </div>
                </div>
            </div>
        </div>

</body>
</html>
