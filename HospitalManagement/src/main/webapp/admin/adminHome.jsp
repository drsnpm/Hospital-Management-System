<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.PatientDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%
    if (session.getAttribute("adminObj") == null) {
        response.sendRedirect("adminSignin.jsp");
        return;
    }

    DoctorDao doctorDao = new DoctorDao(DBConnect.getConn());
    PatientDao patientDao = new PatientDao(DBConnect.getConn());
    AppointmentDao appointmentDao = new AppointmentDao(DBConnect.getConn());
    SpecialistDao specialistDao = new SpecialistDao(DBConnect.getConn());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>

    <div class="container p-5">
        <div class="row">

            <div class="col-md-4 p-3">
                <a href="adminManageSpecialist.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fa-solid fa-user-tie fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Specialist <br><%= specialistDao.countSpecialist() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminManageDoctor.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Doctor <br><%= doctorDao.countDoctor() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminManagePatient.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fa-solid fa-hospital-user fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Patient <br><%= patientDao.countPatient() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminManageAppointment.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Appointment <br><%= appointmentDao.countTotalAppointment() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminViewApprovedAppointment.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fa-solid fa-person-circle-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Approved Appointment <br><%= appointmentDao.countTotalApprovedAppointment() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminViewPendingAppointment.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fa-solid fa-spinner fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Pending Appointment <br><%= appointmentDao.countTotalPendingAppointment() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="adminViewCanceledAppointment.jsp" style="text-decoration: none;">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fa-solid fa-ban fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Canceled Appointment <br><%= appointmentDao.countTotalCanceledAppointment() %>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>
</body>
</html>
