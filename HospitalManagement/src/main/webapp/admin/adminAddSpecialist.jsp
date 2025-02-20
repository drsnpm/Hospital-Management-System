<%@page import="com.entity.Patient"%>
<%@page import="com.dao.PatientDao"%>
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
<title>Manage Patient</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<h1>admin add specialist</h1>
</body>
</html>