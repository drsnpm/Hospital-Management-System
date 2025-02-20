<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <c:if test="${empty patientObj}">
        <c:redirect url="patientSignin.jsp"/>
    </c:if>
    <%@ include file="../component/navbar.jsp" %>
    <%@ include file="profileSidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">My Profile</h1>
                <hr class="my-4">
                <p>Name: ${patientObj.name}</p>
                <hr class="my-4">
                <p>Address: ${patientObj.address}</p>
                <hr class="my-4">
                <p>DOB: ${patientObj.dob}</p>
                <hr class="my-4">
                <p>Gender: ${patientObj.gender}</p>
                <hr class="my-4">
                <p>Email: ${patientObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${patientObj.phNo}</p>
            </div>
        </div> 
    </div>
</body>
</html>
