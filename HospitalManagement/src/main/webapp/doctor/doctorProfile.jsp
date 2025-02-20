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
    <c:if test="${empty docObj}">
        <c:redirect url="docterSignin.jsp"/>
    </c:if>
    <%@ include file="../component/navbar.jsp" %>
    <%@ include file="doctorProfileSidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">My Profile</h1>
                <hr class="my-4">
                <p>Name: ${docObj.name}</p>
                <hr class="my-4">
                <p>Qualification: ${docObj.qualification}</p>
                <hr class="my-4">
                <p>Specialist: ${docObj.specialist}</p>
                <hr class="my-4">
                <p>DOB: ${docObj.dob}</p>
                <hr class="my-4">
                <p>Gender: ${docObj.gender}</p>
                <hr class="my-4">
                <p>Email: ${docObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${docObj.phNo}</p>
            </div>
        </div> 
    </div>
</body>
</html>
